@tests=employees
@tests=post-employees
Feature: POST /employees

  @test=post-employees
  Scenario: POST /employees
    # Create Employee
    * def expectedPostResponse = read(responseSchemas.postEmployees)
    * def requestBody = { firstName:"Shawn",lastName:"Rs",dependants: 2}
    * call read(endpoints.postEmployees)
    * match response == expectedPostResponse
    * def employeeId = response.id

    # Retrieve Employee by Id
    * def expectedGetResponse = read(responseSchemas.getEmployees)
    * call read(endpoints.getEmployeesId)
    * match response == expectedGetResponse

    # Retrieve all Employees & make sure created employee is exist
    * call read(endpoints.getEmployees)
    * match response  == "#[] expectedGetResponse"
    * assert response.find(x => x.id == employeeId) != null

    # Update Employee
    * def requestBody = { firstName:"Shawn-updated",lastName:"Rs-updated",dependants: 2, id: "#(employeeId)"}
    * call read(endpoints.putEmployeesId)
    * match response == expectedPostResponse
    * assert response.firstName === 'Shawn-updated'
    * assert response.lastName === 'Rs-updated'

    # Delete Employee
    * call read(endpoints.deleteEmployeesId)

  @test=post-employees-errors @progress
  Scenario Outline: POST /Employees request body validation tests - <scenarioDescription>
    * call read(endpoints.postEmployees)
    * match response == expectedResponse

    Examples:
      | read('classpath:karate/data/post-employees-errors.json') |

