*** Settings ***
Documentation    This file contains the keywords for testing the /users endpoint

Resource    ../../variables/var_common.resource

Library    REST

*** Keywords ***
Setup Users Endpoint URI
    [Documentation]    This keyword creates and set the URI for /users endpoint

    VAR    ${USERS_ENDPOINT_URI}    ${BASE_URL}${USERS_ENDPOINT}    scope=SUITE

Send A POST Request To Users Endpoint
    [Documentation]
    [Arguments]    ${body}=${None}

    POST    ${USERS_ENDPOINT_URI}    ${body}