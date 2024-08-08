package com.paylocity.employee.karate.utilities;

import com.intuit.karate.Logger;
import lombok.Getter;

import java.util.Arrays;
import java.util.stream.Stream;

@Getter
public class LoggerSingleton {
    @Getter
    private static final LoggerSingleton instance = new LoggerSingleton();
    private static final int PADDING = 4;
    private final Logger logger = new Logger();

    private LoggerSingleton() {
    }

    public void logInfo(String message) {
        this.logger.info(message, new Object[0]);
    }

    public void logDebug(String message) {
        this.logger.debug(message, new Object[0]);
    }

    public void logError(String message, Exception exception) {
        this.logger.error(message, new Object[]{exception});
    }

    public void failWithError(String message, Exception exception) {
        if (exception != null) {
            this.logger.error(message, new Object[]{exception});
        } else {
            this.logger.error(message, new Object[0]);
        }
        throw new AssertionError(message);
    }

    public static void logBannerText(String text) {
        String[] lines = text.split("\n");
        int maxLength = Arrays.stream(lines).mapToInt(String::length).max().orElse(0);
        String border = "*".repeat(maxLength + PADDING);
        StringBuilder banner = new StringBuilder(border).append("\n");

        for (String line : lines) {
            banner.append("* ").append(line)
                    .append(" ".repeat(maxLength - line.length())).append(" *\n");
        }

        banner.append(border);
        Stream.of(banner.toString().split("\n"))
                .forEach(LoggerSingleton.getInstance()::logInfo);
    }

}