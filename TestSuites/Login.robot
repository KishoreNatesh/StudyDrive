*** Settings ***
Resource    ../Resources/config/Global.robot
Test Setup    set environment    prod
Test Template   Verify login of Studydrive
Test Teardown    Close Browser

# To run using below command it is recommened to add Python and Python\Scripts in envrionment variables else we need to use "python -m" as prefix to robot command
# python -m robot -d ./results .\TestSuites\Login.robot
# robot -d ./results .\TestSuites\Login.robot

# This command is used to run paralell and using --testlevelsplit to run all cases in parallel in a test suite
# pabot --processes 3 --testlevelsplit -d ./results .\TestSuites\Login.robot

*** Test Cases ***    ${username}    ${password}
verify login functionality of Studydrive with valid credentials    default    default
verify login functionality of Studydrive with invalid username    KN_invlaid@gmail.com     StudyDrive@123
verify login functionality of Studydrive with invalid email without@    KN_invlaid     StudyDrive@123
verify login functionality of Studydrive with invalid password    kishore.studydrive@gmail.com    invalid_password
verify login functionality of Studydrive with empty username    ${EMPTY}    StudyDrive@123
verify login functionality of Studydrive with empty password    kishore.studydrive@gmail.com    ${EMPTY}
verify login functionality of Studydrive with both empty username and password    ${EMPTY}    ${EMPTY}

*** Keywords ***
Verify login of Studydrive
    [Arguments]    ${username}    ${password}
    Go to studydrive
    accept cookies
    login to studydrive    ${username}    ${password}
    Sleep    3s