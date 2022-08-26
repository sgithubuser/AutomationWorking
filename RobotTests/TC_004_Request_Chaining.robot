*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_URL}  https://thetestingworldapi.com/
${Original_Last_Name}  Salamat
${Updated_Last_Name}  Laiba

*** Test Cases ***
TC004_Request_Chaining
    create session  post_data  ${base_URL}
    &{header}=  create dictionary  Content-Type=application/json
    &{body}=  create dictionary  first_name=Salman  middle_name=R  last_name=${Original_Last_Name}  date_of_birth=10/14/1994
    ${post_response}=  post request  post_data  api/studentsDetails  headers=${header}  data=${body}
    ${json_response}=  to json  ${post_response.content}
    log to console  this is status code
    log to console  ${post_response.status_code}
    log to console  ${json_response}
    @{id_list}=  get value from json  ${json_response}  id
    log to console  Hellow printing IDs-----------------------------------------------------
    log to console  ${id_list}
    ${id}=  get from list  ${id_list}  0


    &{body1}=  create dictionary  id=${id}  first_name=Salman  middle_name=R  last_name=${Updated_Last_Name}  date_of_birth=10/14/1994
    ${put_response}=  put request  post_data  api/studentsDetails/${id}  headers=${header}  data=${body1}
    log to console  ${put_response.status_code}
    log to console  ${put_response.content}