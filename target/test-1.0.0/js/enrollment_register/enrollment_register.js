$(document).ready(function() {
    
    
        $("a[name='file-delete']").on("click", function(e) {
            e.preventDefault();
            deleteFile($(this));
        });    
        
        $('#course_add').click(course_add);
        $('#instruct_add').click(instruct_add);
        $('#instruct_delete').click(instruct_delete);
        $('#course_com_add').click(course_com_add);
        $('#nofication_send').click(nofication_send);
});

        
        
        
        function course_add(){
            var title = document.getElementById('title').value;
            var description = document.getElementById('description').value;
            var username = document.getElementById('username').value;
            console.log("코스 제목 : " + title + ", " + "코스 설명 : " + description + ", " + "사용자(강사) 아이디 : " + username);
            
            if(title === "") {
                alert("코스 제목을 알려주세요.");
                return;
            }else if(description === ""){
                alert("코스에 대하여 설명을 해주세요.");
                return;
            }
            
            const formdata = {title : title, description : description, username : username};
            
             $.ajax({
                type:"POST",
                url:"/PLT/course_add.do",
                data : formdata,
                dataType : "json",
                success:function(response){
                    if(response === "ok"){
                        alert("코스가 추가되었습니다.");
                        location.href="/PLT/enrollment_registerPage.do";
                    }else if(response === "fail"){
                        alert("코스 추가가 실패하였습니다.");
                        return;
                    }else{
                        alert("알 수 없는 오류 발생...");
                        return;
                    }
                },
                error:function(){
                    alert("서버오류가 발생했습니다. 서버를 확인해주세요.");
                }
            });
        }
        
        
        /*강의추가*/
        function instruct_add(){
            var username = document.getElementById('username').value; // getUser_id에서 가져올 user_id를 위한것
            var course_id = document.getElementById('modal_course_id').value; 
            var instructor_name = document.getElementById('instructor_name').value;
            var instruct_title = document.getElementById('instruct_title');
            var i_description = document.getElementById('i_description').value;
            var enroll_start_time = document.getElementById('enroll_start_time').value;
            var enroll_end_time = document.getElementById('enroll_end_time').value;
            
          
            
            /*유효성 검사*/
            if(username === "" || username === null){
                alert("로그아웃 상태입니다. 로그인을 해주세요.");
                location.href="/PLT/LoginJoin.do";
                return;
            }
            if(course_id=== "" || course_id === null){
                alert("코스가 생성되지 않았습니다.\n강의는 코스를 생성한 이후에 추가가 가능합니다.");
                return;
            }
                    
            if(instructor_name === "" || instruct_title === "" ||  i_description==="" || enroll_start_time === "" || enroll_end_time === ""){
                alert("모든 필드를 입력해주세요.");
                return;
            }
            
            if( instructor_name=== ""){
                alert("강사명을 입력해주세요.");
                return;
            }else if(instruct_title === ""){
                alert("강의 제목을 입력해주세요.");
                return;
            }else if(i_description === ""){
                alert("강의를 설명해주세요.");
                return;
            }
            else if(enroll_start_time === ""){
                alert("강의의 시작시간을 입력해주세요.");
                return;
            }
            else if(enroll_end_time === ""){
                alert("강의의 마무리시간을 입력해주세요.");
                return;
            } else  if(enroll_start_time === enroll_end_time){
                alert("강의 시작과 마무리시간이 같을 순 없습니다.");
                return;
            }else if(enroll_start_time > enroll_end_time){
                alert("강의 시작시간이 마무리시간보다 이전일 수 없습니다.");
                return;
            }
            
            const formdata = {username : username,
                    course_id : course_id,
                    instructor_name : instructor_name,
                    instruct_title : instruct_title.value,
                    i_description : i_description,
                    enroll_start_time : enroll_start_time,
                    enroll_end_time : enroll_end_time}
            console.log(formdata); // 확인용
            $.ajax({
                  url : "/PLT/instruct_add.do",
                  type:"POST",
                  data : formdata,
                  dataType:"json",
                  success:function(response){
                      if(response === "ok"){
                          alert("강의가 추가되었습니다.");
                          
                          // 강의 추가를 위한 course_id 전송
                          $.ajax({
                              url : "/PLT/enrollment_registerPage.do",
                              type:"POST",
                              data : {course_id : course_id},
                              error:function(){
                                  alert("서버 오류 발생... 서버를 확인하셈요.");
                              }
                        });
                          
                          location.href="/PLT/enrollment_registerPage.do";
                      }else if(response === "fail"){
                          alert("강의를 추가할 수 없습니다.");
                          return;
                      }
                  },
                  error:function(){
                      alert("서버 오류 발생... 서버를 확인하셈요.");
                  }
                
            });
        }
        
        
        
        function course_com_add(){
            var semester = document.getElementById('semester').value;
            var credit = document.getElementById('credit').value;
            var department = document.getElementById('department').value;
            var classification = document.getElementById('classification').value;
            var com_course_id = document.getElementById('com_course_id').value;
            
            
            if(department === ""){
                alert("학부(과)를 입력해주세요.");
                return;
            }else if(classification === "") {
                alert("전공을 입력해주세요.");
                return;
            }
            
            const formData = {
                    semester:semester,
                    credit:credit,
                    department:department,
                    classification:classification,
                    com_course_id:com_course_id
            }
            
            $.ajax({
                url:"/PLT/course_com_add.do",
                data : formData,
                dataType:"json",
                type:"POST",
                success:function(response){
                    if(response === "ok"){
                        alert("해당 코스에 대한 학사정보가 세팅되었습니다.");
                        location.href="/PLT/enrollment_registerPage.do";
                    }else if(response ==="fail"){
                        alert("학사정보가 추가되지 않았습니다,");
                        return;
                    }else{
                        alert("이건 무슨 오류냐...");
                        return;
                    }
                },
                erro:function(){
                    alert("서버 오류 발생!! 서버를 확인하세요!");
                }
            });
            
        }
        
        
        
        function course_info(course_id){
            document.getElementById('com_course_id').value = course_id;
            return;
        }
        
        //해당 코스를 신청한 학생에 대하여 알림을 보내기 위한 모달창
        function course_info2(course_id){
            $.ajax({
                url:"/PLT/getEnrollment_student.do",
                data : {course_id :course_id },
                dataType:"json",
                type:"POST",
                success:function(response){
                    if(response.status === "ok"){
                        alert("학생에게 알림을 보낼 모달창을 엽니다.");
                        document.getElementById('com_course_id_2').value = course_id;
                     // 학생 목록을 가져와서 select 요소에 추가
                        var select = document.getElementById('notifcation');
                        select.innerHTML = ''; // 기존 옵션 제거

                        if (response.data.length > 0) {
                            response.data.forEach(function(student) {
                                var option = document.createElement('option');
                                option.value = student.user_id; // 학생 ID를 value로 설정
                                option.textContent = student.username; // 학생 이름을 표시
                                select.appendChild(option);
                            });
                        } else {
                            var option = document.createElement('option');
                            option.value = '';
                            option.textContent = '해당 코스를 신청한 학생이 없습니다.';
                            select.appendChild(option);
                        }
                    } else if (response.status === "fail") {
                        alert("해당 코스를 신청한 학생목록을 가져올 수 없습니다.");
                    }
                },
                error: function() {
                    alert("서버 오류 발생!! 서버를 확인하세요.");
                }
            });
        }
        
        /*코스 삭제*/
        function course_delete(course_id){
            
            if(confirm("해당 코스를 삭제하시겠습니까?")) {
              $.ajax({
                  type:"POST",
                  data : {course_id : course_id},
                  dataType:"json",
                  url:"/PLT/course_delete.do",
                  success:function(response){
                      if(response === "ok"){
                          alert("해당 코스가 삭제되었습니다.");
                          location.href="/PLT/enrollment_registerPage.do";
                      }else{
                          alert("코스 삭제에 실패하였습니다.");
                      }
                  },
                  error:function(){
                      alert("서버 오류 발생!! 서버를 확인해주세요.");
                  }
              });
            }else{
                alert("코스 삭제를 취소하였습니다.");
              return;  
            }
        }
        
        /*강의 삭제*/
        function instruct_delete(course_id){
            
            if(confirm("해당 강의를 삭제하시겠습니까?")) {
              $.ajax({
                  type:"POST",
                  data : {course_id : course_id},
                  dataType:"json",
                  url:"/PLT/instruct_delete.do",
                  success:function(response){
                      var ok = response.trim();
                      if(ok === "ok"){
                          alert("해당 코스에 대한 강의전체가 삭제되었습니다.");
                          location.href="/PLT/enrollment_registerPage.do";
                      }else{
                          alert("강의 삭제에 실패하였습니다.");
                      }
                  },
                  error:function(){
                      alert("서버 오류 발생!! 서버를 확인해주세요.");
                  }
              });
            }else{
                alert("강의 삭제를 취소하였습니다.");
              return;  
            }
        }
        /*  ************************************************************************************************* */
        
        
        /*  ************************************************************************************************* */
        function openModal(courseId) {
        document.getElementById('modal_course_id').value = courseId; // 코스 ID를 모달에 저장
        $('#exampleModal2').modal('show'); // 모달 열기
        }
        
        /* 강의 자세히보기 */
        function openDetailModal(element) {
        // 데이터 가져오기
        const title = element.getAttribute("data-instruct_title");
        const instructor_name = element.getAttribute("data-instructor_name");
        const enroll_start_time = element.getAttribute("data-enroll_start_time");
        const enroll_end_time = element.getAttribute("data-enroll_end_time");
        const i_description = element.getAttribute("data-i_description");
        
        // 모달에 데이터 설정
        document.getElementById("modal-title").innerText = title;
        document.getElementById("modal-instructor_name").innerText = instructor_name;
        document.getElementById("modal-enroll_start_time").innerText = enroll_start_time;
        document.getElementById("modal-enroll_end_time").innerText = enroll_end_time;
        document.getElementById("modal-i_description-date").innerText = i_description;
        
        // 모달 열기
        const modal = new bootstrap.Modal(document.getElementById('detailModal'));
        modal.show();
        }
        /*  ************************************************************************************************* */
        
        
        
        
        /*  ************************************************************************************************* */
        const classificationSelectMap = {
            "인문대학": ["한국어문학과", "영어영문학과", "역사학과", "철학과", "문화인류학과"],
            "사회과학대학": ["정치외교학과", "경제학과", "사회학과", "심리학과", "행정학과"],
            "자연과학대학": ["물리학과", "화학과", "생물학과", "수학과", "지구과학과"],
            "공과대학": ["기계공학과", "전자공학과", "컴퓨터공학과", "화학공학과", "토목공학과"],
            "의과대학": ["의학과", "간호학과", "약학과", "치의학과", "보건학과"],
            "예술대학": ["미술학과", "음악학과", "공연예술학과", "디자인학과", "영화학과"]
        };
        
        function updateMajors() {
            const departmentSelect = document.getElementById('department');
            const classificationSelect = document.getElementById('classification');
            const selectedDepartment = departmentSelect.value;
        
            // 전공 목록 초기화
            classificationSelect.innerHTML = '';
        
            // 선택된 학부(과)에 해당하는 전공 목록 가져오기
            const classifications = classificationSelectMap[selectedDepartment] || [];
        
            // 전공 옵션 추가
            classifications.forEach(function(classification) {
                const option = document.createElement('option');
                option.value = classification;
                option.textContent = classification;
                classificationSelect.appendChild(option);
            });
        }
        /*  ************************************************************************************************* */
        
        
        /*  ************************************************************************************************* */
        function getCourseDetails(course_id) {
            console.log(course_id);
        
            $.ajax({
                data: { course_id: course_id },
                dataType: "json",
                type: "POST",
                url: "/PLT/course_id_info.do",
                success: function(response) {
                    console.log("서버 응답:", response);
                    if (response.status === "ok" && response.semester !== null || response.department !== null || response.classification !== null || response.credit !== null) {
                        // 아코디언의 바디에 추가할 HTML 생성
                        var courseInfoHtml =
                            '<ul>' +
                            '<li>' + response.description + '</li>' +
                            '<li><strong>학기</strong>: ' + response.semester + '</li>' +
                            '<li><strong>학점</strong>: ' + response.credit + '</li>' +
                            '<li><strong>학부(과)</strong>: ' + response.department + '</li>' +
                            '<li><strong>전공</strong>: ' + response.classification + '</li>' +
                        '</ul>';
                        
                        // 해당 아코디언의 바디에 데이터 추가
                        $('#collapse' + course_id + ' .accordion-body').html(courseInfoHtml);
                    } else {
                        alert("코스가 존재하지 않습니다.");
                    }
                },
                error: function() {
                    alert("서버 오류 발생!! 서버를 확인하세요!");
                }
            });
        }
        /*  ************************************************************************************************* */
        var file_Valid = false; // 파일 유효성 변수 선언

        /* 코스에 해당하는 강의자료 보여주기 */
        function getEnrollDetails(course_id) {
            console.log(course_id);
            $.ajax({
                url: "/PLT/enroll_show.do",
                data: { course_id: course_id },
                dataType: "json",
                type: "POST",
                success: function(response) {
                    if (response.status === "ok") {
                        console.log(response);
                        
                        // 해당 아코디언 바디 초기화
                        $('#collapse_enroll' + course_id + ' .accordion-body_enroll').empty();
                        
                        for (let i = 0; i < response.data.length; i++) {
                            var enrollmentHtml =
                                '<ul>' +
                                    '<h2>' + response.data[i].registration_num + '. 강의제목 :' + response.data[i].instruct_title + '</h2>' +
                                    '<li><strong>강사명 : </strong>' + response.data[i].instructor_name + '</li>' +
                                    '<li><strong>강의설명 : </strong>' + response.data[i].i_description + '</li>' +
                                    '<li><strong>시작시각 : </strong>' + response.data[i].enroll_start_time + '</li>' +
                                    '<li><strong>종료시각 : </strong>' + response.data[i].enroll_end_time + '</li>' +
                                    '<hr/>' +
                                '</ul>' +
                                '<form id="uploadForm' + response.data[i].registration_id + '">' +
                                    '<input type="hidden" name="file_course_id" value=' + course_id + '>' +
                                    '<input type="hidden" name="instruct_title" value=' + response.data[i].instruct_title + '>' +
                                    '<div class="form-group" id="file_list' + response.data[i].registration_id + '">' +
                                        '<a href="#this" onclick="addFile(' + course_id + ',' + response.data[i].registration_id + ')">파일추가</a>' +
                                        '<div class="file-group">' +
                                            '<input type="file" id="fileInput" name="files"><a href="#this" class="file-delete" name="file-delete">삭제</a>' +
                                        '</div>' +
                                    '</div>' +
                                '<button type="submit" class="btn btn-default">작성하기</button>' +
                                '</form>';

                            // 파일 목록 보여주는 모달창 버튼 생성
                            const button_file = document.createElement("button");
                            button_file.id = "show_file_id_" + response.data[i].registration_id;
                            button_file.onclick = function() {
                                show_files(course_id, response.data[i].registration_id);
                            }
                            const span_file = document.createElement("span");
                            span_file.className = "material-symbols-outlined";
                            span_file.textContent = "folder";

                            // 삭제 버튼 생성
                            const button = document.createElement("button");
                            button.id = "delete_registration_id_" + response.data[i].registration_id; // 고유 ID 설정
                            button.onclick = function() {
                                Element_enroll_delete(response.data[i].registration_id); // 클릭 시 호출할 함수에 ID 전달
                            };
                            const span = document.createElement("span");
                            span.className = "material-symbols-outlined";
                            span.textContent = "contract_delete"; // 아이콘 텍스트 설정

                            button.appendChild(span);
                            button_file.appendChild(span_file);

                            // 버튼을 해당 강의 정보 아래에 추가
                            $('#collapse_enroll' + course_id + ' .accordion-body_enroll').append(button);
                            $('#collapse_enroll' + course_id + ' .accordion-body_enroll').append(button_file);
                            $('#collapse_enroll' + course_id + ' .accordion-body_enroll').append(enrollmentHtml);
                            
                            // 파일 업로드 폼 제출 시
                            $('#uploadForm' + response.data[i].registration_id).on('submit', function(event) {
                                event.preventDefault(); // 기본 폼 제출 방지

                                var formData = new FormData(this);
                                console.log("폼데이터 :", formData); // FormData 객체 출력
                                
                                // ajax 요청으로 파일 업로드
                                $.ajax({
                                    url: '/PLT/enroll_material.do',
                                    type: 'POST',
                                    data: formData,
                                    dataType: "json",
                                    contentType: false,
                                    processData: false,
                                    success: function(response_1) {
                                        if (response_1.status === "ok") {
                                            console.log("파일 업로드 성공");
                                            alert("파일 업로드 성공");
                                            file_Valid = true;
                                        } else if (response_1.status === "fail") {
                                            alert("파일 업로드 실패");
                                            file_Valid = false;
                                        }
                                    },
                                    error: function() {
                                        alert("파일 업로드 중 오류 발생");
                                    }
                                });
                            });
                        }

                        // 강의 정보가 없을 경우 처리
                        if (response.data.length === 0) {
                            $('#collapse_enroll' + course_id + ' .accordion-body_enroll').append('<strong>강의 정보가 없습니다.</strong>');
                        }
                    } else if (response.status === "fail") {
                        alert("강의 정보가 존재하지 않습니다.");
                    }
                },
                error: function() {
                    alert("서버 오류 발생!!\n서버를 확인하세요");
                }
            });
        }


        
        
        function Element_enroll_delete(registration_id){
            console.log(registration_id);
            
               if(confirm("해당 강의를 삭제하시겠습니까??")){
                  $.ajax({
                    url:"/PLT/element_enroll_delete.do",
                    data : {registration_id : registration_id},
                    dataType:"json",
                    type:"POST",
                    success:function(response){
                        if(response === "ok"){
                          alert("해당 강의를 삭제하였습니다.");
                            location.href="/PLT/enrollment_registerPage.do";   
                        }else if(response === "fail"){
                            alert("해당 강의를 삭제할 수 없습니다.");
                            return;
                    }else{
                        alert("예외 발생...");
                        }
                    },
                    error:function(){
                        alert("서버 오류 발생! 서버를 확인하세요.");
                        return;
                    }
                 });
                }else{
                    alert("해당 강의 삭제를 취소하였습니다.");
                }
            }
            
           
        /* 다중 파일 업로드 하기 위한 함수 */
        function addFile(course_id, registration_id) {
            let file_G = document.getElementById('file_list' + registration_id);
            if (file_G.children.length > 5) {
                alert("파일 추가는 최대 5개까지만 가능합니다.");
                return;
            }

            // 파일 입력의 ID를 동적으로 생성
            var fileInputId = 'fileInput_' + registration_id + '_' + (file_G.children.length + 1);
            var addfile = '<div class="file-group">'
                            + '<input type="file" id="' + fileInputId + '" name="files" multiple="multiple"><a href="#this" class="file-delete" name="file-delete">삭제</a>'
                          + '</div>';
            $('#file_list' + registration_id).append(addfile);

            $("a.file-delete").on("click", function(e) {
                e.preventDefault();
                deleteFile($(this));
            });
        }

        function deleteFile(obj) {
            obj.parent().remove();
        }
        
        
        /*강사가 업로드한 파일 목록 보여쥬기*/
        function show_files(course_id, registration_id) {
            $.ajax({
                url: "/PLT/show_files.do",
                data: { course_id: course_id, registration_id: registration_id },
                dataType: "json",
                type: "POST",
                success: function(response) {
                    if (response.status === "ok") {
                        // 파일 목록을 가져와서 출력
                        let fileListHtml = '<h2>' + response.file_data_title + '의 파일목록</h2><ul>';
                        for (let i = 0; i < response.file_data.length; i++) {
                            fileListHtml += '<li><code>' + response.file_data[i].f_origin_name + '</code></li>';
                        }
                        fileListHtml += '</ul>'; // 리스트 마감

                        // 모달의 body에 파일 목록 추가
                        $('.modal-body_file').html(fileListHtml); // 모달의 body 내용 업데이트

                        // 모달 열기
                        $('#file_Modal').modal('show'); // Bootstrap 모달 열기
                    } else if (response.status === "fail") {
                        alert("파일 목록을 가져오는 데 실패하였습니다....");
                    } else if (response.status === "file_list_invalid") {
                        alert("파일 정보가 존재하지 않습니다.");
                    }
                },
                error: function() {
                    alert("파일 목록을 가져오는 데 오류가 발생하였습니다.....");
                }
            });
        }

        
        /*해당 코스를 수강한 학생에게 알림보내기*/
        function nofication_send(){
            var course_id = document.getElementById('com_course_id_2').value;
            var notifcation = document.getElementById('notifcation').value;
            var message = document.getElementById('notification_message').value; 
            console.log(course_id);
            console.log(notifcation);
            console.log(message);
            var formData = {course_id:course_id, notifcation:notifcation,message:message }
            
            if(notifcation === ""){
                alert("학생정보가 없습니다.");
                return;
            }else if(message === ""){
                alert("해당 학생에게 보낼 알람메시지를 입력해주세요.");
                return;
            }
            
            $.ajax({
               type:"POST",
               url:"/PLT/sendNotification.do",
               data:formData,
               dataType:"json",
               success:function(response){
                   console.log(response);
                   if(response.status === "ok"){
                       alert("학생에게 알림을 전송했습니다.");
                       location.href="/PLT/enrollment_registerPage.do";
                   }else if(response.status === "fail"){
                       alert("알림 전송이 실패했습니다.");
                       return;
                   }
               }, error:function(response){
                   console.log(response);
                   alert("서버 오류 발생!! 서버를 확인하세요...");
                   return;
               }
                
            });
            
        }
        
        
        