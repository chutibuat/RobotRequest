*** Settings ***				
Library	Collections			
Library	RequestsLibrary	

*** Variables ***
${URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***				
Get Requests status 200 and success	
    Create Session    ApiJsonplaceholder    ${URL}
    ${resp}=    Get Request    ApiJsonplaceholder    /comments?postId=1
    Should Be Equal As Strings    ${resp.status_code}    200
    ${resultJson}=     To Json    ${resp.content}
    ${length}=    Get Length    ${resultJson}
    Should Be Equal As Integers    ${length}    5
    &{result}=    Convert To Dictionary    ${resultJson[0]}
    Should Be Equal As Strings    ${result.name}    id labore ex et quam laborum

Get Requests status 404 and not found	
    Create Session    ApiJsonplaceholder    ${URL}
    ${resp}=    Get Request    ApiJsonplaceholder    /comment?postId=1
    Should Be Equal As Strings    ${resp.status_code}    404
    ${resultJson}=     To Json    ${resp.content}
    ${length}=    Get Length    ${resultJson}
    Should Be Equal As Integers    ${length}    0
    