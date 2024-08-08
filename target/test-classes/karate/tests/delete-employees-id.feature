@tests=employees
@tests=delete-employees
Feature: DELETE /employees/{id}


  @test=delete-employees-errors
  Scenario Outline: DELETE /employees errors - <scenarioDescription>
    * call read(endpoints.deleteEmployeesId)

    Examples:
      |read('classpath:karate/data/delete-employees-id-errors.json')|
