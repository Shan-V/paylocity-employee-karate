@setup
Feature: Alias setup

  Background:
    * def karateClasspath = 'classpath:karate/'
    * def endpointsPath = karateClasspath + 'endpoints/'
    * def schemasPath = karateClasspath + 'schemas/'

    * def employeeEndpoints = endpointsPath + 'employees.feature'

  @alias=endpoint
  Scenario: Endpoint setup
    * def deleteEmployeesId = employeeEndpoints + '@endpoint=delete-employees-id'
    * def getEmployeesId = employeeEndpoints + '@endpoint=get-employees-id'
    * def getEmployees = employeeEndpoints + '@endpoint=get-employees'
    * def postEmployees = employeeEndpoints + '@endpoint=post-employees'
    * def putEmployeesId = employeeEndpoints + '@endpoint=put-employees-id'

  @alias=requestSchema
  Scenario: Request Schemas
    * def postEmployees = schemasPath + 'request/post-employees.json'
    * def putEmployees = schemasPath + 'request/put-employees.json'

  @alias=responseSchema
  Scenario: Response Schemas
    * def postEmployees = schemasPath + 'response/post-employees.json'
    * def putEmployees = schemasPath + 'response/put-employees.json'
    * def getEmployees = schemasPath + 'response/get-employees.json'
