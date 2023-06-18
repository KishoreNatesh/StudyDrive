*** Settings ***
Resource    ../Resources/config/Global.robot
Test Setup    set environment    prod
Test Teardown    Close Browser

# To run using below command it is recommened to add Python and Python\Scripts in envrionment variables else we need to use "python -m" as prefix to robot command
# python -m robot -d ./results .\TestSuites\Signup.robot
# robot -d ./results .\TestSuites\Signup.robot

# This command is used to run paralell and using --testlevelsplit to run all cases in parallel in a test suite
# pabot --processes 3 --testlevelsplit -d ./results .\TestSuites\Signup.robot

*** Test Cases ***
Verify new user sign up and onboarding
    Go to studydrive
    accept cookies
    Sign up new user
    Enter new username and details
    Enter university details
    verify setting up your account

Verify new user sign up with existing user email
    Go to studydrive
    accept cookies
    Sign up new user    kishore.studydrive@gmail.com
    Verify account already exist with this email address