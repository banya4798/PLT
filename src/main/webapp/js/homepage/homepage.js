// 페이지 로드 시 수행
window.onload = function() {
    getMessage();
    giveData();
    
    
    const subStatus = getCookie('sub_status');
    console.log('쿠키의 sub_status:', subStatus);
    if (subStatus) {
        try {
         // URL 디코딩
            const decodedSubStatus = decodeURIComponent(subStatus);
            console.log('디코딩된 sub_status:', decodedSubStatus);
            // JSON 파싱
            const subStatusObject = JSON.parse(decodedSubStatus);
            console.log('json 변환된 객체:', subStatusObject);
            console.log("json에서 assignment_id 값 추출 : " + subStatusObject.assignment_id);
            console.log("json에서 status값 추출 : " + subStatusObject.status);
            
            var assignment_id = subStatusObject.assignment_id;
            var status = subStatusObject.status;
            
            $.ajax({
                   url:"/PLT/plt_homepage.do",
                   data:{assignment_id: assignment_id, status : status},
                   type:"POST",
                   error:function(){
                       console.log("쿠키에 저장된 과제상태 값을 서버에 보내는 데에 실패했습니다.");
                   }
            });
            
         // 카드 비활성화
            const cardBody = document.getElementById('sub' + status);
            console.log("카드바디의 아디 : " +cardBody);
            if (cardBody) {
                cardBody.classList.add('disabled'); // CSS 클래스를 추가하여 비활성화
                // 버튼으로 대체
                cardBody.innerHTML = 
                    '<div class="col-auto">'
                        + '<button type="button" class="btn btn-secondary" disabled>'
                            +'제출완료'
                        +'</button>'
                    +'</div>';
            }
            
        } catch (error) {
            console.error('JSON 파싱 오류:', error);
            console.log('sub_status는 유효한 json이 아닙니다:', subStatus);
        }
    };
 
}


    


function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
}


