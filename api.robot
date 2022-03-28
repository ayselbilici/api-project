*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary


*** Variables ***
${base_URL}     https://apimocha.com/mygrocery
${endpoint1}    /allGrocery
${endpoint2}    /allGrocery/apple


*** Test Cases ***
Grocery All Fruit Get Request

    create session  mysesion    ${base_URL}

    ${response}=    get on session    mysesion    ${endpoint1}

    Should Not Be Empty   ${response.content}
    Status Should Be  200

Grocery Selected Name Get Request

    create session  mysesion    ${base_URL}

    ${response}=    get on session    mysesion    ${endpoint2}

    Should Not Be Empty   ${response.content}
    Status Should Be  200


Grocery Add Fruit Post Request

    create session  mysesion    ${base_URL}

    ${body}=    Create Dictionary    name=banana    price=10    stock=50
    ${response}=    POST    ${base_URL}/allGrocery/add    json=${body}

    Status Should Be  200
