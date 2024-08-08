package com.paylocity.employee.karate.utilities;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class KarateTestExecutor {
    private static final LoggerSingleton logger = LoggerSingleton.getInstance();
    private static final String DEFAULT_PACKAGE_NAME = "com.clover.karate.tests";
    private static final int DEFAULT_THREAD_COUNT = 1;

    public KarateTestExecutor() {
    }

    public static void executeTests(String... tags) {
        String packageName = getPackageName();
        int threadCount = getThreadCount();
        executeTests(packageName, threadCount, tags);
    }

    private static String getPackageName() {
        String packageName = System.getenv("KARATE_TEST_PACKAGE");
        if (packageName == null) {
            packageName = System.getProperty("karate.test.package", DEFAULT_PACKAGE_NAME);
        }
        return packageName;
    }

    private static int getThreadCount() {
        String threadCountStr = System.getenv("KARATE_TEST_THREADS");
        if (threadCountStr == null) {
            threadCountStr = System.getProperty("karate.test.threads");
        }

        int threadCount = DEFAULT_THREAD_COUNT;
        if (threadCountStr != null) {
            try {
                threadCount = Integer.parseInt(threadCountStr);
            } catch (NumberFormatException e) {
                logger.logError("Invalid thread count, using default value: 1", e);
            }
        }
        return threadCount;
    }

    public static void executeTests(String packageName, int threadCount, String... tags) {
        Results results = Runner.path(new String[]{packageName})
                .tags(tags)
                .hook(new KarateSuiteHooks())
                .outputCucumberJson(true)
                .parallel(threadCount);
        if (results.getFeaturesTotal() > 0) {
            generateReport(results.getReportDir());
            Assertions.assertEquals(0, results.getFailCount(), results.getErrorMessages());
        } else {
            logger.logInfo("No tests were executed. Skipping report generation.");
        }
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Karate Test Report");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}