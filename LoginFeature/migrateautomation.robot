*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library  Selenium2Library



*** Variables ***
${URL}                  https://pro-gpmd-migrationtool-webapp.azurewebsites.net/
${BROWSER}              chrome
${Stageto_production_button}        //input[@value='Migrate Stage To Production']
${searchproject_button}             xpath=//select[@id='Project_Id']
${assert_projectname}               xpath=//div[@class="form-group mt-3"]//select[@id="Project_Id"]    
${valid_project}               Project Vivo
${Click_GetprojectDetailsButton}    //input[@value='Get Project Details']
${Select_inputformMIG}              xpath=//option[contains(text(),'Input Form Vivo ph')]
${Select_dashboardFormMIG}          xpath=//option[contains(text(),'Dashboard vivo')]
${Move_formResponse}                xpath=//input[@id='SelectedProjectData_moveFormResponses']
${Delete_andmove_formResponse}      xpath=//input[@id='SelectedProjectData_deleteAndMove']
${Migrate_Button}                   xpath=//input[@value='Migrate']


  


*** Test Cases ***
Create_Project Test Positive
    [Tags]  LoginFeature
    Open Browser    ${URL}   ${BROWSER}
    maximize Browser window
    Wait Until Element Is Visible  ${Stageto_production_button}
    Click Element       ${Stageto_production_button}
    Wait Until Element Is Visible   ${searchproject_button}  70s
    Press Key           ${valid_project}  //25
    Click Element       ${searchproject_button}
    Press Keys           ${valid_project}  //25
    Sleep  30s
    Input Text          ${valid_project}
    Wait Until Element Is Visible   ${assert_projectname}   ${valid_project}
    
    Wait Until Element Is Visible       ${Click_GetprojectDetailsButton}
    Click Element       ${Click_GetprojectDetailsButton}
    Wait Until Element Is Visible   ${Select_inputformMIG}
    Click Element   ${Select_inputformMIG}
    Wait Until Element Is Visible   ${Select_dashboardFormMIG}
    Click Element   ${Select_dashboardFormMIG}
    Wait Until Element Is Visible   ${Move_formResponse}
    Click Element   ${Move_formResponse}
    Wait Until Element Is Visible   ${Delete_andmove_formResponse}
    Click Element   ${Delete_andmove_formResponse}
    Wait Until Element Is Visible   ${Migrate_Button}
    Click Element   ${Migrate_Button}



    Close Browser