*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library  SeleniumLibrary
Test Timeout    10 minutes


*** Variables ***
${URL1}                  https://forms.tncmdashboard.com/
${BROWSER}              Chrome
# Alternately https://accounts.lambdatest.com/profile you can also use xpath=//*[@id="tsf"]/div[2]/div/div[1]/div/div[1]/input
${input_phoneNumber}    //input[@id='phoneNumber']
${countine_button}      xpath=//*[@id="next"]
${countine_2button}     xpath=//*[@id="continue"]
${verification_Path}    xpath=//input[@id='verificationCode']
${cancel_login}         xpath=//*[@id="cancel"]  
${7Pledges_assert}      xpath=//h1[normalize-space()='7 PLEDGES']
${7Pledges_closeModal}  xpath=//a[@class='close-modal']
${search_Dashboard}     xpath=//input[@placeholder='Search Dashboard']
${Create Section}       xpath=//body/app-root[1]/feature-toggle-provider[1]/app-layout[1]/div[1]/div[1]/app-master-data[1]/div[1]/div[2]/app-metadata[1]/div[1]/div[1]/button[1]
${search_term}          Lambdatest
${phoneNumber}          8754847099
${Create_Section}       xpath=//body/app-root[1]/feature-toggle-provider[1]/app-layout[1]/div[1]/div[1]/app-master-data[1]/div[1]/div[2]/app-metadata[1]/div[1]/div[1]/button[1]

*** Test Cases ***
  Create_DepartmentTest Positive
    [Tags]  LoginFeature
    Open Browser    ${URL1}   ${BROWSER}  
    Wait Until Element Is Visible  ${input_phoneNumber}
    Input Text       ${input_phoneNumber}   ${phoneNumber}
    Wait Until Element Is Visible   ${countine_button}
    Click Element   ${countine_button}
    Wait Until Element Is Visible   ${countine_2button}
    Click Element   ${countine_2button}
    Wait Until Element Is Visible   ${verification_Path}
    Input Text       ${verification_Path}   ${phoneNumber}
    Wait Until Element Is Visible   ${countine_2button}
    Click Element   ${countine_2button}
    Wait Until Element Is Visible  ${Create_Section}
    Click Element   ${Create_Section}
    Close Browser