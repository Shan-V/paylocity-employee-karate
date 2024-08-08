package com.paylocity.employee.karate.utilities;

import com.intuit.karate.RuntimeHook;
import com.intuit.karate.Suite;

import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.lang.management.MemoryUsage;

public class KarateSuiteHooks implements RuntimeHook {
    private static final LoggerSingleton logger = LoggerSingleton.getInstance();
    private static final int MB = 1024 * 1024;
    private static final int SECONDS_IN_MINUTE = 60;
    private static final int SECONDS_IN_HOUR = 3600;
    private long startTime;
    private MemoryMXBean memoryMXBean;

    public KarateSuiteHooks() {
    }

    @Override
    public void beforeSuite(Suite suite) {
        this.startTime = System.currentTimeMillis();
        this.memoryMXBean = ManagementFactory.getMemoryMXBean();
        logger.logInfo(String.format("Tests have started in %s environment", suite.env));
        this.logMemoryUsage();
    }

    @Override
    public void afterSuite(Suite suite) {
        this.logMemoryUsage();
        long endTime = System.currentTimeMillis();
        long totalTimeMillis = endTime - this.startTime;
        String timeStr = formatDuration(totalTimeMillis);
        logger.logInfo("Tests have been finished. Total time: " + timeStr + " (" + totalTimeMillis + " ms)");
    }

    private void logMemoryUsage() {
        MemoryUsage heapMemoryUsage = this.memoryMXBean.getHeapMemoryUsage();
        long usedMemoryInMb = heapMemoryUsage.getUsed() / MB;
        logger.logInfo(String.format("Current memory usage: %d MB", usedMemoryInMb));
    }

    private String formatDuration(long millis) {
        long totalSeconds = millis / 1000;
        long hours = totalSeconds / SECONDS_IN_HOUR;
        long minutes = (totalSeconds % SECONDS_IN_HOUR) / SECONDS_IN_MINUTE;
        long seconds = totalSeconds % SECONDS_IN_MINUTE;

        StringBuilder timeStr = new StringBuilder();
        if (hours > 0) {
            timeStr.append(hours).append("hr ");
        }
        if (minutes > 0 || hours > 0) {
            timeStr.append(minutes).append("min ");
        }
        timeStr.append(seconds).append("sec");

        return timeStr.toString();
    }
}