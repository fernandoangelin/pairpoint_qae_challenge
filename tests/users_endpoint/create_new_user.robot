*** Settings ***
Documentation    This file contains the tests for create a new user

Resource    ../../keywords/common/key_common.resource
Resource    ../../keywords/data_creation/key_data_creation.resource
Resource    ../../keywords/users_endpoint/key_users_endpoint.resource

Suite Setup    Setup Users Endpoint URI

Test Tags    all-tests    create-user

*** Test Cases ***
Create A New User Through API Full Body
    [Documentation]    This test creates a new user through the API with a full body
    ...                Full body is with name and job
    ...                The response should have status code 201 and the reason Created

    ${new_user_data}    Create New User Body Data    name=morpheus    job=leader

    Send A POST Request To Specific Endpoint    ${USERS_ENDPOINT_URI}    ${new_user_data}
    Validate Response Info    expected_status_code=201    expected_reason=Created
    Validate Create New User Response Body    user_data=${new_user_data}    full_body=Yes

Create A New User Through API Only Name
    [Documentation]    This test creates a new user through the API with a body only with name
    ...                The response should have status code 201 and the reason Created

    ${new_user_data}    Create New User Body Data    name=morpheus

    Send A POST Request To Specific Endpoint    ${USERS_ENDPOINT_URI}    ${new_user_data}
    Validate Response Info    expected_status_code=201    expected_reason=Created
    Validate Create New User Response Body    user_data=${new_user_data}    full_body=Only Name

Create A New User Through API Only Job
    [Documentation]    This test creates a new user through the API with a body only with job
    ...                The response should have status code 201 and the reason Created

    ${new_user_data}    Create New User Body Data    job=leader

    Send A POST Request To Specific Endpoint    ${USERS_ENDPOINT_URI}    ${new_user_data}
    Validate Response Info    expected_status_code=201    expected_reason=Created
    Validate Create New User Response Body    user_data=${new_user_data}    full_body=Only Job

Create A New User Through API No Body
    [Documentation]    This test creates a new user through the API without a body
    ...                The response should have status code 201 and the reason Created

    Send A POST Request To Specific Endpoint    ${USERS_ENDPOINT_URI}
    Validate Response Info    expected_status_code=201    expected_reason=Created
    Validate Create New User Response Body

Create A New User Through API Invalid Body
    [Documentation]    This test validates that a new user can't be created through the API with a invalid body
    ...                An invalid body has a invalid JSON format
    ...                The response should have status code 400 and the reason Bad Request

    ${new_user_data}    Set Variable    {

    Send A POST Request To Specific Endpoint    ${USERS_ENDPOINT_URI}    ${new_user_data}
    Validate Response Info    expected_status_code=400    expected_reason=Bad Request
