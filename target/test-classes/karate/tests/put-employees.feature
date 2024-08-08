@tests=employees
@tests=put-employees
Feature: PUT /employees/{id}

  Background:
    * callonce read(endpoints.postEmployees) {expectedStatus: 200, requestBody: { firstName:"Killy",lastName:"Williams",dependants: 2}}
    * def employeeId = response.id
    * configure afterFeature = function() { karate.call(endpoints.deleteEmployeesId, {employeeId: employeeId, expectedStatus: 200})}


@test=put-employees-errors
  Scenario Outline: PUT /employees errors - <scenarioDescription>
  * call read(endpoints.putEmployeesId) {expectedStatus: <expectedStatus>, requestBody: <requestBody>}
  * match response == expectedResponse
  Examples:
    |read('classpath:karate/data/put-employees-id-errors.json')|