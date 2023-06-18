***setting***
Resource    ../Resources/config/Global.robot
Library    OperatingSystem

*** Variables ***
${login_button}    //*/button[text()='Log in']
${email_input}    //*/input[@type="email"]
${password_input}   //*/input[@type="password"]
${submit_button}    //button[@class="mt-1 w-full btn btn-cta-surfaced btn-md neutral"]
${studydrive_logo}    //*/div[@id="logo-studydrive"]
${field_required}    //*/div[text()='This field is required.']
${invalid_email_error}    Invalid email address.

*** Keywords ***
Go to studydrive
    [Arguments]    ${browser}=chrome
    Open Browser    ${studydrive_url}    ${browser}
    Maximize Browser Window

login to studydrive
    [Arguments]    ${username}    ${password}
   IF    "${username}" == "default" and "${password}" == "default"
        Sleep    2s
        Click Element    ${login_button}
        Wait Until Page Contains Element    ${email_input}
        Input Text    ${email_input}     ${deafult_user}
        Input Password    ${password_input}    ${deafult_pass}
        Click Button    ${submit_button}
        Verify valid login
    ELSE IF    "${username}" == "${EMPTY}" or "${password}" == "${EMPTY}"
        Sleep    2s
        Click Element    ${login_button}
        Wait Until Page Contains Element    ${email_input}
        Input Text    ${email_input}     ${username}
        Input Password    ${password_input}    ${password}
        Click Button    ${submit_button}
        verify incomplete credentials
    ELSE
        Sleep    2s
        Click Element    ${login_button}
        Wait Until Page Contains Element    ${email_input}
        Input Text    ${email_input}     ${username}
        Input Password    ${password_input}    ${password}
        Click Button    ${submit_button}
        ${contains_at_symbol}    Run Keyword And Return Status    Should Not Contain    ${username}    @
        Run Keyword If    ${contains_at_symbol}    Verify invalid email error
        ${contains_at_symbol}    Run Keyword And Return Status    Should Contain    ${username}    @
        Run Keyword If    ${contains_at_symbol}    Verify login error message
    END


Verify login error message
    Wait Until Page Contains    Your email / password combination is wrong
    Page Should Contain    Your email / password combination is wrong

Verify valid login
    Wait Until Page Contains Element    ${studydrive_logo}    20s
    Page Should Contain Element    ${studydrive_logo}

verify incomplete credentials
    Wait Until Page Contains Element    ${field_required}
    Page Should Contain Element    ${field_required}

Verify invalid email error
    Wait Until Page Contains    ${invalid_email_error}
    Page Should Contain    ${invalid_email_error}