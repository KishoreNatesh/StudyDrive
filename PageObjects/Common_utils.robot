***setting***
Resource    ../Resources/config/Global.robot
Library    OperatingSystem
Library    String
Library    DateTime

*** Variables ***
${accept_all}    *//button[text()='Accept all']

*** Keywords ***
set environment
    [Arguments]    ${env_type}
    ${studydrive_url}=    set variable    ${env.${env_type}}
    ${deafult_user}=    Set Variable    ${username.${env_type}}
    ${deafult_pass}=    Set Variable    ${password.${env_type}}
    generate random user name and email
    Set Test Variable    ${studydrive_url}
    Set Test Variable    ${deafult_user}
    Set Test Variable    ${deafult_pass}

accept cookies
    Sleep    5s
    Wait For Condition	return document.readyState == "complete"
    Repeat Keyword	8 times    Press Keys    ${None}    TAB
    Press Keys    ${None}   RETURN

generate random user name and email
    ${rand_number}=    generate random string  4  [NUMBERS]
    ${rand_username}=    Catenate    SEPARATOR=    Kishore    ${rand_number}
    ${rand_user_email} =    Catenate    SEPARATOR=    kishore.studydrive+anything    ${rand_number}@gmail.com
    Set Test Variable    ${rand_user_email}
    Set Test Variable    ${rand_username}