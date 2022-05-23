*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library  Selenium2Library



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
${Project_SearchButton1}  xpath=//input[containss(@class,'project-name form-control""")]
${Valid_ProjectName}    SalaryTest Project
${Valid_ProjectName1}    SalaryTest Project12##
${Valid_ProjectClick}   xpath=//h5[contains(text(),'SalaryTest Project')]
${assert_projectName}   xpath=//li[@class="box popover__wrapper"]//div//div[2]//div//h5


*** Test Cases ***
Create_Project Test Positive
    [Tags]  LoginFeature
    
    ${wait}     Get Selenium Implicit Wait
    Log to console  ${wait}

    Set Selenium Implicit Wait  20 seconds

    ${wait}     Get Selenium Implicit Wait
    Log to console  ${wait}

    #${default_implicit_wait}=   Get Selenium Implicit Wait

    #Set Selenium Implicit Wait  20s
    #${custom_implicit_wait}=    Get Selenium Implicit Wait

    
    Open Browser    ${URL}   ${BROWSER}
    maximize Browser window
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
    wait Until Element Is Visible   ${assert_projectName}
    Element Text Should Be  ${assert_projectName}   ${Valid_ProjectName}
    log to console   ${Valid_ProjectName}
    Close Browser