function giveData(){
    var username = document.getElementById('username').value;
    var assginment_id = document.getElementById('assginment_id').value;
    
    console.log("현재 접속중인 닉네임 : " + username);
    console.log("현재 접속중인 학생이 제출하는 강사과제등록아디 : " + assginment_id);
    
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
 function show_submission_form(assignment_id, title, description,instructor_id) {
     var submissionForm = document.getElementById('submission_form');
     console.log("표시 : " + assignment_id);
     console.log("submissionForm : " + submissionForm);
     
     // 폼을 표시
     if (submissionForm.style.display === "none" || submissionForm.style.display === "") {
         submissionForm.style.display = "block"; 
     } else {
         submissionForm.style.display = "none";
         return; // 이미 보이고 있으면 종료
     }

     // 폼에 과제 정보 채우기
     document.getElementById('assignmentTitle').value = title;
     document.getElementById('assignmentDescription').value = description;
     document.getElementById('assignment_Id').value = assignment_id;
     document.getElementById('instructor_id').value = instructor_id;
     // max_grade가 필요하다면 여기에 추가
 }
    
function formRegistration() {
   var assignment_id = document.getElementById('assignment_Id').value;
   var instructor_id = document.getElementById('instructor_id').value;
    console.log(assignment_id);
    console.log("강사아이디:"+instructor_id);
    // 입력 값 가져오기
    var assignmentTitle = document.getElementById('assignmentTitle').value;
    var assignmentDescription = document.getElementById('assignmentDescription').value;
    var assignmentFile = document.getElementById('assignmentFile'); // 파일 객체 가져오기

    console.log(assignmentTitle);
    console.log(assignmentDescription);
    console.log(assignmentFile);
    
    // 유효성 검사
    if (assignmentTitle === "") {
        alert("제출할 과제에 대한 제목을 작성하세요.");
        return;
    }else if (assignmentDescription === "") {
        document.getElementById('assignmentDescription').focus();
        alert("과제 내용을 작성하세요.");
        return;
    }


        if(confirm("과제를 제출하면 수정하지 못합니다. 과제를 제출하시겠습니까?")){
            // FormData 객체 생성
            var formData = new FormData();
            formData.append('assignmentTitle', assignmentTitle);
            formData.append('assignmentDescription', assignmentDescription);
            if (assignmentFile) {
                formData.append('assignmentFile', assignmentFile.files[0]); // 파일 객체 추가
            }
            formData.append('assignment_id', assignment_id);
            formData.append('instructor_id', instructor_id);
        
         
                $.ajax({
                    url: "/PLT/submission.do",
                    data: formData,
                    dataType: "json",
                    type: "POST",
                    processData: false, // jquery가 데이터를 처리하지 않도록 설정
                    contentType: false,
                    success: function(response) {
                        if(response.status === "sub_ok"){
                            alert("파일 업로드 중입니다.");
                            if(response.file === "completed"){
                             // 상태 값을 쿠키에 저장
                               /* if (response.sub_status) {
                                    console.log("json 값 : " + response.sub_status); // 인코딩되어 들어온 json데이터
                                    // URL 디코딩
                                    const decodedSubStatus = decodeURIComponent(response.sub_status);
                                    console.log('디코딩된 sub_status:', decodedSubStatus);
                                    // json 문자열로 변환된 sub_status를 쿠키에 저장
                                    document.cookie = "sub_status=" + response.sub_status + "; path=/; max-age=604800"; // 7일 동안 유지
                                    }*/
                                   
                                }
                                alert("과제 제출이 완료되었습니다.");
                               location.href="/PLT/plt_homepage.do";
                            }else if(response.file === "fail"){
                                alert("파일만 업로드가 실패했습니다.");
                                return;
                            } else if(response.status ==="submission_fail"){
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
        }else{
        alert("과제 제출을 취소하였습니다.");
        return;
    }

}



function fileDelete() {
    var assignmentFile = document.getElementById('assignmentFile')
        assignmentFile.value = '';
}


/*강사의 과제 채점위한 데이터 셋팅*/
function give_score(submissions_id,title, content, student_id, f_origin_name,submitted_at, assignment_id ){
    console.log(assignment_id);
        document.getElementById('s_submissions_id').value = submissions_id;
       document.getElementById('s_title').value = title;
        document.getElementById('s_content').value = content;
        document.getElementById('s_student_id').value = student_id;
       document.getElementById('s_f_origin_name').value = f_origin_name;
       document.getElementById('s_submitted_at').value = submitted_at;
       document.getElementById('aaa_id').value = assignment_id;
        $('#score_feedbackModal').modal('show');
}

/*강사의 과제 채점*/
function give_score_to_student() {
    var student_id = document.getElementById('s_student_id').value;
    var submissions_id = document.getElementById('s_submissions_id').value;
    var rating = document.getElementById('s_rating').value;
    var s_feedback = document.getElementById('s_feedback').value;
    var assignment_id = document.getElementById('aaa_id').value;
    
    console.log("student_id : " + student_id);
    console.log("submissions_id : " + submissions_id);
    console.log("rating : " + rating);
    console.log("s_feedback : " + s_feedback);
    console.log('aa_id : ' + assignment_id);
    
    var formData = {
            student_id : student_id,
            submissions_id : submissions_id,
            rating : rating,
            s_feedback : s_feedback,
            assignment_id:assignment_id
    }
    
    $.ajax({
        url:"/PLT/give_score.do",
        data : formData,
        dataType:"json",
        type:"POST",
        success:function(response){
            if(response.status === "allOk"){
                alert("과제 채점이 완료되었습니다.");
                location.href="/PLT/plt_homepage.do";
            }else if(response.status==="student_score_fail"){
                alert("채점한 과제에 대해 학생에게 점수를 반영하지 못하였습니다.");
                return;
            }else if(response.status === "noGiveScore"){
                alert("과제가 채점되지 않았습니다.");
                return;
            }
        },
        error:function(){
            alert("과제 채점 도중, 서버 오류가 발생했습니다...");
            return;
        }
    });
}




/*강사가 채점한 과제 정보*/
function score_info(rating, common, f_date){
    document.getElementById('score_completed_date').value= f_date;
    document.getElementById('finally_score').value= rating;
    document.getElementById('finally_feedback').value= common;
    $('#scre_info').modal('show');
}


/*학생이 제출한 과제를 강사가 삭제*/
function trash_this(submissions_id){
    console.log(submissions_id);
    
    if(confirm("학생이 제출한 해당 과제를 삭제하시겠습니까?")){
        $.ajax({
            url:"/PLT/student_submiision_delete_from_instructor.do",
            data : {submissions_id:submissions_id},
            dataType:"json",
            type:"POST",
            success:function(response){
                if(response === "ok"){
                    alert("학생이 제출한 해당 과제를 삭제했습니다.");
                    location.href="/PLT/plt_homepage.do";
                }else if (response === "fail"){
                    alert("해당 과제 삭제가 실패했습니다.");
                    return;
                }
            },
            error:function(){
                alert("제출한 해당 과제를 삭제 중, 서버 오류가 발생했습니다.");
                return;
            }
        });
    }else{
        alert("삭제를 취소하였습니다.");
        return;
    }
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