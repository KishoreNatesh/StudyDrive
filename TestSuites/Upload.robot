*** Settings ***
Resource    ../Resources/config/Global.robot
Test Setup    set environment    prod
Test Teardown    Close Browser

# To run using below command it is recommened to add Python and Python\Scripts in envrionment variables else we need to use "python -m" as prefix to robot command
# python -m robot -d ./results .\TestSuites\Upload.robot
# robot -d ./results .\TestSuites\Upload.robot

# This command is used to run paralell and using --testlevelsplit to run all cases in parallel in a test suite
# pabot --processes 3 --testlevelsplit -d ./results .\TestSuites\Upload.robot

*** Test Cases ***
Verify course upload with simple PDF
    Go to studydrive
    accept cookies
    login to studydrive    default    default
    go to upload document
    select course to upload
    upload a file    pdf-sample01.pdf
    verify upload is complete
    verify deletion of uploaded file

Verify course upload with random png file
    Go to studydrive
    accept cookies
    login to studydrive    default    default
    go to upload document
    select course to upload
    upload a file    Kishore.png
    verify upload is complete
    verify deletion of uploaded file

Verify course upload with random exe file
    Go to studydrive
    accept cookies
    login to studydrive    default    default
    go to upload document
    select course to upload
    upload a file    AnyDesk.exe
    verify upload is complete
    verify deletion of uploaded file