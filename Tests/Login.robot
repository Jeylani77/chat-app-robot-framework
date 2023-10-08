*** Settings ***
Library    AppiumLibrary
Resource    ../Ressources/android-res.robot

*** Variables ***
${APPIUM_PORT_EMULATOR1}    4725
${APPIUM_PORT_EMULATOR2}    4724
${UDID_EMULATOR1}           emulator-5554
${UDID_EMULATOR2}           emulator-5556
${CHAT21_APP_ID}          chat21.android.demo
${CHAT21_APP_ACTIVITY}    chat21.android.demo.SplashActivity

*** Test Cases ***
Login
    Open Chat21 APP On Device 1
    Login User    ${USER_DETAILS}[email]  ${USER_DETAILS}[password]
    Open Chat21 APP On Device 2
    Login User    ${USER_DETAILS}[email]  ${USER_DETAILS}[password]
