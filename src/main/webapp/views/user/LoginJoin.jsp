<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<!-- jQuery 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<style>
body {
    background: #2c2c2c;
    font-family: "Raleway", sans-serif;
    margin: 0;
    padding: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.form {
    position: relative;
    width: 350px;
    padding: 20px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    box-sizing: border-box;
}

.form .form-header {
    display: flex;
    justify-content: space-around;
    margin-bottom: 20px;
}

.form .form-header > div {
    width: 33.33%;
    color: #ddd;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    text-align: center;
    transition: color 0.3s;
}

.form .form-header > div.active {
    color: #f1575b;
}

.form .arrow {
    position: absolute;
    top: 40px;
    width: 0;
    height: 0;
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    border-bottom: 10px solid #fff;
    transition: left 0.5s;
}

.form.signup .arrow {
    left: calc(33.33% / 2 - 5px);
}

.form.signin .arrow {
    left: calc(33.33% + (33.33% / 2) - 5px);
}

.form.find_id .arrow {
    left: calc(66.66% + (33.33% / 2) - 5px);
}
.form.find_pw .arrow {
    left: calc(66.66% + (33.33% / 2) - 5px);
}

.form .form-elements {
    display: flex;
    flex-direction: column;
}

.form .form-elements .form-element {
    margin-bottom: 15px;
    display: block; /* 기본적으로 모두 보이도록 설정 */
}

/* 특정 폼 상태에서 필드 숨기기 */
.form.signin .form-element,
.form.find_id .form-element,
.form.find_pw .form-element {
    display: none; /* 기본적으로 숨김 */
}

/* Sign Up: 모든 필드 표시 */
.form.signup .form-element {
    display: block;
}

/* Sign In: Username, Password, Submit 버튼 표시 */
.form.signin .username,
.form.signin .password,
.form.signin .submit-btn {
    display: block;
}

/* find_id일 때 username 숨기고 email 보이기 */
.form.find_id .username {
    display: none;
}
/* find_id : Username, Submit 버튼 표시 */
.form.find_id .email,
.form.find_id .submit-btn {
    display: block;
}
/* find_pw : Username, Submit 버튼 표시 */
.form.find_pw .email,
.form.find_pw .submit-btn,
.form.find_pw #container_emailVerificate,
.form.find_pw #container_verification_code {
    display: block;
}

/* 사용자 역할 라벨 스타일 */
.user-role-label {
    display: block;
    margin-bottom: 8px;
    font-size: 16px;
    font-weight: 600;
    color: #333;
    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
    background-color: #f9f9f9;
    padding: 5px 10px;
    border-radius: 4px;
    border: 1px solid #ddd;
    transition: color 0.3s, background-color 0.3s;
    width:36%;
}


.user-role-label::before {
    content: "👤 ";
}

.user-role-label:hover {
    color: #007BFF;
}

/* 입력 필드 및 버튼 스타일 */
.form .form-elements input,
.form .form-elements select,
.form .form-elements button {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border-radius: 10px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    background: #f5f5f5;
    outline: none;
}

.form .form-elements button {
    background: #f1575b;
    color: #fff;
    font-weight: 600;
    border: none;
    cursor: pointer;
    transition: background 0.3s;
}

.form .form-elements button:hover {
    background: #e94b4b;
}

span {
    font-size: 12px;
    margin-top: 5px;
    display: none; /* 기본적으로 숨김 */
}

.form-element select {
    background: #fff;
    cursor: pointer;
}

#container{
width:100%;
heigth:50px;
position : relative;
display:flex;
}
#container input{
	width : 100%;
}
#container button{
    position: absolute;
    right: 5px;
    border-radius: 10px;
    width:30%;
    padding: 6px 10px;
    top:3px;
}
#container2{
width:100%;
heigth:50px;
position : relative;
display:flex;
}
#container2 input{
	width : 100%;
}
#container2 button{
    position: absolute;
    right: 5px;
    border-radius: 10px;
    width:30%;
    padding: 6px 10px;
    top:3px;
}


</style>
</head>

