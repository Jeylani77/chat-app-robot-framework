*** Settings ***
Library    AppiumLibrary
Resource    ../Ressources/password.robot

*** Variables ***

#*** Application Variables ***
${CHAT21_APP_ID}          chat21.android.demo
${CHAT21_APP_ACTIVITY}    chat21.android.demo.SplashActivity

#*** ANDROID VERSION 10 Variables ***
${ACCEPT_STORAGE_BUTTON}         id=com.android.permissioncontroller:id/continue_button
${ACCEPT_OLD_VERSION_POPUP}      id=android:id/button1

#*** Test Variables ***
&{USER_DETAILS}             email=rootnjaay@gmail.com    password=${PASSWORD}    username=Test 1 A
&{USER_DETAILS2}            email=almouslim77@yahoo.fr   password=${PASSWORD}    username=Test 2 B

${APPIUM_PORT_DEVICE1}      4724
${APPIUM_PORT_DEVICE2}      4725
${UDID_DEVICE1}           emulator-5554
${UDID_DEVICE2}           emulator-5556
${THE_MESSAGE}            Hello
#*** Login Page ***
${EMAIL_INPUT}       id=${CHAT21_APP_ID}:id/email
${PASSWORD_INPUT}    id=${CHAT21_APP_ID}:id/password
${LOGIN_BUTTON}      id=${CHAT21_APP_ID}:id/login

#*** Main Page ***
${HOME_TAB}          //android.widget.TextView[@text='HOME']
${PROFILE_TAB}       //android.widget.TextView[@text='PROFILE']
${CHAT_TAB}          //android.widget.TextView[@text='CHAT']

#*** Profile Page ***
${LOGOUT_BUTTON}               id=${CHAT21_APP_ID}:id/logout

#*** Chat Page ***
${NEW_CONVERSATION_BUTTON}     id=${CHAT21_APP_ID}:id/button_new_conversation

#*** Contact Page
${SEARCH_CONTACT_BUTTON}       id=${CHAT21_APP_ID}:id/action_search
${SEARCH_CONTACT_INPUT}        id=${CHAT21_APP_ID}:id/search_src_text
${SEARCH_CONTACT_RESULT_USER_NAME}    //android.widget.TextView[contains(@resource-id,'fullname') and @text='${USER_DETAILS2}[username]']

#*** Chat Section ***
${USERNAME_TOOLBAR}       id=${CHAT21_APP_ID}:id/toolbar_title
${SEND_MESSAGE_INPUT}     id=${CHAT21_APP_ID}:id/main_activity_chat_bottom_message_edittext
${SEND_MESSAGE_BUTTON}    id=${CHAT21_APP_ID}:id/main_activity_send
${MESSAGE_TEXT_SENT}      id=${CHAT21_APP_ID}:id/message

*** Keywords ***
Open Chat21 App
    [Arguments]    ${APPIUM_PORT}=${APPIUM_PORT_DEVICE1}    ${DEVICE}=${UDID_DEVICE1}
    Open Application    http://localhost:${APPIUM_PORT}   platformName=Android    appPackage=${CHAT21_APP_ID}   appActivity=${CHAT21_APP_ACTIVITY}    automationName=UiAutomator2    udid=${DEVICE}
    ${Alert}    Run Keyword And Return Status    Page Should Contain Element    ${ACCEPT_STORAGE_BUTTON}
    Run Keyword If    '${Alert}' == 'True'    Bypass Android 10 Alerts

Open Chat21 APP On Device 1
    Open Chat21 App    ${APPIUM_PORT_DEVICE1}    ${UDID_DEVICE1}
Open Chat21 APP On Device 2
    Open Chat21 App    ${APPIUM_PORT_DEVICE2}    ${UDID_DEVICE2}

Bypass Android 10 Alerts
    Wait Until Page Contains Element    ${ACCEPT_STORAGE_BUTTON}
    Click Element                       ${ACCEPT_STORAGE_BUTTON}
    Wait Until Page Contains Element    ${ACCEPT_OLD_VERSION_POPUP}
    Click Element                       ${ACCEPT_OLD_VERSION_POPUP}

Input User Email
    [Arguments]    ${EMAIL}
    Wait Until Page Contains Element    ${EMAIL_INPUT}
    Input Text                          ${EMAIL_INPUT}    ${EMAIL}
Input User Password
    [Arguments]    ${PASS}
    Wait Until Page Contains Element    ${PASSWORD_INPUT}
    Input Text                          ${PASSWORD_INPUT}    ${PASS}
Click Login Button
     Wait Until Page Contains Element    ${LOGIN_BUTTON}
     Click Element                       ${LOGIN_BUTTON}
Verify Login Is Successfull
     Wait Until Page Contains Element    ${HOME_TAB}

Go To Profile Page
    Click Element                        ${PROFILE_TAB}
Click Logout Button
    Wait Until Page Contains Element     ${LOGOUT_BUTTON}
    Click Element                        ${LOGOUT_BUTTON}
Verify Logout Is Successfull
    Wait Until Page Contains Element     ${EMAIL_INPUT}

Login User
    [Arguments]    ${EMAIL}   ${PASS}
    Input User Email       ${EMAIL}
    Input User Password    ${PASS}
    Click Login Button
    #Verify Login Is Successfull

Logout User
    Go To Profile Page
    Click Logout Button
    Verify Logout Is Successfull


Create New Conversation
    [Arguments]    ${USERNAME_SEARCH}
    Go To Chat Tab
    Click New Conversation Button
    Click Search User
    Input Searching User    ${USERNAME_SEARCH}
    Click User

Send Message
    [Arguments]    ${MESSAGE}
    Tap Message    ${MESSAGE}
    Click Send Message Button
    Verify Text Message Is Sent

Go To Chat Tab
    Click Element                        ${CHAT_TAB}
Click New Conversation Button
    Wait Until Page Contains Element     ${NEW_CONVERSATION_BUTTON}
    Click Element                        ${NEW_CONVERSATION_BUTTON}
Click Search User
    Wait Until Page Contains Element    ${SEARCH_CONTACT_BUTTON}
    Click Element                       ${SEARCH_CONTACT_BUTTON}
Input Searching User
    [Arguments]    ${USERNAME}
    Wait Until Page Contains Element    ${SEARCH_CONTACT_INPUT}
    Click Element                       ${SEARCH_CONTACT_INPUT}
    Input Text                          ${SEARCH_CONTACT_INPUT}    ${USERNAME}
Click User
    Wait Until Page Contains Element    ${SEARCH_CONTACT_RESULT_USER_NAME}
    Click Element                       ${SEARCH_CONTACT_RESULT_USER_NAME}
Tap Message
    [Arguments]    ${MESSAGE}
    Wait Until Page Contains Element    ${USERNAME_TOOLBAR}
    Wait Until Page Contains Element    ${SEND_MESSAGE_INPUT}
    Input Text                          ${SEND_MESSAGE_INPUT}    ${MESSAGE}
Click Send Message Button
    Wait Until Page Contains Element    ${SEND_MESSAGE_BUTTON}
    Click Element                       ${SEND_MESSAGE_BUTTON}
Verify Text Message Is Sent
    Wait Until Page Contains Element    ${MESSAGE_TEXT_SENT}




