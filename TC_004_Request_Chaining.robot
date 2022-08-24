*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_URL}  http://thetestingworldapi.com/
${Original_Last_Name}  Salamat
${Updated_Last_Name}  Laiba

*** Test Cases ***
TC004_Request_Chaining
    create session  post_data  ${base_URL}
    &{head}=  create dictionary  Content-Type=application/json
    &{body}=  create dictionary  first_name=Salman  middle_name=R  last_name=${Original_Last_Name}  date_of_birth=10/14/1994
    ${post_response}=  POST On Session  post_data  api/studentsDetails  headers=${head}  data=${body}
    ${json_response}=  to json  ${post_response.content}
    log to console  ${json_response}
    @{id_list}=  get value from json  ${json_response}  id
    log to console  ${id_list}
    ${id}=  get from list  ${id_list}  0