<body>
    <div class="form signup">
        <div class="form-header">
            <div class="show-signup active">Sign Up</div>
            <div class="show-signin">Sign In</div>
            <div class="show-find_id">Find_ID</div>
            <div class="show-find_pw">Find_PW</div>
        </div>
        <div class="arrow"></div>
        <div class="form-elements">
            <!-- Username -->
            <div class="form-element username"  id="container">
                <input type="text" placeholder="Username" id="username">
                <button type="button" id="duplicate_id" onclick="duplicate_id()">중복확인</button>
            </div>
            
            <!-- Password with validation -->
            <div class="form-element password">
                <input type="password" placeholder="Password" id="password" oninput="validatePassword()" required>
                <span id="password-msg" style="color: red; display: none;">
                    비밀번호는 최소 8자 이상, 대문자 하나, 숫자 하나, 특수문자 하나를 포함해야 합니다.
                </span>
            </div>

            <!-- Confirm Password -->
            <div class="form-element confirm-password">
                <input type="password" placeholder="Confirm Password" id="confirm_password" oninput="validateConfirmPassword()" required>
                <span id="confirm-msg" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</span>
            </div>

            <!-- Email -->
            <div class="form-element email" id="email-container">
                <input type="email" placeholder="Email" id="email" required>
            </div>

            <!-- Email verification button -->
            <div class="form-element send-verification" id="container_emailVerificate">
                <button type="button" id="send-verification-btn" onclick="sendVerificationCode()">인증번호 전송</button>
            </div>


            <!-- Verification code input -->
            <div class="form-element verification-code" id="container2">
                <input type="text" placeholder="인증번호를 입력하세요." id="verification_code">
                <button type="button" id="verify-code-btn" onclick="verifyCode()">인증확인</button>
                <span id="verification-msg" style="color: green; display: none;">이메일이 인증되었습니다!</span>
            </div>
            


            <!-- User Role Selection -->
            <div class="form-element user-role">
                <label for="user-role" class="user-role-label">사용자 역할</label>
                <select id="user-role" required>
                    <option value="">선택하세요</option>
                    <option value="student">학생</option>
                    <option value="instructor">강사</option>
                </select>
                <span id="role-msg" style="color: red; display: none;">사용자 역할을 선택해주세요.</span>
            </div>

            <!-- Submit button -->
            <div class="form-element submit-btn">
                <button type="button" id="submit-btn" onclick="handleSubmit()">Sign Up</button>
            </div>
            <div style="text-align: center;">
            	<a href="/PLT/plt_homepage.do" >
            	<img src="/images/홈.png" alt="home" style="width: 10%; height: auto;">
            </a>
            </div>
            
        </div>
    </div>

    <script type="text/javascript">
    
    var code = 0;
    var InJung = false // 인증 코드 확인 상태 변수
    var duplicate_id_valied = false; //아이디 중복확인 함수
     
     
     function duplicate_id(){
         var username = document.getElementById('username').value;
         
         if(username === ""){
             alert("아이디를 입력해주세요.");
             return;
         }
         
         $.ajax({
            url:"/PLT/duplicate_id.do",
            type:"POST",
            data :{ username : username} ,
            dataType:"json",
            success:function(response){
                console.log(response);
                if(response==="ok"){
                    alert("중복된 아이디입니다.");
                    duplicate_id_valied = false;
                    return;
                }else if(response ==="fail"){
                    duplicate_id_valied = true;
                    alert("사용가능한 아이디입니다.");
                }else{
                    alert("오류 발생!!");
                }
            },
            error:function(){
                alert("서버 오류 발생!!");
            }
         });
     };
    
    
        // 클래스 초기화 함수
        function resetClass(element, classname){
            element.classList.remove(classname);
        }

        // 폼 전환 함수
        function switchForm(formType, buttonText) {
            let form = document.getElementsByClassName("form")[0];
            resetClass(form, "signup");
            resetClass(form, "signin");
            resetClass(form, "find_id");
            resetClass(form, "find_pw");
            form.classList.add(formType);

            // 제출 버튼 텍스트 변경
            document.getElementById("submit-btn").innerText = buttonText;

            // 폼 헤더 활성화 상태 업데이트
            updateFormHeader(formType);
        }

     // 폼 헤더 활성화 상태 업데이트
        function updateFormHeader(activeFormType) {
            if (activeFormType === undefined) {
                activeFormType = "signup";
            }
            const headers = document.querySelectorAll(".form-header div");
            headers.forEach(function(header) {
                header.classList.remove("active");
            });

            if (activeFormType === "signup") {
                document.querySelector(".show-signup").classList.add("active");
                
             // username이 없을 경우에만  다시 추가
                if (!document.getElementById('username')) {
                    var newInput = document.createElement("input");
                    newInput.type = "text";
                    newInput.id = "username";
                    newInput.placeholder = "Username";

                    // 버튼을 #container 내에 추가
                    document.getElementById('container').appendChild(newInput);
                }
             
                // 버튼이 없을 경우에만 중복 확인 버튼을 다시 추가
                if (!document.getElementById('duplicate_id')) {
                    var newButton = document.createElement("button");
                    newButton.type = "button";
                    newButton.id = "duplicate_id";
                    newButton.innerText = "중복확인";
                    newButton.setAttribute("onclick", "duplicate_id()");

                    // 버튼을 #container 내에 추가
                    document.getElementById('container').appendChild(newButton);
                }
                
                
                // 인증번호 입력 생성
                if(!document.getElementById('verification_code')){
                    var newInput = document.createElement("input");
                    newInput.type = "text";
                    newInput.id = "verification_code";
                    newInput.placeholder = "인증번호를 입력하세요.";

                    // 버튼을 #container2 내에 추가
                    document.getElementById('container2').appendChild(newInput);
                }
                
                
             // 인증번호 확인 버튼이 없을 경우 추가
                if (!document.getElementById('verify-code-btn')) {
                    var verifyButton = document.createElement("button");
                    verifyButton.type = "button";
                    verifyButton.id = "verify-code-btn";
                    verifyButton.innerText = "인증확인";
                    verifyButton.setAttribute("onclick", "verifyCode()");

                    // 버튼을 추가할 부모 요소를 선택
                    var parentContainer = document.getElementById("container2"); 
                    if (parentContainer) {
                        parentContainer.appendChild(verifyButton);
                    } else {
                        console.error('Parent container not found');
                    }
                }
           
                
                
            } else if (activeFormType === "signin") {
                document.querySelector(".show-signin").classList.add("active");
                
                if (!document.getElementById('username')) {
                    var newInput = document.createElement("input");
                    newInput.type = "text";
                    newInput.id = "username";
                    newInput.placeholder = "Username";

                    // 버튼을 #container 내에 추가
                    document.getElementById('container').appendChild(newInput);
                }
             // 버튼 삭제 로직 (중복 확인 버튼 제거)
                var btn1 = document.getElementById('duplicate_id');
                if (btn1) {
                    btn1.remove();
                }
                
             // 인증번호 입력란과 확인 버튼 제거
                var verificationInput = document.getElementById('verification_code');
                if (verificationInput) {
                    verificationInput.remove();
                }

                var verifyButton = document.getElementById('verify-code-btn');
                if (verifyButton) {
                    verifyButton.remove();
                }

             
            } else if (activeFormType === "find_id") {
                document.querySelector(".show-find_id").classList.add("active");
             // Username 입력란 삭제
                var usernameInput = document.getElementById('username');
                if (usernameInput) {
                    usernameInput.remove();
                }
                // 버튼 삭제 로직 (예: 중복 확인 버튼 제거)
                var btn = document.getElementById('duplicate_id');
                if (btn) {
                    btn.remove();
                } 
                
             // 인증번호 입력란과 확인 버튼 제거
                var verificationInput = document.getElementById('verification_code');
                if (verificationInput) {
                    verificationInput.remove();
                }

                var verifyButton = document.getElementById('verify-code-btn');
                if (verifyButton) {
                    verifyButton.remove();
                }
                
                
                
            }else if (activeFormType === "find_pw") {
                document.querySelector(".show-find_pw").classList.add("active");

                // Username 입력 필드가 없을 경우 추가
                if (!document.getElementById('username')) {
                    var newInput = document.createElement("input");
                    newInput.type = "text";
                    newInput.id = "username";
                    newInput.placeholder = "Username";
                    document.getElementById('container').appendChild(newInput);
                }

                // 인증번호 전송 버튼이 없을 경우 추가
                if (!document.getElementById('send-verification-btn')) {
                    var newButton = document.createElement("button");
                    newButton.type = "button";
                    newButton.id = "send-verification-btn";
                    newButton.innerText = "인증번호 발송";
                    newButton.setAttribute("onclick", "sendVerificationCode()");
                    document.getElementById('container_emailVerificate').appendChild(newButton);
                }

             // 인증번호 입력 생성
                if(!document.getElementById('verification_code')){
                    var newInput = document.createElement("input");
                    newInput.type = "text";
                    newInput.id = "verification_code";
                    newInput.placeholder = "인증번호를 입력하세요.";

                    // 버튼을 #container2 내에 추가
                    document.getElementById('container2').appendChild(newInput);
                }
                
                
             // 인증번호 확인 버튼이 없을 경우 추가
                if (!document.getElementById('verify-code-btn')) {
                    var verifyButton = document.createElement("button");
                    verifyButton.type = "button";
                    verifyButton.id = "verify-code-btn";
                    verifyButton.innerText = "인증확인";
                    verifyButton.setAttribute("onclick", "verifyCode()");

                    // 버튼을 추가할 부모 요소를 선택
                    var parentContainer = document.getElementById("container2"); 
                    if (parentContainer) {
                        parentContainer.appendChild(verifyButton);
                    } else {
                        console.error('Parent container not found');
                    }
                }

                // 기존의 ID 중복 확인 버튼 삭제
                var btn = document.getElementById('duplicate_id');
                if (btn) {
                    btn.remove();
                }
            }

        }

        // 비밀번호 검증 함수
        function validatePassword() {
            const password = document.getElementById("password").value;
            const passwordMsg = document.getElementById("password-msg");

            // 비밀번호 정규식: 최소 8자, 대문자 1개, 숫자 1개, 특수문자 1개
            const passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/;

            if (passwordRegex.test(password)) {
                passwordMsg.style.display = "none";
            } else {
                passwordMsg.style.display = "block";
            }
        }

        // 비밀번호 확인 검증 함수
        function validateConfirmPassword() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirm_password").value;
            const confirmMsg = document.getElementById("confirm-msg");

            if (password === confirmPassword) {
                confirmMsg.style.display = "none";
            } else {
                confirmMsg.style.display = "block";
            }
        }

        // 이메일 인증번호 전송 함수
        function sendVerificationCode() {
            
            const email = document.getElementById("email").value;
            if(email === "" || email === null){
                alert("이메일을 입력해주세요.");
                return;
            }else if (!validateEmail(email)) {
                alert("유효한 이메일 주소를 입력해주세요.");
                return;
            }
            
            
		$.ajax({
		   type:"POST",
		   url:"/PLT/join_email_certification.do",
		   data : {email : email},
		   dataType:"json",
		   success:function(response){
		       if(response.status === "ok"){
		           console.log("이메일 인증번호 전송 상태 : " + response);
		           code = response;
		           console.log("인증번호 : " + code.certification_Code);
		           alert("인증번호가 이메일로 전송되었습니다.");
		       }else if(response.status === "fail"){
		           alert("인증번호 발송이 실패했습니다.");
		           return;
		       }else if(response.status === "invalid" || response === null){
		           alert("이메일의 입력 및 형식을 확인해주세요.");
		           return;
		       }
		   },
		   error:function(){
		       alert("에러가 발생했습니다. 다시 시도해주세요.");
		       return;
		   }
		});
        }

        // 이메일 형식 검증 함수
        function validateEmail(email) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }

        // 인증번호 확인 함수
        function verifyCode() {
            const enteredCode = document.getElementById("verification_code").value;
            const sentCode = code.certification_Code;
            const verificationMsg = document.getElementById("verification-msg");

            console.log("입력한 인증번호 : " + enteredCode);
            console.log("전송받은 인증번호 : " + sentCode);
            
            if (enteredCode === "") {
                alert("인증번호를 입력해주세요.");
                InJung = false;
				return; 
            }else if (enteredCode === sentCode) {
                alert("인증 성공! 인증번호가 일치합니다.");
                verificationMsg.style.display = "block";
                InJung = true; 
                return;
            } else {
                alert("잘못된 인증번호입니다.");
                verificationMsg.style.display = "none";
                InJung = false;
                return;
            }
        }

        // 폼 제출 처리 함수
        function handleSubmit() {
            const formType = document.querySelector(".form").classList.contains("signup") ? "signup" :
                             document.querySelector(".form").classList.contains("signin") ? "signin" :
                            document.querySelector(".form").classList.contains("find_id") ? "find_id" :  "find_pw";
            if (formType === "signup") {
                // 회원가입 검증
                const username = document.getElementById("username").value.trim();
                const password = document.getElementById("password").value;
                const confirmPassword = document.getElementById("confirm_password").value;
                const email = document.getElementById("email").value.trim();
                const verificationCode = document.getElementById("verification_code").value.trim();
                const userRole = document.getElementById("user-role").value;
            	 // 이메일 인증 검증
                const sentCode = code.certification_Code;
                let valid = true;

                // 사용자 역할 검증
                const roleMsg = document.getElementById("role-msg");
                if (userRole === "") {
                    roleMsg.style.display = "block";
                    valid = false;
                } else {
                    roleMsg.style.display = "none";
                }
                
                
                // 비밀번호 검증
                const passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/;
                // 기타 필드 검증
                if (username === "" || password === "" || confirmPassword === "" || email === "" || verificationCode === "") {
                    alert("모든 필드를 입력해주세요.");
                    valid = false;
                    return;
                } else if (username === "") {
                    alert("아이디를 입력해주세요.");
                    valid = false;
                    return;
                }else if (duplicate_id_valied !== true) {
                    alert("아이디 중복체크를 확인해주세요.");
                    valid = false;
					return;
                }else if (!passwordRegex.test(password)) {
                    alert("비밀번호 형식이 올바르지 않습니다.");
                    valid = false;
                    return;
                }
				 // 비밀번호 일치 검증
				 else if (password !== confirmPassword) {
                    alert("비밀번호가 일치하지 않습니다.");
                    valid = false;
                    return;
                }

                // 이메일 인증 검증
                else if (verificationCode !== sentCode || InJung !== true) {
                    alert("이메일 인증이 완료되지 않았습니다.");
                    valid = false;
                    return;
                }else if (valid) {
                    var formdata = {username : username, password :password,confirmPassword : confirmPassword,
                            email : email, role_name : userRole,verificationCode : verificationCode};
                    $.ajax({
                        type:"POST",
                        url:"/PLT/join.do",
                        data: formdata,
                        dataType:'json',
                        success:function(response){
                           if(response === "ok"){
                               console.log("회원가입 데이터:", response);
                               alert("회원가입이 완료되었습니다!");
                               location.href="/PLT/LoginJoin.do";
                              
                           	}else if(response === "duplicate_email"){
                           	    alert("동일한 이메일은 사용할 수 없습니다.");
                           	    return;
                           	}else if(response === "fail"){
                           	    alert("회원가입이 실패했습니다.");
                           	    return;
                           	}
                           },
                        error:function(response){
                            console.log(response);
                            alert("회원가입 도중, 오류가 발생하였습니다.");
                        }
                        
                    });
                    
                    // 폼 초기화
                    document.querySelector(".form").reset();
                    document.getElementById("verification-msg").style.display = "none";
                    
                }

            } else if (formType === "signin") {
                
                // 로그인 처리
                const username = document.getElementById("username").value.trim();
                const password = document.getElementById("password").value;

                if (username === ""){
                    alert("아이디를 입력해주세요");
                    return;
                }else if(password === "") {
                    alert("비밀번호를 입력해주세요.");
                    return;
                }
                
                var data = {username : username, password : password};
                
                $.ajax({
                   url:"/PLT/login.do",
                   data : data,
                   dataType:"json",
                   type : "POST",
                   success:function(response){
                       console.log(response);
                       if(response === "valied_Id_Pw"){
                           alert("아이디 및 비밀번호를 입력해주세요.");
                           return;
                       }else if(response === "ok"){
                           alert("로그인이 성공하였습니다.");
                           location.href="/PLT/plt_homepage.do";    
                       }else if(response === "valied_id"){
                           alert("아이디가 일치하지 않습니다.");
                           return;
                       }else if(response === "valied_pw"){
                           alert("비밀번호가 일치하지 않습니다.");
                           return;
                       }else if(response === "fail"){
                           alert("사용자 계정이 존재하지 않습니다.");
                           return;
                       }else{
                           alert("알 수 없는 오류가 발생하였습니다.");
                       }
                       
                   },
                   error:function(){
                      alert("[서버 확인 요망] \n 서버 오류가 발생하였습니다.");
                   }
                    
                });
                

                
            } else if (formType === "find_id") {
                // 아이디 찾기
                const email = document.getElementById("email").value.trim();

                if (email === "") {
                    alert("이메일을 입력해주세요.");
                    return;
                }else if(!validateEmail(email)){
                    alert("유효하지 않은 이메일 형식입니다.");
                    return;
                }
                
                $.ajax({
                    type : "POST",
                    data :{email : email},
                    dataType : "json",
                    url:"/PLT/find_id.do",
                    success:function(response){
                        console.log(response);
                        if(response.status === "ok"){
                            alert("아이디 찾기 성공!!\n아이디는 ["+response.username+"] 입니다.");    
                            location.href="/PLT/LoginJoin.do";
                        }else if(response.status === "fail"){
                            alert("존재하지 않는 계정입니다. 회원가입을 해주세요.");
                            location.href="/PLT/LoginJoin.do";
                            return;
                        }else if(response.status == "email_invalid"){
                            alert("이메일을 입력해주세요.");
                            return;
                        }
                        
                    },
                    error:function(){
                        alert("서버오류가 발생하였습니다.");
                    }
                });

            }else if (formType === "find_pw"){
                /* 비밀번호 찾기 */
                var username = document.getElementById('username').value;
                var email = document.getElementById('email').value;
                var verification_code = document.getElementById('verification_code').value;
                const enteredCode = document.getElementById("verification_code").value;
                const sentCode = code.certification_Code;
                
                
                if(username === ""){
                    alert("아이디를 입력해주세요.");
                    return;
                }else if(email === ""){
                    alert("이메일을 입력해주세요.");
                   	return;
                }else if(!validateEmail(email)){
                    alert("유효하지 않은 이메일 형식입니다.");
                    return;
                }else if(verification_code == "" || InJung !== true){
                    alert("인증번호를 확인해주세요."); 
                    return;
                }else if (enteredCode !== sentCode) {
                    alert("인증번호가 다릅니다.");
                    return;
                }
                
                $.ajax({
                   url:"/PLT/find_pw.do",
                   data : {username : username, email : email},
                   dataType : "json",
                   type:"POST",
                   success:function(response){
                       if(response.status === "ok"){
                           alert("비밀번호 찾기 성공!!\n비밀번호는 ["+response.password+"] 입니다.");
                           location.href="/PLT/LoginJoin.do";
                       }else if(response.status === "fail"){
                           alert("아이디 혹은 이메일이 일치하지 않습니다.");
                           return;
                       }else if(response.status === "invalid_id_email"){
                           alert("아이디 혹은 이메일을 입력해주세요.")
                       }
                   },
                   error:function(){
                       alert("서버오류가 발생하였습니다.");
                   }
                    
                });
                
            }
        }

        // 폼 전환 이벤트 리스너
        document.getElementsByClassName("show-signup")[0].addEventListener("click", function(){
            switchForm("signup", "Sign Up");
        });

        document.getElementsByClassName("show-signin")[0].addEventListener("click", function(){
            switchForm("signin", "Sign In");
        });

        document.getElementsByClassName("show-find_id")[0].addEventListener("click", function(){
            switchForm("find_id", "Find_ID");
        });
        
        document.getElementsByClassName("show-find_pw")[0].addEventListener("click", function(){
            switchForm("find_pw", "Find_PW");
        });
    </script>
</body>
</html>
