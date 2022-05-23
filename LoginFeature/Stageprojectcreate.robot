*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library  Selenium2Library



*** Variables ***
${URL}                  https://stageformuistrg.z23.web.core.windows.net/projects
${BROWSER}              chrome

${input_phoneNumber}        //input[@aria-label='Enter Phone Number']   
${countine_button}          xpath=//button[@id='continue']     
#${countine_2button}     
#//button[@id='verifyCode']
${phoneNumber}               9786691625
${project_button}           //a[contains(text(),'Projects')]
${create_newproject}        xpath=//body/app-root[1]/feature-toggle-provider[1]/app-layout[1]/div[1]/div[1]/app-project[1]/div[1]/div[1]/div[3]/button[1]
${project_title}            //input[@id='projectName']
${project_Description}      //textarea[@id='projectDescription']
${assert_Department}        xpath=//div[@class="ng-select-container"]//div[2]//input
${assert_Department1}       xpath=//div[@class="modal-content"]//div[2]//div[3]//div//div//div[3]//input
${department}               xpath=//body/app-root[1]/feature-toggle-provider[1]/app-layout[1]/div[1]/div[1]/app-project[1]/div[1]/app-create-project[1]/div[1]/div[1]/div[1]/div[2]/form[1]/div[3]/ng-select[1]/div[1]/div[1]/div[3]/input[1]
${project_search}           xpath=//div[@class="header"]//div[2]//input
${projectfilter}            xpath=//input[@placeholder='Project name filter']
${save_button}              xpath=//button[contains(text(),'Save')]
${click_project}            xpath=//h5[contains(text(),'project 3 a')]
${create_Form}              xpath=//button[contains(text(),'Create Form')]
${exiting_BOX}              xpath=//input[@checked='true']
${Enter_formName}           xpath=//input[@id='eey7p4l-formName']
${Input_FormName}           input form 3a
${InputForm_SummitButton}   xpath=//button[contains(text(),'Submit')]
${Project_SearchButton}  xpath=//input[contains(@class,'project-name form-control')]
${assert_projectName}   xpath=//li[@class="box popover__wrapper"]//div//div[2]//div//h5




${enter_key}                //13
${Inputproject_title}       project14
${Description}              testing
${Input_department}         Testing3

*** Test Cases ***
Create_Project Test Positive
    [Tags]  LoginFeature
    #${default_implicit_wait}=   Get Selenium Implicit Wait

    #Set Selenium Implicit Wait  20s
    #${custom_implicit_wait}=    Get Selenium Implicit Wait

    
    Open Browser    ${URL}   ${BROWSER}
    maximize Browser window

    Set Selenium Implicit Wait  20 seconds

    Wait Until Element Is Visible  ${input_phoneNumber}
    Input Text       ${input_phoneNumber}   ${phoneNumber}
    Wait Until Element Is Visible   ${countine_button}  
    Click Element   ${countine_button}
    Wait Until Element Is Visible   ${project_button}  70s
    Click Element   ${project_button}  
    Press Key       ${projectfilter}    \\09    
    Wait Until Element Is Visible   ${create_newproject}  70s
    #Press Key       ${create_newproject}    \\13
    Click Element   ${create_newproject}
    Wait Until Element Is Visible   ${project_title}
    Input Text      ${project_title}    ${Inputproject_title}
    Wait Until Element Is Visible   ${project_Description}
    Input Text      ${project_Description}  ${Description}
    Wait Until Element Is Visible   ${department}
    Input Text      ${department}   ${Input_department}
    Element Text Should Be       ${assert_Department}   ${enter_key}
    #Click Element   ${assert_Department}  ${enter_key}  50s
    Wait Until Element Is Visible   ${save_button}  70s
    Click Element   ${save_button}
    Wait Until Element Is Visible   ${Project_SearchButton}
    Click Element   ${Project_SearchButton}
    Input Text      ${Project_SearchButton} ${Input_FormName}
    Wait Until Element Is Visible   ${assert_projectName}
    Element Text Should Be  ${assert_projectName}   ${Input_FormName}
    Wait Until Element Is Visible   ${click_project}
    Click Element   ${click_project}
    Wait Until Element Is Visible   ${create_Form}
    Click Element   ${create_Form}
    Wait Until Element Is Visible   ${exiting_BOX}
    Click Element   ${exiting_BOX}
    Wait Until Element Is Visible   ${Enter_formName}
    Input Text      ${Enter_formName}   ${Input_FormName}
    Wait Until Element Is Visible   ${InputForm_SummitButton}
    Click Element   ${InputForm_SummitButton}


    
    #Close Browser