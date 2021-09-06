*** Settings ***
Documentation   Feature: API - consult the Portal VRPAT

Library         REST     http://portal.vr.com.br/api-web/comum/enumerations/VRPAT     ssl_verify=false
Library         String

*** Test Cases ***

endpoint: /api-web/comum/enumerations/VRPAT
  [Tags]  api-test
  I do a get request VRPAT

*** Keywords ***
I do a get request VRPAT
  GET               http://portal.vr.com.br/api-web/comum/enumerations/VRPAT  
  Integer     response status           200  
  ${validation}     Array    response body typeOfEstablishment 
  Should not be empty      ${validation}
  Output    $.typeOfEstablishment[0]
  
  