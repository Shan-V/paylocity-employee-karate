@setup
Feature: /employees endpoints

  Background:
    * url apiUrl

  @endpoint=delete-employees-id
  Scenario: DELETE /employees/{id}
    Given path 'Prod', 'api', 'employees', employeeId
    And headers karate.get('requestHeaders', defaultAuth)
    When method delete
    Then match responseStatus == karate.get('expectedStatus', 200)

  @endpoint=get-employees-id
  Scenario: GET /employees/{id}
    Given path 'Prod','api', 'employees', employeeId
    And headers karate.get('requestHeaders', defaultAuth)
    And headers karate.get('requestParams', {})
    When method get
    Then match responseStatus == karate.get('expectedStatus', 200)

  @endpoint=get-employees
  Scenario: GET /employees
    Given path 'Prod','api', 'employees'
    And headers karate.get('requestHeaders', defaultAuth)
    And headers karate.get('requestParams', {})
    When method get
    Then match responseStatus == karate.get('expectedStatus', 200)

  @endpoint=post-employees
  Scenario: POST /employee
    Given path 'Prod','api', 'employees'
    And headers karate.get('requestHeaders', defaultAuth)
    And request karate.get('requestBody', {})
    When method post
    Then match responseStatus == karate.get('expectedStatus', 200)

  @endpoint=put-employees-id
  Scenario: PUT /employees/{id}
    Given path 'Prod','api', 'employees'
    And headers karate.get('requestHeaders', defaultAuth)
    And request karate.get('requestBody', {})
    When method put
    Then match responseStatus == karate.get('expectedStatus', 200)