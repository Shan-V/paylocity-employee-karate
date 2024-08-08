# Test Automation Scripts

This directory contains scripts to facilitate running Karate test suites with different configurations and options. Below are the descriptions and usage instructions for each script.

## Scripts

### 1. Run All Tests Script

**Script Name:** `run_all_tests.sh`

**Description:**  
This script runs the entire test suite. By default, it uses the `dev1` environment unless another one is specified.

**Usage:**  
To run the tests with the default `dev1` environment:
```sh
./run_all_tests.sh
```
To run the tests with a specified environment (e.g., `stg1`):
```sh
./run_all_tests.sh stg1
```

---

### 2. Run Tests by Tag Script

**Script Name:** `run_by_tag.sh`

**Description:**  
This script runs tests that match a specific tag. If no tag is specified, it defaults to running tests with the `@progress` tag. An environment can also be specified; otherwise, it defaults to `dev1`.

**Usage:**  
To run tests with the default `@progress` tag and `dev1` environment:
```sh
./run_by_tag.sh
```
To run tests with a specific tag (e.g., `@smoke`) and default environment:
```sh
./run_by_tag.sh @smoke
```
To run tests with a specific tag and a specific environment (e.g., `@smoke` tag and `stg1` environment):
```sh
./run_by_tag.sh @smoke stg1
```

---

### 3. Run Specific Feature File Script

**Script Name:** `run_feature.sh`

**Description:**  
This script runs a specified feature file. If no feature file is provided, it runs all feature files. It accepts an optional environment parameter, which defaults to `dev1` if not provided.

**Usage:**  
To run all feature files with the default `dev1` environment:
```sh
./run_feature.sh
```
To run a specific feature file (e.g., `welcome.feature`) with the default environment:
```sh
./run_feature.sh src/test/java/com/clover/oloplatform/test/karate/welcome.feature
```
To run a specific feature file with a specified environment (e.g., `welcome.feature` with `stg1` environment):
```sh
./run_feature.sh src/test/java/com/clover/oloplatform/test/karate/welcome.feature stg1
```

## Prerequisites

- Make sure Maven is installed on your system and is part of the PATH.
- Ensure you have the necessary permissions to execute the scripts.

## Setup

1. Clone the repository to your local machine.
2. Navigate to the `scripts` directory.
3. Give execute permission to the scripts (if not already set):
```sh
chmod +x run_all_tests.sh
chmod +x run_by_tag.sh
chmod +x run_feature.sh
```

Feel free to reach out to the QA automation team if you have any questions or need assistance with the scripts.