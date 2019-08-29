*** Setting ***

Library         SeleniumLibrary        run_on_failure=Capture Page Screenshot


*** Variable***
${Browser}              Chrome
${URL}                  http://192.168.1.52:8081/login
${usertb}               xpath=//input[@name="username"]
${user}                 ajay@ivtree.com
${pwdtb}                xpath=//input[@name="password"]
${pwd}                  ivtree123
${loginbtn}             xpath=//button[@class="btn btn-lg btn-primary btn-block"]
*** Test Cases ***
Login
        Open spring web
        login
*** Keywords ***

Open spring web
	Sleep	30s
        Open Browser    ${URL}  ${Browser}

login
        Input Text      ${usertb}       ${user}
        Input Text      ${pwdtb}        ${pwd}
        Click Button    ${loginbtn}
	Sleep	4s
	Close Browser
