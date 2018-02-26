*** Settings ***
Library           Selenium2Library
Resource          resource.robot

*** Keywords ***
Component Edit
    [Arguments]    ${COMPONENT_FOLDER}
    Click Element    css=div[class*="${COMPONENT_FOLDER}"] .x-toolbar-left .x-toolbar-left-row .x-toolbar-cell:nth-child(1)
    Click Element    css=div[class*="${COMPONENT_FOLDER}"] .x-toolbar-left .x-toolbar-left-row .x-toolbar-cell:nth-child(4) .x-btn
    Sleep    ${delay}

Component Error Message
    [Arguments]    ${ERROR_MSG}
    Element Should Be Visible    jquery=#cq-msgbox-0 span.x-window-header-text
    Element Should Contain    jquery=#cq-msgbox-0 span.x-window-header-text    ${ERROR_MSG}
    #Element Should Be Visible    jquery=span.x-window-header-text:contains(${ERROR_MSG})

Component Input Path
    [Arguments]    ${NAME}    ${VALUE}
    Component Input Text    ${NAME}    ${VALUE}
    Click Element    css=span.x-window-header-text

Component Input RTE
    [Arguments]    ${NAME}    ${VALUE}
    Select Frame    xpath=//textarea[@name="./${NAME}"]/following::div/iframe
    Press Key    xpath=.//body    ${VALUE}
    Unselect Frame

Component Input Select
    [Arguments]    ${NAME}    ${VALUE}
    Wait Until Element Is Visible    //input[@name='./${NAME}']/../div/div/div/img
    Click Image    //input[@name='./${NAME}']/../div/div/div/img
    Click Element    jquery=div[class*=${NAME}-0] div.x-combo-list-item:contains(${VALUE})

Component Input Text
    [Arguments]    ${NAME}    ${VALUE}
    Input Text    //input[@name='./${NAME}']    ${VALUE}

Component Open
    [Arguments]    ${COMPONENT_FOLDER}
    Execute Javascript    window.scrollTo(0,0);
    Double Click Element    css=div.${COMPONENT_FOLDER}.parbase
    Sleep    ${delay}

Component Select Checkbox
    [Arguments]    ${NAME}
    Select Checkbox    //input[@name='./${NAME}']

Component Select Radio Button
    [Arguments]    ${NAME}    ${VALUE}
    Select Radio Button    ./${NAME}    ${VALUE}

Component Select Tab
    [Arguments]    ${TAB_NAME}
    Click Element    jquery=form.x-form a:contains("${TAB_NAME}")

Component Submit
    Click Element    jquery=form.x-form button:contains("OK")
    Sleep    2

Component Unselect Checkbox
    [Arguments]    ${NAME}
    Unselect Checkbox    //input[@name='./${NAME}']
