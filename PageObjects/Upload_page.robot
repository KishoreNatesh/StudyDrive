***setting***
Resource    ../Resources/config/Global.robot
Library    OperatingSystem

*** Variables ***
${upload_add_btn}    //*/button[@id="add-button"]
${upload_doc}    //*/a[contains(text(),'Upload document')]
${upload_page_header}    //*/h2[contains(text(),'Select the course you want to upload to')]
${course_name_text}    //*/input[@placeholder="Enter course name"]
#Python programming
${browse_files}    //*/input[@type="file"]
${file_desc}    //*/input[@placeholder="Add description"]
${upload_select_sem}    //*/input[@placeholder="Select semester"]
${file_type}    //*/input[@placeholder="Select document type"]
${upload_btn}    //*/button[contains(text(),'Upload')]
${maybe_later}    //*/button[contains(text(),'Maybe later')]
${proceed_to_course}    //*/a[contains(text(),'Proceed to course')]
${upload_more_files}    //*/button[contains(text(),'Upload more files')]
${upload_complete}    //*/div[contains(text(),'Upload completed')]
${python_programming_header}    //*/h1[contains(text(),'Python programming')]
${view_file}    //*/span[contains(text(),'View')]
${edit_file}    //div[6]/div[1]/div[1]/i[1]
${delete_file}    //*//div[2]/ul/li[3]/span[contains(text(),'Delete')]
${delete_doc}    //*/button[contains(text(),'Delete document')]

*** Keywords ***
go to upload document
    Wait Until Page Contains Element    ${upload_add_btn}
    Click Element    ${upload_add_btn}
    Wait Until Page Contains Element    ${upload_doc}
    Click Element    ${upload_doc}

select course to upload
    Wait Until Page Contains Element    ${course_name_text}
    Input Text    ${course_name_text}    Python programming
    Sleep    1s
    Press Keys    ${None}   RETURN

upload a file
    # [Arguments]    ${file_path}=../Resources/TestData/pdf-sample01.pdf
    Sleep    2s
    Choose File    ${browse_files}    ${CURDIR}/Resources/TestData/pdf-sample01.pdf
    Wait Until Page Contains Element    ${file_desc}
    Input Text    ${file_desc}    Python programming
    Click Element    ${upload_select_sem}
    Sleep    1s
    Press Keys    ${None}   ARROW_DOWN
    Press Keys    ${None}   RETURN
    Click Element    ${file_type}
    Sleep    1s
    Press Keys    ${None}   ARROW_DOWN
    Press Keys    ${None}   RETURN
    Click Element    ${upload_btn}

verify upload is complete
    Wait Until Page Contains Element    ${upload_complete}
    Page Should Contain Element    ${upload_complete}