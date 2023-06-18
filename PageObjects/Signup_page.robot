***setting***
Resource    ../Resources/config/Global.robot
Library    OperatingSystem

*** Variables ***
${sign_up_btn}    //*/button[text()='Sign up for free']
${email_input_sign_up}    //*/input[@type="email"]
${password_input_sign_up}   //*/input[@type="password"]
${sign_up_for_free}    //*/span[text()='Sign up for free']
${Continue_btn}    //*/span[text()='Continue']
${new_username}    //*/input[@name="username"]
${Select_gender}    //*/div[contains(text(),'Select gender')]
${gender_male}    //div[2]/ul[1]//div[contains(text(),'Male')]
${Uni_name}    //*/input[@placeholder="Enter university name"]
${field_of_study}    //input[@placeholder="Select field of study"] 
${study_program}    //input[@placeholder="Select study program"]
${semester_year}    //input[@placeholder="Select your starting semester"]
${setting_up_your_account}    //*/h2[contains(text(),'Setting up your account')]
${account_already_exist}    There is an account using this email address already
#987654321

*** Keywords ***
Sign up new user
    [Arguments]    ${new_useremail}=${rand_user_email}
    Wait Until Page Contains Element    ${sign_up_btn}
    Click Element    ${sign_up_btn}
    Wait Until Page Contains Element    ${email_input_sign_up}
    Input Text    ${email_input_sign_up}    ${new_useremail}
    Input Password    ${password_input_sign_up}    ${deafult_pass}
    Click Element    ${sign_up_for_free}

Enter new username and details
    Wait Until Page Contains Element    ${new_username}
    Input Text    ${new_username}    ${rand_username}
    Click Element    ${Select_gender}
    Sleep    1s
    Wait Until Page Contains Element    ${gender_male}
    Click Element    ${gender_male}
    Click Element    ${Continue_btn}

Enter university details
    Wait Until Page Contains Element    ${Uni_name}
    Input Text    ${Uni_name}    987654321
    Sleep    3s
    Press Keys    ${None}   RETURN
    Wait Until Page Contains Element    ${field_of_study}
    Input Text    ${field_of_study}    Engineering
    Press Keys    ${None}   RETURN
    Wait Until Page Contains Element    ${study_program}
    Input Text    ${study_program}    Engineering
    Press Keys    ${None}   RETURN
    Wait Until Page Contains Element    ${semester_year}
    Click Element    ${semester_year}
    Sleep    1s
    Press Keys    ${None}   ARROW_DOWN
    Press Keys    ${None}   RETURN
    Click Element    ${Continue_btn}

verify setting up your account
    Wait Until Page Contains Element    ${setting_up_your_account}    10s
    Page Should Contain Element    ${setting_up_your_account}

Verify account already exist with this email address
    Wait Until Page Contains    ${account_already_exist}
    Page Should Contain    ${account_already_exist}