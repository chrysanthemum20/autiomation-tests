*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      https://automationexercise.com
${BROWSER}  chrome
${EMAIL}    testemail22@example.com
${PASSWORD}    mypassword123
${NAME}    URIEL PACIS

*** Test Cases ***
Register User On Automation Exercise
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Go To Signup Page
    Register New User
    Validate Registration Success
    Close Browser

*** Keywords ***
Go To Signup Page
    Click Element    //a[@href='/login']    # Click on the "Signup / Login" button

Register New User
    Wait Until Element Is Visible    //div[@class='signup-form']//input[@name='name']    timeout=10s
    Input Text    //div[@class='signup-form']//input[@name='name']    ${NAME}    # Enter the Name
    Input Text    //div[@class='signup-form']//input[@name='email']    ${EMAIL}    # Enter the Name
    Click Element    //div[@class='signup-form']//button[@type='submit']    # Click on the "Submit" button to proceed
    Wait Until Element Is Visible    //div[@class='login-form']
    Click Element    //input[@id='id_gender1']
    Input Text    //input[@type='password']    ${PASSWORD}
    Select From List By Label    //select[@id='days']    15
    Select From List By Label    //select[@id='months']    July
    Select From List By Label    //select[@id='years']    1995
    Click Element    //input[@id='newsletter']
    Click Element    //input[@id='optin']
    Input Text    //input[@id='first_name']    testname1
    Input Text    //input[@id='last_name']    testname1
    Input Text    //input[@id='company']    testcompany
    Input Text    //input[@id='address1']    address1
    Input Text    //input[@id='address2']    address2
    Select From List By Label    //select[@id='country']    Canada
    Input Text    //input[@id='state']    teststate
    Input Text    //input[@id='city']    testcity
    Input Text    //input[@id='zipcode']    11111
    Input Text    //input[@id='mobile_number']    222222
    Click Element    //button[@type='submit']
    

Validate Registration Success
        # Wait for account creation message
    Element Should Contain    //p[text()='Congratulations! Your new account has been successfully created!']    Congratulations! Your new account has been successfully created!    # Validate success message