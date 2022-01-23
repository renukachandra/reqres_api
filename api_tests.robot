*** Settings ***
Library          RequestsLibrary

*** Variables ***
${users_URL}    https://reqres.in/api/users
${registration_URL}    https://reqres.in/api/register
${login_URL}    https://reqres.in/api/login

*** Test Cases ***
POST User registration should be successful
    &{data}=    Create dictionary  email=eve.holt@reqres.in  password=pistol
    ${response}=    POST  ${registration_URL}  json=${data}  expected_status=200

POST User registration should be unsuccessful
    &{data}=    Create dictionary  email=eve.holt@reqres.in
    ${response}=    POST  ${registration_URL}  json=${data}  expected_status=400

POST User login should be successful
    &{data}=    Create dictionary  email=eve.holt@reqres.in  password=cityslicka
    ${response}=    POST  ${login_URL}  json=${data}  expected_status=200

POST User login should be unsuccessful
    &{data}=    Create dictionary  email=eve.holt@reqres.in
    ${response}=    POST  ${login_URL}  json=${data}  expected_status=400

GET All the users on given page should be listed
    ${page}=  set variable  2
    ${response}=    GET  ${users_URL}  params=page=${page}  expected_status=200

PUT User creation should be successful
    &{data}=    Create dictionary  name=morpheus  job=leader
    ${response}=    PUT  ${users_URL}  json=${data}  expected_status=200

DELETE User deletion should be unsuccessful
    ${response}=    DELETE  ${users_URL}/2  expected_status=204
