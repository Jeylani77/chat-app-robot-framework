*** Settings ***
Library    AppiumLibrary
Resource    ../Ressources/android-res.robot

*** Test Cases ***
Login
    Open Chat21 APP On Device 1
    Login User    ${USER_DETAILS}[email]  ${USER_DETAILS}[password]
    Open Chat21 APP On Device 2
    Login User    ${USER_DETAILS2}[email]  ${USER_DETAILS2}[password]

Chat
    Switch Application    1
    Create New Conversation    ${USER_DETAILS2}[username]
    Send Message               ${THE_MESSAGE}

