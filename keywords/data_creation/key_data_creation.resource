*** Settings ***
Library    Collections


*** Keywords ***
Create New User Body Data
    [Documentation]    This keyword creates a dictionary to be used as a body in a request
    ...                If no name and job are passed as parameters, the dictionary will be empty
    [Arguments]    ${name}=${None}    ${job}=${None}

    ${body_data}    Create Dictionary

    IF    "${name}" != "${None}"
        Set To Dictionary    ${body_data}    name    ${name}
    END

    IF    "${job}" != "${None}"
        Set To Dictionary    ${body_data}    job    ${job}
    END

    RETURN    ${body_data}
