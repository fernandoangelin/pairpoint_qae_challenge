*** Settings ***
Library    Collections




*** Keywords ***
Create New User Body Data
    [Documentation]
    [Arguments]    ${name}=${None}    ${job}=${None}

    ${body_data}    Create Dictionary

    IF    "${name}" != "${None}"
        Set To Dictionary    ${body_data}    name    ${name}
    END

    IF    "${job}" != "${None}"
        Set To Dictionary    ${body_data}    job    ${job}
    END

    RETURN    ${body_data}