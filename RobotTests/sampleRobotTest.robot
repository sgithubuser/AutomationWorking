*** Settings ***
Library  RequestsLibrary
#while declaring library or variable there should be exactly two spaces between declaration and name of the declared one
*** Variables ***
${Application_URL}  https://www.thetestingworldapi.com


*** Test Cases ***
TC_OO1_GET_Request
    log to console  ${Application_URL}
    ${url}=  set variable  Hello Wosssssssrld  ##variable is set with is equal sign in body of test case while in body of Variables you can set like shown above
    log to console  ${url}