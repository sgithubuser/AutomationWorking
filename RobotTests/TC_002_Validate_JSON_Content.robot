*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URL}  https://thetestingworldapi.com/
${Student_ID}  3836916


*** Test Cases ***
TC_002_Validate_JSON_Content
    create session  FetchData   ${Base_URL}
    ${Response}=  get request  FetchData  api/studentsDetails/${Student_ID}
    ${Converted_Response}=  convert to string  ${Response.status_code}
    should be equal  ${Converted_Response}  200
    ${json_res}=  to json  ${Response.content}
    @{first_name_list}=  get value from json  ${json_res}  data.first_name  #here since name is getting in form of list, the list varibale is declared with @ sign
    ${first_name}=  get from list  ${first_name_list}  0   #here we are now extracting first name from returned list
    log to console  ${first_name}