*** Settings ***
Library  RequestsLibrary

*** Variables ***
${Base_URL}  https://thetestingworldapi.com/

*** Test Cases ***
TC_001_Get_Request
    create session  Get_Users_List  ${Base_URL}
    ${response}=  get request  Get_Users_List  api/studentsDetails
    log to console  ${response.text}
