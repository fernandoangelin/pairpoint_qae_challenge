*** Settings ***
Documentation    This file contains the tests for create a new user

Resource    ../../keywords/data_creation/key_data_creation.resource
Resource    ../../keywords/users_endpoint/key_users_endpoint.resource

Suite Setup    Setup Users Endpoint URI

Test Tags    all-tests

*** Test Cases ***
Create A New User Through API Full Body
    [Documentation]
    [Tags]    create-user

    ${new_user_data}    Create New User Body Data    name=morpheus    job=leader

    Log To Console    ${new_user_data}
    Log To Console    ${USERS_ENDPOINT_URI}
    Send A POST Request To Users Endpoint