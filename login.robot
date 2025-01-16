*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      https://automationexercise.com
${BROWSER}  chrome
${EMAIL}    testemail22@example.com
${PASSWORD}    mypassword123
${NAME}    URIEL PACIS

*** Test Cases ***
Login User for automation Exercise
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Go to Login Page
    Login User
    Validate Login
    Close Browser

*** Keywords ***
Go to Login Page
    Click Element    //a[@href='/login']

Login User
    Input Text    //input[@name='email']    ${EMAIL}
    Input Text    //input[@name='password']    ${PASSWORD}
    CLick Element    //button[@type='submit']

Validate Login
    Wait Until Element Is Visible    //a[@href='/logout']    timeout=10s
    Element Should Contain    //a[@href='/logout']    Logout
