*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library  SeleniumLibrary
Test Timeout    10 minutes

*** Variables ***
${URL}                  https://forms.tncmdashboard.com/
${BROWSER}              chrome
# Alternately https://accounts.lambdatest.com/profile you can also use xpath=//*[@id="tsf"]/div[2]/div/div[1]/div/div[1]/input
${input_phoneNumber}    //input[@id='phoneNumber']
${countine_button}      xpath=//*[@id="next"]
${countine_2button}     xpath=//*[@id="continue"]
${verification_Path}    xpath=//input[@id='verificationCode']
${cancel_login}         xpath=//*[@id="cancel"]  
${7Pledges_assert}      xpath=//h1[normalize-space()='7 PLEDGES']
${7Pledges_closeModal}  xpath=//a[@class='close-modal']
${search_Dashboard}     xpath=//input[@placeholder='Search Dashboard']
${Click_Project}        xpath=//a[contains(text(),'Projects')]    
${Create_NewProjectButton}  xpath=//body/app-root[1]/feature-toggle-provider[1]/app-layout[1]/div[1]/div[1]/app-project[1]/div[1]/div[1]/div[3]/button[1]
${Input_ProjectTitle}           xpath=//input[@id='projectName']
${Select_Department}       xpath=//body/app-root[1]/feature-toggle-provider[1]/app-layout[1]/div[1]/div[1]/app-project[1]/div[1]/app-create-project[1]/div[1]/div[1]/div[1]/div[2]/form[1]/div[3]/ng-select[1]/div[1]/div[1]/div[3]/input[1]
${search_term}          Lambdatest
${phoneNumber}          8754847099
${ProjectTitle}         Test Department
${Department}           Test Department
${Save_Button}          xpath=//button[contains(text(),'Save')]
${Enter_key}            \\13
${Project_SearchButton}  xpath=//input[contains(@class,'project-name form-control')]
${Valid_ProjectName}    SalaryTest Project
${Valid_ProjectClick}   xpath=//h5[contains(text(),'SalaryTest Project')]
${View_ResponseButton}  xpath=//button[@title='View Responses']
${Input_Form}           xpath=//div[contains(text(),'SalaryTest Project')]

*** Test Cases ***
Create_Project Test Positive
    [Tags]  LoginFeature
    Open Browser    ${URL}   ${BROWSER}
    maximize Browser window
    ${implicittime}     get Selenium implicit Wait
    Log to console     ${implicittime}
    set Selenium implicit Wait  20 seconds
    ${implicittime}     get Selenium implicit Wait  
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
    Wait Until Element Is Visible   ${Click_Project}
    Click Element   ${Click_Project}
    wait Until Element Is Visible  ${Project_SearchButton}
    click Element   ${Project_SearchButton}
    Input Text    ${Project_SearchButton}    ${Valid_ProjectName}
    wait Until Element Is Visible   ${Valid_ProjectClick}
    click Element   ${Valid_ProjectClick}
    Sleep   5s
    #wait Until Element Is Visible   ${Input_Form}
    click Element   ${View_ResponseButton}        
    Close Browser