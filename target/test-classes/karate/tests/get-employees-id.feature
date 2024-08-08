@tests=employees
@tests=get-employees-id
Feature: GET /employees/{id}

  @test=get-employees-id
  Scenario Outline: GET /employees/{id} - <scenarioDescription>
    * call read(endpoints.getEmployeesId)

    Examples:
      |read('classpath:karate/data/get-employees-id-errors.json')|
