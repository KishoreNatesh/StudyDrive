*** Settings ***
Library    AppiumLibrary

#robot -d ./results .\TestSuites\Appium.robot
*** Test Cases ***
First test of opening studydrive mobile app
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=de.veedapp.veed    appActivity=de.veedapp.veed.ui.activity.LauncherActivityK    automationName=UiAutomator2