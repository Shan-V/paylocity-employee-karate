@tests=employees
@tests=get-employees
Feature: GET /employees

  @test=get-employees
  Scenario: GET /employees
    * def expectedResponse = read(responseSchemas.getEmployees)
    * call read(endpoints.getEmployees)
    * match response  == "#[] expectedResponse"
