*** Settings ***
Documentation    This file contains common keywords to validate API calls

Library    REST

*** Keywords ***
Send A GET Request To Specific Endpoint
    [Documentation]    This keyword sends a GET request to a specific endpoint
    [Arguments]    ${uri}=${None}    ${id}=${None}    ${page}=${None}

    TRY
        IF    "${id}" == "${None}"
            IF    "${page}" == "${None}"
                GET    ${uri}    timeout=0.5
            ELSE
                GET    ${uri}?page=${page}    timeout=0.5
            END
        ELSE
            GET    ${uri}/${id}    timeout=0.5
        END
    EXCEPT
        Fail    GET could not be performed
    END

Send A POST Request To Specific Endpoint
    [Documentation]    This keyword sends a POST request to a specific endpoint
    [Arguments]    ${uri}=${None}    ${body}=${None}

    TRY
        POST    ${uri}    ${body}    timeout=0.5
    EXCEPT
        Fail    POST could not be performed
    END

Validate Response Info
    [Documentation]    This keyword vaidates the response status code and reason
    [Arguments]    ${expected_status_code}=${None}    ${expected_reason}=${None}    

    ${actual_status_code}    Output    response status   also_console=false
    Should Be Equal As Integers    ${actual_status_code}    ${expected_status_code}

    ${actual_reason}    Output    response reason   also_console=false
    Should Be Equal As Strings    ${actual_reason}    ${expected_reason}
