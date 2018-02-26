*** Settings ***
Library           Selenium2Library
Resource          resource.robot

*** Keywords ***
#Click the Edit button in the toolbar
#${COMPONENT_FOLDER} = The name of the component folder in your code repo
Component Edit
    [Arguments]    ${COMPONENT_FOLDER}
    Click Element    css=div[class*="${COMPONENT_FOLDER}"] .x-toolbar-left .x-toolbar-left-row .x-toolbar-cell:nth-child(1)
    Click Element    css=div[class*="${COMPONENT_FOLDER}"] .x-toolbar-left .x-toolbar-left-row .x-toolbar-cell:nth-child(4) .x-btn
    Sleep    ${delay}

#Check that a pop-up error message got displayed
#${ERROR_MSG} = The error message you are expecting
Component Error Message
    [Arguments]    ${ERROR_MSG}
    Element Should Be Visible    jquery=#cq-msgbox-0 span.x-window-header-text
    Element Should Contain    jquery=#cq-msgbox-0 span.x-window-header-text    ${ERROR_MSG}
    Element Should Be Visible    jquery=span.x-window-header-text:contains(${ERROR_MSG})
    
#Input value into path field
#${NAME} = Field name
#${VALUE} = Field value
Component Input Path
    [Arguments]    ${NAME}    ${VALUE}
    Component Input Text    ${NAME}    ${VALUE}
    Click Element    css=span.x-window-header-text
    
#Input value into rich text editor field
#${NAME} = Field name
#${VALUE} = Field value
Component Input RTE
    [Arguments]    ${NAME}    ${VALUE}
    Select Frame    xpath=//textarea[@name="./${NAME}"]/following::div/iframe
    Press Key    xpath=.//body    ${VALUE}
    Unselect Frame
    
#Input value into select field
#${NAME} = Field name
#${VALUE} = Field value
Component Input Select
    [Arguments]    ${NAME}    ${VALUE}
    Wait Until Element Is Visible    //input[@name='./${NAME}']/../div/div/div/img
    Click Image    //input[@name='./${NAME}']/../div/div/div/img
    Click Element    jquery=div[class*=${NAME}-0] div.x-combo-list-item:contains(${VALUE})

#Input value into text field
#${NAME} = Field name
#${VALUE} = Field value
Component Input Text
    [Arguments]    ${NAME}    ${VALUE}
    Input Text    //input[@name='./${NAME}']    ${VALUE}

#Double-click component to edit it
#${COMPONENT_FOLDER} = The name of the component folder in your code repo
Component Open
    [Arguments]    ${COMPONENT_FOLDER}
    Execute Javascript    window.scrollTo(0,0);
    Double Click Element    css=div.${COMPONENT_FOLDER}.parbase
    Sleep    ${delay}
    
#Select a checkbox field
#${NAME} = Field name
Component Select Checkbox
    [Arguments]    ${NAME}
    Select Checkbox    //input[@name='./${NAME}']

#Input value into radio field
#${NAME} = Field name
#${VALUE} = Field value
Component Select Radio Button
    [Arguments]    ${NAME}    ${VALUE}
    Select Radio Button    ./${NAME}    ${VALUE}
    
#Select a tab
#${TAB_NAME} = Tab name
Component Select Tab
    [Arguments]    ${TAB_NAME}
    Click Element    jquery=form.x-form a:contains("${TAB_NAME}")

#Submit component
Component Submit
    Click Element    jquery=form.x-form button:contains("OK")
    Sleep    2
    
#Unselect a checkbox field
#${NAME} = Field name
Component Unselect Checkbox
    [Arguments]    ${NAME}
    Unselect Checkbox    //input[@name='./${NAME}']