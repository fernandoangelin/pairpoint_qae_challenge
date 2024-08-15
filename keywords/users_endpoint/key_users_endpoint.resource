*** Settings ***
Documentation    This file contains the keywords for testing the /users endpoint

Resource    ../../variables/var_common.resource
Resource    ../../variables/jsonpath/users_jsonpath.resource

Library    REST

*** Keywords ***
Setup Users Endpoint URI
    [Documentation]    This keyword creates and set the URI for /users endpoint

    VAR    ${USERS_ENDPOINT_URI}    ${BASE_URL}${USERS_ENDPOINT}    scope=SUITE

Validate Create New User Response Body
    [Documentation]    This keyword validates the format and the content of the response when creating a new user
    [Arguments]    ${user_data}=${None}    ${full_body}=${None}

    IF    "${full_body}" == "Yes"
        ${actual_name}    Output    ${CREATE_USER_NAME_JSONPATH}    also_console=false
        ${actual_job}    Output    ${CREATE_USER_JOB_JSONPATH}    also_console=false
        String    ${CREATE_USER_NAME_JSONPATH}
        String    ${CREATE_USER_JOB_JSONPATH}
        Should Be Equal As Strings    ${actual_name}    ${user_data.name}
        Should Be Equal As Strings    ${actual_job}    ${user_data.job}
    ELSE IF    "${full_body}" == "Only Job"
        ${actual_job}    Output    ${CREATE_USER_JOB_JSONPATH}    also_console=false
        String    ${CREATE_USER_JOB_JSONPATH}
        Should Be Equal As Strings    ${actual_job}    ${user_data.job}
    ELSE IF    "${full_body}" == "Only Name"
        ${actual_name}    Output    ${CREATE_USER_NAME_JSONPATH}    also_console=false
        String    ${CREATE_USER_NAME_JSONPATH}
        Should Be Equal As Strings    ${actual_name}    ${user_data.name}
    END

    String    ${CREATE_USER_ID_JSONPATH}
    String    ${CREATE_USER_CREATEDAT_JSONPATH}

Validate Get User By Id Response Body
    [Documentation]    This keyword validates the format of the response when getting a user

    ${response}    Output    response body    also_console=false
    
    IF    "${response}" != "{}"
        Integer    ${GET_USER_BY_ID_ID_JSONPATH}
        String    ${GET_USER_BY_ID_EMAIL_JSONPATH}
        String    ${GET_USER_BY_ID_FIRST_NAME_JSONPATH}
        String    ${GET_USER_BY_ID_LAST_NAME_JSONPATH}
        String    ${GET_USER_BY_ID_AVATAR_JSONPATH}
        String    ${GET_USER_BY_ID_SUPPORT_URL_JSONPATH}
        String    ${GET_USER_BY_ID_SUPPORT_TEXT_JSONPATH}
    ELSE
        Should Be Empty    ${response}
    END

Validate Get Users Response Body
    [Documentation]    This keyword validates the format of the response when getting all users
    [Arguments]    ${page}=${1}

    ${response}    Output    response body    also_console=false

    IF    "${response}" != "{}"
        Integer    ${GET_USERS_PAGE}
        Integer    ${GET_USERS_PER_PAGE}
        Integer    ${GET_USERS_TOTAL}
        Integer    ${GET_USERS_TOTAL_PAGES}
        Array    ${GET_USERS_DATA}

        ${users_page}    Output    ${GET_USERS_PAGE}    also_console=false
        Should Be True    ${page} == ${users_page}

        ${users_per_page}    Output    ${GET_USERS_PER_PAGE}    also_console=false
        ${users_data}    Output    ${GET_USERS_DATA}    also_console=false
        ${users_data_size}    Get Length    ${users_data}

        Should Be True    ${users_data_size} <= ${users_per_page}

    ELSE
        Should Be Empty    ${response}
    END
