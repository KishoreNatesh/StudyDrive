*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Variables  ./setups.yaml
Resource    ../../PageObjects/Home_page.robot
Resource    ../../PageObjects/Login_page.robot
Resource    ../../PageObjects/Signup_page.robot
Resource    ../../PageObjects/Upload_page.robot
Resource    ../../PageObjects/Common_utils.robot