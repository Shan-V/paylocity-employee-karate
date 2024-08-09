# Paylocity Employee Karate

This is a Karate project for employee endpoints, covering all CRUD operations for the endpoints.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Running All Tests](#running-all-tests)
  - [Test Status and Adjustments](#test-status-and-adjustments)
- [Viewing Sample Test Reports](#viewing-sample-test-reports)

## Prerequisites

- **Java 17**: Ensure Java 17 is installed and `JAVA_HOME` is set. Verify the installation by running:
  ```sh
  java --version
  ```
  The output should be similar to:
  ```
  java 17 2021-09-14 LTS
  Java(TM) SE Runtime Environment (build 17.0.1+12-LTS-39)
  Java HotSpot(TM) 64-Bit Server VM (build 17.0.1+12-LTS-39, mixed mode, sharing)
  ```

- **Apache Maven 3.9.6**: Ensure Maven is installed and part of the `PATH`. Verify the installation by running:
  ```sh
  mvn --version
  ```
  The output should be similar to:
  ```
  Apache Maven 3.9.6 (ba123c91c5dc2b6b8f55ab19a5f543a7a5e5d8b2)
  Maven home: /usr/local/apache-maven
  Java version: 17, vendor: Oracle Corporation, runtime: /usr/local/java
  Default locale: en_US, platform encoding: UTF-8
  OS name: "linux", version: "5.10.16.3-microsoft-standard-WSL2", arch: "amd64", family: "unix"
  ```

## Setup

1. **Clone the repository** to your local machine.
2. **Navigate to the scripts directory**.
3. **Give execute permission to the scripts** (if not already set):
   ```sh
   chmod +x run_all_tests.sh
   chmod +x run_by_tag.sh
   chmod +x run_feature.sh
   ```

## Running All Tests

To run all the tests, use the `run_all_tests.sh` script from the project directory:

```sh
./scripts/run_all_tests.sh
```

If the tests run successfully, a `cucumber-html-reports` folder will be generated in the `target` folder.

To view the full report, open the `overview-features.html` file in a browser.

For detailed logs, please refer to the `karate-log`.

### Test Status and Adjustments

All the tests are passing because they are asserted against the actual behavior of the application. This setup is intended to make it easier to observe test execution and review test reports.

However, note that many tests are currently not passing. If the application behavior changes, you may need to update the `expectedStatus` and `expectedBody` in the files under the `karate/data/` folder to match the new expected outcomes.

## Viewing Sample Test Reports

If you only want to see the test report, there is a sample `cucumber-html-reports` folder from previous test runs. Please download the `cucumber-html-reports` folder.

Then, open the `overview-features.html` file in a browser to view the report.