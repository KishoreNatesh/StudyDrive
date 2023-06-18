***setting***
Resource    ../Resources/config/Global.robot
Library    OperatingSystem

*** Variables ***
${upload_add_btn}    //*/button[@id="add-button"]
${upload_doc}    //*/a[contains(text(),'Upload document')]
${upload_page_header}    //*/h2[contains(text(),'Select the course you want to upload to')]
${course_name_text}    //*/input[@placeholder="Enter course name"]
#Python programming
${browse_files}    xpath=//*/input[@type="file"]
${file_desc}    //*/input[@placeholder="Add description"]
${upload_select_sem}    //*/input[@placeholder="Select semester"]
${file_type}    //*/input[@placeholder="Select document type"]
${upload_btn}    //*/button[contains(text(),'Upload')]
${maybe_later}    //*/button[contains(text(),'Maybe later')]
${proceed_to_course}    //*/a[@id="proceed-to-course"]
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
    [Arguments]    ${file_path}=pdf-sample01.pdf
    Sleep    2s
    ${canonical_path}=    Evaluate    sys.modules['os'].path.normpath('''${CURDIR}/../Resources/TestData/${file_path}''')
    Log    ${canonical_path}
    Choose File    ${browse_files}    ${canonical_path}
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

verify deletion of uploaded file
    Wait Until Page Contains Element    ${proceed_to_course}
    Click Element    ${proceed_to_course}
    ${current_windows} =	Get Window Handles
    Log    ${current_windows}
    Switch Window    ${current_windows[1]}
    Sleep    2s
    Wait Until Page Contains Element    ${view_file}
    Click Element    ${view_file}
    Wait Until Page Contains Element    ${edit_file}
    Click Element    ${edit_file}
    Wait Until Page Contains Element    ${delete_file}
    Click Element    ${delete_file}
    Wait Until Page Contains Element    ${delete_doc}
    Click Element    ${delete_doc}
    Wait Until Page Contains    Share your documents and get great rewards
    Page Should Contain    Share your documents and get great rewards