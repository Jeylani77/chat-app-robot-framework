*** Settings ***
Library    AppiumLibrary

*** Variables ***
${LOGIN_BUTTON1}    id=chat21.android.demo:id/login
${LOGIN_BUTTON2}    //android.widget.Button[@text='Login']
${LOGIN_BUTTON3}    //android.widget.Button[contains(@text,'Login')]



*** Test Cases ***
Open_Application
    Open Application    http://localhost:4723   platformName=Android	deviceName=AKNDevice:5554    appPackage=chat21.android.demo    appActivity=chat21.android.demo.SplashActivity    automationName=UiAutomator2
    Wait Until Page Contains Element    ${LOGIN_BUTTON1}
    Wait Until Page Contains Element    ${LOGIN_BUTTON2}
    Wait Until Page Contains Element    ${LOGIN_BUTTON3}