***Settings***
Library         SeleniumLibrary
Library         BuiltIn

***Variables***
${URL}              https://xxx.com
${realPhonenumber}  +66XXXXXXXXX
${OTP}              123456
${ID}               1111111111111
${laserID}          222222222222
${fullname}         ชื่อจริง นามสกุลจริง
${DoB}              12/12/2540
${accountName}      Jane Doe
${accountNumber}    123121233
${resultPhoneNumber}
${resultOTP}
${resultID}
${resultLaserid}
${resultFullname}
${resultDoB}
${resultAccountName}
${resultAccountNumber}


***Test Cases***
Initialize
    #Initialize Selenium
    Set selenium speed       0.2s
    Set selenium timeout    10s

verify thai phone number
    Open Browser    ${URL}   chrome
    Maximize browser window
    page Should contain     WELCOME
    input text      id=phone number    ${realPhonenumber}
    press button    id=submit
    sleep   5s
    ${resultPhoneNumber}      get text    id=message
    run key word if     ${resultPhoneNumber} == 'error'
        log to console  the phone number is not correct. 
    end
    page Should contain     สมาชิกใหม่

website can verify OTP
    page Should contain     สมาชิกใหม่
    input text      id=otp-feild    ${OTP}
    sleep   5s
    ${resultOTP}      get text    id=message2
    run key word if     ${resultOTP} == 'error'
        log to console      the OTP is not correct.
    end
    page should contain     ข้อมูลส่วนตัว

website can verify personal information
    page should contain     ข้อมูลส่วนตัว
    input text      id=ID       ${ID}
    ${resultID}     get text    id=result-ID
    run key word if     ${resultID} == 'error'
        log to console      the ID is not correct.
    end

    input text      id=laserID       ${laserID}
    ${resultLaserid}        get text    id=result-laserID
    run key word if     ${resultLaserid} == 'error'
        log to console      the laserID is not correct.
    end

    input text      id=fullname       ${fullname}
    ${resultFullname}        get text    id=result-fullname
    run key word if     ${resulFullanme} == 'error'
        log to console      the fullname is not correct.
    end

    input number      id=DateOfBirth       ${BoD}
    ${resultDoB}        get text    id=result-DateOfBirth
    run key word if     ${resultLaserid} == 'error'
        log to console      date of birth is not correct.
    end
    press button    id=submit
    page should contain     บัญชีธนาคาร

verify bank account
    page should contain     บัญชีธนาคาร
    select frame        xpath=//iframe[@name='scb']
    input text      id=account-name     ${accountName}
    ${resultAccountName}    get text    id=result-Accountname   
    run key word if     ${resultAccountName} == 'error'
        log to console      account name is not correct.
    end

    input text      id=account-number     ${accountNumber}
    ${resultAccountNumber}    get text    id=result-Accountnumber   
    run key word if     ${resultAccountNumber} == 'error'
        log to console      account number is not correct.
    end
    press button    id=submit
    page should contain     Successfully

