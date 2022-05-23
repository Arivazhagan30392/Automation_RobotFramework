*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library  Selenium2Library



*** Variables ***
${URL}                  https://stageticketingappstrg.z23.web.core.windows.net/
${BROWSER}              Chrome
# Alternately https://accounts.lambdatest.com/profile you can also use xpath=//*[@id="tsf"]/div[2]/div/div[1]/div/div[1]/input
${input_phoneNumber}    xpath=//input[@id='nationalNumber']
${Login_Button}         xpath=//button[contains(text(),'Login')]
${countine_button}      xpath=//button[@id='continue']
${cancel_login}         xpath=//button[@id='cancel']
${verification_Code}    xpath=//input[@id='verificationCode']
${verification_Path}    xpath=//button[@id='verifyCode']
${NewComplanit_Button}  xpath=//button[text()=' New Complaint ']
${Upload_problem}       xpath=//i[contains(@class,'i-plus text-2xl')]
${Location}             xpath=(//label[text()='Location']/following::input)[1]
${Street}               xpath=(//div[@role='combobox']//input)[2]
${Address}              xpath=(//textarea[contains(@class,'border-2 border-gray-300')])[1]
${issue_Category}       xpath=//label[text()='Issue Category']/following::input  
${phoneNumber}          9786691625
${Otp_code}             123456    

*** Test Cases ***
Login Test Login
    [Tags]  LoginFeature
    Open Browser    ${URL}   ${BROWSER}
    maximize Browser window  
    Wait Until Element Is Visible  ${input_phoneNumber}
    Input Text       ${input_phoneNumber}   ${phoneNumber}
    Wait Until Element Is Visible   ${countine_button}
    Click Element   ${countine_button}
    Wait Until Element Is Visible   ${verification_Code}
    Input Text       ${verification_Code}   ${Otp_code}           
    Click Element   ${verification_Path}
    Close Browser