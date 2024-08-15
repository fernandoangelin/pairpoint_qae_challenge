*** Settings ***
Documentation    This file contains the tests for get a user by id and all users

Resource    ../../keywords/common/key_common.resource
Resource    ../../keywords/users_endpoint/key_users_endpoint.resource

Suite Setup    Setup Users Endpoint URI

Test Tags    all-tests   get-user

*** Variables ***
${VALID_ID}    2
${INVALID_ID}    2222
${VALID_PAGE}    2
${EMPTY_PAGE}    2222

*** Test Cases ***
Get User By Id With A Valid Id
    [Documentation]    This test validates if a user is returned when a valid id is used in the request

    Send A GET Request To Specific Endpoint    ${USERS_ENDPOINT_URI}    ${VALID_ID}
    Validate Response Info    expected_status_code=200    expected_reason=OK
    Validate Get User By Id Response Body

Get User By Id With An Invalid Id
    [Documentation]    This test validates if no user is returned when an invalid id is used in the request

    Send A GET Request To Specific Endpoint    ${USERS_ENDPOINT_URI}    ${INVALID_ID}
    Validate Response Info    expected_status_code=404    expected_reason=Not Found
    Validate Get User By Id Response Body

Get All Users
    [Documentation]    This test validates if the users are correctly returned
    ...                It should return the first page results

    Send A GET Request To Specific Endpoint    ${USERS_ENDPOINT_URI}
    Validate Response Info    expected_status_code=200    expected_reason=OK
    Validate Get Users Response Body

Get All Users From Second Page
    [Documentation]    This test validates if the users are correctly returned
    ...                It should return the second page results

    Send A GET Request To Specific Endpoint    ${USERS_ENDPOINT_URI}    page=${VALID_PAGE}
    Validate Response Info    expected_status_code=200    expected_reason=OK
    Validate Get Users Response Body    page=${VALID_PAGE}

Get All Users From A Empty Page
    [Documentation]    This test validates if no users are returned
    ...                It should return the page with no data

    Send A GET Request To Specific Endpoint    ${USERS_ENDPOINT_URI}    page=${EMPTY_PAGE}
    Validate Response Info    expected_status_code=200    expected_reason=OK
    Validate Get Users Response Body    page=${EMPTY_PAGE}
