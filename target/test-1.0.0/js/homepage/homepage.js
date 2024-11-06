
window.onload = function() {
    getMessage();
}

/* 페이지 로드 시, 알람메시지 가져오기 */
function getMessage(){
    var username = document.getElementById('username').value;
    $.ajax({
        data : {username : username},
        dataType:"json",
        type:"POST",
        url:"/PLT/getMessage.do",
        success:function(response){
            var showMessageDiv = $(".dropdown-list"); // 드롭다운 리스트를 선택
            showMessageDiv.empty(); // 이전 내용을 지우기

            if (response.status === "ok") {
                alert("도착한 알림 메시지가 있습니다.");
                // response.data를 순회하며 각 메시지를 추가
               for (let i = 0; i < response.data.length; i++) {
                        var successORwarning = response.data[i].read === "t" ? 'bg-success' : 'bg-warning';
                        
                        var showMessageView =
                            '<a class="dropdown-item d-flex align-items-center" onclick="is_read(' + response.data[i].notification_id + ')" id="showMessage' + response.data[i].notification_id + '">' +
                                '<div class="dropdown-list-image mr-3">' +
                                    '<span class="material-symbols-outlined">' +
                                        'wifi_notification' +
                                    '</span>' +
                                    '<div class="status-indicator ' + successORwarning + '" id="sta'+response.data[i].notification_id+'"></div>' +
                                '</div>' +
                                '<div class="font-weight-bold">' +
                                    '<div class="text-truncate">' +
                                        response.data[i].message +
                                    '</div>' +
                                    '<div class="small text-gray-500">보낸 강사 이름</div>' +
                                '</div>' +
                                '<button class="btn btn-danger btn-sm ml-auto" onclick="deleteMessage(' + response.data[i].notification_id + '); event.stopPropagation();">삭제</button>' +
                            '</a>';
                        
                        showMessageDiv.append(showMessageView); // 각 메시지를 드롭다운 리스트에 추가
                    }
                var messageCount = showMessageDiv.children().length;
                var messageCountView = document.getElementById('messageCount');
                messageCountView.textContent = messageCount;
            }else if(response.status === "noM") {
                return;
            }else if(response.status === "sqlError"){
                alert("DB에서 알람메시지를 가져오는 도중 오류 발생...");
                return;
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Error details: ", textStatus, errorThrown);
            alert("알람 메시지 수신 중 오류 발생...");
        }
    });
}

// 알람 메시지 읽음 표시
// 알람 메시지 읽음 표시
function is_read(notification_id) {
    $.ajax({
        url: "/PLT/is_read.do", // 실제 경로에 맞게 수정
        data: { notification_id: notification_id },
        dataType: "json",
        type: "POST",
        success: function(response) {
            console.log("끼야아 : " + response.TF);
            if (response.status === "get_read_t") {
                // 클릭한 메시지의 상태를 업데이트
                var statusIndicator = $("#sta" + notification_id); // 해당 메시지의 상태 인디케이터 선택
                var cs = response.TF; // "t" 또는 "f"
                
                // 상태에 따라 클래스 변경
                if (cs === "t") {
                    statusIndicator.removeClass('bg-warning').addClass('bg-success');
                } else {
                    statusIndicator.removeClass('bg-success').addClass('bg-warning');
                }
            } else if (response.status === "get_read_f") {
                // 클릭한 메시지의 상태를 업데이트
                var statusIndicator = $("#sta" + notification_id); // 해당 메시지의 상태 인디케이터 선택
                var cs = response.TF; // "t" 또는 "f"
                
                // 상태에 따라 클래스 변경
                if (cs === "f") {
                    statusIndicator.removeClass('bg-success').addClass('bg-warning');
                } else {
                    statusIndicator.removeClass('bg-warning').addClass('bg-success');
                }
            } else if (response.status === "update_fail") {
                alert("읽기 표시 DB 업데이트 실패");
                return;
            }
        },
        error: function() {
            alert("알람 표시 중 서버 오류 발생!!");
        }
    });
}

/* 해당 알림 메시지 삭제 */
 function deleteMessage(notification_id){
    $.ajax({
        url:"/PLT/deleteMessage.do",
        data:{notification_id:notification_id},
        dataType:"json",
        type:"POST",
        success:function(response){
            if(response === "ok"){
                alert("해당 알림을 삭제했습니다.");
                location.href="/PLT/plt_homepage.do";
            }else if(response === "fail"){
                alert("해당 알림 삭제가 처리되지 않았습니다.");
                return;
            }
        },
        error:function(){
            alert("알람 메시지 삭제 중, 서버 오류 발생!!");
            return;
        }
    })
}

/* 과제 제출 폼 출력 여부 */
function show_submission_form(assignment_id){
  var submissionForm = document.getElementById('submission_form'+assignment_id);
        console.log("표시 : " +  assignment_id);
        if (submissionForm.style.display === "none" || submissionForm.style.display === "") {
            submissionForm.style.display = "block"; 
        } else {
            submissionForm.style.display = "none";
        }
    }
    
function formRegistration(assignment_id) {
    console.log(assignment_id);
    // 입력 값 가져오기
    var assignmentTitle = document.getElementById('assignmentTitle'+assignment_id).value;
    var assignmentDescription = document.getElementById('assignmentDescription'+assignment_id).value;
    var assignmentFile = document.getElementById('assignmentFile'+assignment_id).files[0]; // 파일 객체 가져오기

    console.log(assignmentTitle);
    
    // 유효성 검사
    if (assignmentTitle === "") {
        alert("제출할 과제에 대한 제목을 작성하세요.");
        return;
    }

    if (assignmentDescription === "") {
        document.getElementById('assignmentDescription' + assignment_id).focus();
        alert("과제 내용을 작성하세요.");
        return;
    }

    // FormData 객체 생성
    var formData = new FormData();
    formData.append('assignmentTitle', assignmentTitle);
    formData.append('assignmentDescription', assignmentDescription);
    if (assignmentFile) {
        formData.append('assignmentFile', assignmentFile); // 파일 객체 추가
    }
    formData.append('assignment_id', assignment_id);

    console.log(assignmentFile.name); // FormData의 내용을 출력

 
    $.ajax({
        url: "/PLT/submission.do",
        data: formData,
        dataType: "json",
        type: "POST",
        processData: false, // jQuery가 데이터를 처리하지 않도록 설정
        contentType: false,
        success: function(response) {
            if(response.status === "sub_ok"){
                alert("파일 업로드 중입니다.");
                if(response.file === "completed"){
                    console.log("json 값 : " + response.sub_status);
                    alert("과제 제출이 완료되었습니다.");
                 // 상태 값을 쿠키에 저장
                    if (response.sub_status) {
                        // json 문자열로 변환된 sub_status를 쿠키에 저장
                        document.cookie = "sub_status=" + encodeURIComponent(response.sub_status) + "; path=/; max-age=604800"; // 7일 동안 유지
                    }
                    location.href="/PLT/plt_homepage.do";
                }else if(response.file === "fail"){
                    alert("파일만 업로드가 실패했습니다.");
                    return;
                }
            }else if(response.status ==="submission_fail"){
                alert("과제가 제출되지 않았습니다.");
                return;
            }
            if(response.file_valid === "validError"){
                alert("확장자 및 파일크기를 확인해주세요.\n확장자: 'jpg', 'png', 'hwp', 'pdf', 'mp4'");
                return;
            }
        },
        error: function() {
            alert("파일 제출 도중, 서버 오류 발생!!");
        }
    });
}

function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
}

const subStatus = getCookie('sub_status');
console.log('쿠키의 sub_status:', subStatus);
console.log('쿠키의 sub_status:', document.cookie);

if (subStatus) {
    try {
        const subStatusObject = JSON.parse(subStatus);
        console.log('JSON 변환된 객체:', subStatusObject);
    } catch (error) {
        console.error('JSON 파싱 오류:', error);
    }
}




function fileDelete() {
    var assignmentFile = document.getElementById('assignmentFile')
        assignmentFile.value = '';
}


/* 로그아웃 */
function logout(){
    if (confirm("정말 로그아웃을 하시겠습니까??")) {
        // 확인 버튼을 눌렀을 때 실행될 코드
        alert("로그아웃 되었습니다.");
        location.href="/PLT/logout.do";
    } else {
        // 취소 버튼을 눌렀을 때 실행될 코드
        alert("로그아웃을 취소하였습니다.");
    }
}