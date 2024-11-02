<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<%
	String username = "";
if (session.getAttribute("username") != null) {
	username = (String) session.getAttribute("username");
} else {
	PrintWriter script = response.getWriter();
	script.print("<script>");
	script.print("alert('수강신청은 로그인 이후 이용해주세요!');");
	script.print("location.href='/PLT/LoginJoin.do'");
	script.print("</script>");
}

int role_id = 0; // 사용자 유형 구분 아이디
String role_name = ""; // 사용자 유형의 이름

if (session.getAttribute("role_id") != null) {
	role_id = Integer.parseInt(session.getAttribute("role_id").toString());
	if (role_id == 1) {
		role_name = "학생";
	} else if (role_id == 2) {
		role_name = "강사";
	}
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수강신청 페이지</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght@100;200;300;400;500;600;700&display=swap" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../css/enrollment/enrollment.css">
<!-- Bootstrap JS and dependencies -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 추가 (Ajax사용) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

p {
	margin-top: 10px;
}

.container_timeModal {
	width: 100%;
}

.modal {
	z-index: 1050; /* Bootstrap 기본값 */
}

.modal-btn-box {
	width: 100%;
	text-align: center;
}

.modal-btn-box button {
	display: inline-block;
	width: 150px;
	height: 50px;
	background-color: #ffffff;
	border: 1px solid #e1e1e1;
	cursor: pointer;
	padding-top: 8px;
}

.popup-wrap {
	background-color: rgba(0, 0, 0, .3);
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: none;
	padding: 15px;
}

.popup {
	width: 100%;
	max-width: 400px;
	background-color: #ffffff;
	border-radius: 10px;
	overflow: hidden;
	background-color: #264db5;
	box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, .3);
}

.popup-head {
	width: 100%;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.head-title {
	font-size: 38px;
	font-style: italic;
	font-weight: 700;
	letter-spacing: -3px;
	text-align: center;
}

.popup-body {
	width: 100%;
	background-color: #ffffff;
	z-index: 1080;
}

.body-content {
	width: 100%;
	padding: 30px;
}

.body-titlebox {
	text-align: center;
	width: 100%;
	height: 40px;
	margin-bottom: 10px;
}

.body-contentbox {
	word-break: break-word;
	max-height: 200px;
	z-index: 1060;
}

.popup-foot {
	width: 100%;
	height: 50px;
}

.pop-btn {
	display: inline-flex;
	width: 20%;
	height: 100%;
	float: left;
	justify-content: center;
	align-items: center;
	color: #ffffff;
	cursor: pointer;
}

.pop-btn.confirm {
	border-right: 1px solid #3b5fbf;
}

.input-group {
	position: relative;
	width: 225px;
}

.input-group .input-group-text {
	position: absolute;
	right: 10px; /* 아이콘을 오른쪽에 위치시키기 위한 여백 */
	top: 50%; /* 세로 가운데 정렬 */
	transform: translateY(-50%); /* 세로 가운데 정렬을 위한 변환 */
	border: none; /* 불필요한 테두리 제거 */
	background: transparent; /* 배경 투명 설정 */
	cursor: pointer; /* 커서 포인터로 변경 */
}
</style>


</head>
<body>
	<c:if test="${not empty errorMessage}">
		<input type="hidden" id="errorMessage" value="${errorMessage}">
		<script type="text/javascript">
	     window.onload = function() {
	         var errorMessage = document.getElementById('errorMessage').value;
		     	alert(errorMessage);
	        };
	     </script>
	</c:if>
	<header>
		<nav class="navbar navbar-dark bg-dark fixed-top">
			<div class="container-fluid">


				<a class="navbar-brand" href="/PLT/plt_homepage.do"> <span
					class="material-symbols-outlined"> borg </span> 토이프로젝트 : PLT
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar"
					aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1"
					id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel" style="width:25%;">
					<div class="offcanvas-header">
						<span class="material-symbols-outlined">borg </span>
						<h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">
							[
							<%=username%>
							]님의 PLT
						</h5>
						<button type="button" class="btn-close btn-close-white"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
						<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="/PLT/plt_homepage.do">Home</a></li>

							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> Useable </a>
								<ul class="dropdown-menu dropdown-menu-dark">
									<li><a class="dropdown-item" href="/PLT/todoPage.do">Todo</a></li>
									<li><a class="dropdown-item" href="/PLT/enroll_ListPage.do">신청코스</a></li>
									<li>
										<hr style="border: 1px solid black;" />
									</li>
									<li><a class="dropdown-item" href="#" onclick="logout()">Logout</a></li>
								</ul></li>

							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
								<ul class="dropdown-menu dropdown-menu-dark">
									<li><a class="dropdown-item" href="#">Action</a></li>
									<li><a class="dropdown-item" href="#">Another action</a></li>
									<li>
										<hr class="dropdown-divider">
									</li>
									<li><a class="dropdown-item" href="#">Something else
											here</a></li>
								</ul></li>
						</ul>

					</div>
				</div>
			</div>
		</nav>
	</header>


	<div class="container mt-5">
		<div class="bonmun" style="padding: 10px;">
			<!-- Student Information Section -->
			<div class="card mb-3">
				<div class="card-header" style="text-align: center;">
					<h5 class="m-0 font-weight-bold text-primary"
						style="text-align: center;">


						<svg xmlns="http://www.w3.org/2000/svg" height="35px"
							viewBox="0 -960 960 960" width="40px" fill="#EA3323">
							<path
								d="M80-160v-100q0-33.67 17-62.33Q114-351 146.67-366q65-30 126.33-45.33 61.33-15.34 127-15.34 29.33 0 60.5 3.34Q491.67-420 523.33-412l-56 56q-17-2-33.5-3T400-360q-62.33 0-112.83 12.67-50.5 12.66-112.5 41.33-14.34 7-21.17 20-6.83 13-6.83 26v33.33h296L509.33-160H80Zm544 16L484-284l46.67-46.67L624-237.33l209.33-209.34L880-400 624-144ZM400-481.33q-66 0-109.67-43.67-43.66-43.67-43.66-109.67t43.66-109.66Q334-788 400-788t109.67 43.67q43.66 43.66 43.66 109.66T509.67-525Q466-481.33 400-481.33Zm42.67 254.66ZM400-548q37 0 61.83-24.83 24.84-24.84 24.84-61.84t-24.84-61.83Q437-721.33 400-721.33t-61.83 24.83q-24.84 24.83-24.84 61.83t24.84 61.84Q363-548 400-548Zm0-86.67Z" /></svg>
						개설과목 조회/신청
					</h5>
				</div>

				<div class="card-body">

					<!--  수강신청 목록 페이지로 검색조건들의 데이터 전송 -->
					<form action="/PLT/enrollmentPage.do" method="post">
						<div class="row mb-3">

							<div class="col-md-3">
								<label for="semester" class="form-label">학기</label> <br /> <select
									name="semester" id="semester">
									<option value="">---선택---</option>
									<c:forEach items="${getCourse_common_semester }"
										var="common_semester">
										<option value="${common_semester }"
											<c:if test="${common_semester == param.semester }">selected</c:if>>
											${common_semester}</option>
									</c:forEach>
								</select>
							</div>

							<div class="col-md-3">
								<label for="credit" class="form-label">학점</label> <br /> <select
									name="credit" id="credit">
									<option value="">---선택---</option>
									<c:forEach items="${getCourse_common_credit }"
										var="common_credit">
										<option value="${common_credit }"
											<c:if test="${common_credit == param.credit }">selected</c:if>>${common_credit }</option>
									</c:forEach>
								</select>
							</div>


							<div class="col-md-3">
								<label for="department" class="form-label">학부(과)</label> <br />
								<select name="department" id="department"
									onchange="updateMajors()">
									<option value="">----선택----</option>
									<c:forEach items="${getCourse_common_department }"
										var="common_department">
										<option id="send_department" value="${common_department }"
											<c:if test="${common_department == param.department }">selected</c:if>>${common_department }</option>
									</c:forEach>
								</select>
							</div>

							<div class="col-md-3">
								<label for="classification" class="form-label">전공</label> <br />
								<select name="classification" id="classification">
									<!-- 학부(과)의 선택에 따른 전공 출력 -->
								</select>
							</div>

							<div class="col-md-3">
								<label for="title" class="form-label"
									style="padding: 20px 15px 10px;">강좌명</label>
								<div class="input-group" style="padding: 1px 8.5px 1px;">
									<input type="text" class="form-control" id="title" name="title" placeholder = "강좌명을 입력하세요."
										value="${title != '' || title != null ? title : title_placeholder}">
									<button type="button" class="btn btn-secondary"
										data-bs-toggle="tooltip" data-bs-placement="top"
										data-bs-custom-class="custom-tooltip"
										data-bs-title="강좌명은 정확하게 입력해야해요!">?</button>
								</div>
							</div>


							<div class="col-md-3" style="z-index: 0;">
								<label for="professor" class="form-label"
									style="padding: 20px 15px 10px;">교수명</label>
								<div class="input-group" style="padding: 1px 8.5px 1px;">
									<input type="text" class="form-control" id="professor" placeholder = "교수명을 입력하세요."
										name="professor" placeholder="${professor != '' || professor != null ? professor : professor_placeholder}">
									<button type="button" class="btn btn-secondary"
										data-bs-toggle="tooltip" data-bs-placement="top"
										data-bs-custom-class="custom-tooltip"
										data-bs-title="교수명은 정확하게 입력해야해요!">?</button>
								</div>
							</div>



							<div class="col-md-3">
								<label for="studentId" class="form-label"
									style="padding: 20px 15px 10px;">입력검색</label>
								<div class="input-group" style="padding: 1px 8.5px 1px;">
									<input class="form-control me-2" type="search" name="search"
										placeholder="강좌명 및 교수명" aria-label="Search"> <span
										class="input-group-text" id="search">
										<button type="submit"
											style="background-color: white; border: 1px;">
											<span class="material-symbols-outlined"> mystery </span>
										</button>
									</span>
								</div>
							</div>

							<div class="col-md-3">
								<br />
								<div class="d-grid gap-2 d-md-block" style="margin-top: 7px;">
									<button class="btn btn-primary" type="button"
										onclick="location.href='/PLT/redirect_enrollmentPage.do'"
										style="width: 45px; height: 38px; padding: 5px 2px; margin-top:30px;">
										<span class="material-symbols-outlined"> restart_alt </span>
									</button>
								</div>
							</div>

						</div>
					</form>

				</div>
			</div>
			<!-- Begin Page Content -->
			<div class="container-fluid">
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h5 class="m-0 font-weight-bold text-info"
							style="text-align: center;">

							<svg xmlns="http://www.w3.org/2000/svg" height="35px"
								viewBox="0 -960 960 960" width="40px" fill="#8C1AF6">
								<path
									d="M456.67-608.67v-122H334v-66.66h122.67v-122h66.66v122h122v66.66h-122v122h-66.66ZM286.53-80q-30.86 0-52.7-21.97Q212-123.95 212-154.81q0-30.86 21.98-52.69 21.97-21.83 52.83-21.83t52.69 21.97q21.83 21.98 21.83 52.84 0 30.85-21.97 52.69Q317.38-80 286.53-80Zm402.66 0q-30.86 0-52.69-21.97-21.83-21.98-21.83-52.84 0-30.86 21.97-52.69 21.98-21.83 52.84-21.83 30.85 0 52.69 21.97Q764-185.38 764-154.52q0 30.85-21.97 52.69Q720.05-80 689.19-80ZM54.67-813.33V-880h121l170 362.67H630.8l158.87-280h75L698-489.33q-11 19.33-28.87 30.66-17.88 11.34-39.13 11.34H328.67l-52 96H764v66.66H282.67q-40.11 0-61.06-33-20.94-33-2.28-67L280-496 133.33-813.33H54.67Z" /></svg>
							수강신청란
							 <span style="float: right; font-size: 16px; color: #000000;">신청학점 : ${getCredit }</span>
						</h5>
					</div>
					<div class="card-body">
						<div class="table-responsive">

							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th scope="col" style="text-align: center;">Num.</th>
										<th scope="col" style="text-align: center;">강좌명</th>
										<th scope="col" style="text-align: center;">학부(과)</th>
										<th scope="col" style="text-align: center;">학기</th>
										<th scope="col" style="text-align: center;">학점</th>
										<th scope="col" style="text-align: center;">전공</th>
										<th scope="col" style="text-align: center;">교수님</th>
										<th scope="col" style="text-align: center;">시간</th>
										<th scope="col" style="text-align: center;">신청</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty enroll_List}">
											<tr>
												<td colspan="9" style="text-align: center;">강의 정보가 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>

											<c:forEach items="${enroll_List}" var="enroll">
												<input type="hidden" id="title_data${enroll.course_id}"
													name="title_data" value="${enroll.title }">
												<input type="hidden" id="department_data${enroll.course_id}"
													name="department_data" value="${enroll.department }">
												<input type="hidden" id="semester_data${enroll.course_id}"
													name="semester_data" value="${enroll.semester }">
												<input type="hidden" id="credit_data${enroll.course_id}"
													name="credit_data" value="${enroll.credit }">
												<input type="hidden"
													id="classification_data${enroll.course_id}"
													name="classification_data"
													value="${enroll.classification }">
												<input type="hidden" id="professor_data${enroll.course_id}"
													name="professor_data" value="${enroll.professor }">
												<input type="hidden" id="course_id_data${enroll.course_id}"
													name="course_id_data" value="${enroll.course_id}">
												<input type="hidden" id="username_data${enroll.course_id}"
													name="username_data" value="<%=username%>">
												<input type="hidden" id="course_id_data${enroll.course_id}"
													name="course_id_data" value="${enroll.course_id}">
												<input type="hidden" id="username_data${enroll.course_id}"
													name="username_data" value="<%=username%>">
													<input type="hidden" id="instructor_id_data${enroll.course_id}"
													name="instructor_id_data" value="${enroll.instructor_id}">
											<input type="hidden" id="registration_id_data${enroll.course_id}"
													name="registration_id_data" value="${enroll.registration_id}">
													
												<tr>
													<td style="text-align: center;">${enroll.course_num}</td>
													<td id="title" data-title="${enroll.title}"
														style="text-align: center;">${enroll.title}</td>
													<td id="department_${enroll.course_id}" data-department=""
														style="text-align: center;">${enroll.department != null ? enroll.department : 'X'}
													</td>
													<td id="semester_${enroll.course_id}" data-semester=""
														style="text-align: center;">${enroll.semester != null ? enroll.semester : 'X'}
													</td>
													<td id="credit_${enroll.course_id}" data-credit=""
														style="text-align: center;">${enroll.credit != null ? enroll.credit : 'X'}
													</td>
													<td id="classification_${enroll.course_id}"
														data-classification="" style="text-align: center;">
														${enroll.classification != null ? enroll.classification : 'X'}
													</td>
													<td id="professor" data-professor="${enroll.professor}"
														style="text-align: center;">${enroll.professor}</td>
													<td style="text-align: center;"><a
														id="modal-open${enroll.course_id}"
														onclick="time_modal_open(${enroll.course_id})"> <span
															class="material-symbols-outlined">time_auto</span>
													</a></td>
													<td>
													<c:choose>
															<c:when test="${enroll.status != '수강' }">
																	<button type="button" class="btn btn-info" id="insert_enrollData${enroll.course_id }"
																	onclick="insert_enrollData(${enroll.course_id})"
																	style="font-size: 12px; padding: 5px 10px;">수강신청</button>
															</c:when>

															<c:otherwise>
															<button type="button" class="btn btn-info" id="insert_enrollData${enroll.course_id }" style="font-size: 12px; padding: 5px 10px;" disabled>수강신청</button>
																	<button type="button" class="btn btn-danger" onclick="cancle_enrollStatus(${enroll.course_id },'<%=username%>')" style="font-size: 12px; padding: 5px 10px;">취소</button>
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<div class="row" style="display: flex; justify-content: center;">
								<div class="col-sm-12 col-md-6">
									<div class="dataTables_paginate paging_simple_numbers"
										id="dataTable_paginate">
										<ul class="pagination">

											<!-- 이전 버튼 -->
											<c:if test="${viewPage > 1}">
												<li class="paginate_button page-item previous"
													id="dataTable_previous"><a
													href="/PLT/enrollmentPage.do?viewPage=${viewPage - 1}&semester=${param.semester}&credit=${param.credit }&classification=${param.classification}&department=${param.department }&title=${param.title}&professor=${param.professor }&search=${param.search}"
													aria-controls="dataTable" data-dt-idx="0" tabindex="0"
													class="page-link">이전</a></li>
											</c:if>

											<!-- 페이지 버튼 -->
											<c:forEach var="i" begin="1" end="${totalPage}">
												<li class="paginate_button page-item"><a
													href="/PLT/enrollmentPage.do?viewPage=${i}&semester=${param.semester}&credit=${param.credit }&classification=${param.classification}&department=${param.department }&title=${param.title}&professor=${param.professor }&search=${param.search}"
													aria-controls="dataTable" data-dt-idx="1" tabindex="0"
													class="page-link">${i}</a></li>
											</c:forEach>
											<!-- !페이지 버튼 -->

											<!-- 다음 버튼 -->
											<c:if test="${viewPage < totalPage}">
												<li class="paginate_button page-item next"
													id="dataTable_next"><a
													href="/PLT/enrollmentPage.do?viewPage=${viewPage + 1}&semester=${param.semester}&credit=${param.credit }&classification=${param.classification}&department=${param.department }&title=${param.title}&professor=${param.professor }&search=${param.search}"
													aria-controls="dataTable" data-dt-idx="7" tabindex="0"
													class="page-link">다음</a></li>
											</c:if>
											<!-- !다음 버튼 -->
										</ul>

									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>
			<!-- /.container-fluid -->
			<!-- Course Registration Section -->

		</div>
	</div>


	<!--  상세 시간표 보기 모달창 -->
	<div class="container_timeModal">
		<div class="popup-wrap" id="popup">
			<div class="popup" id="time_popup_enroll">
				<div class="popup-head">
					<span class="head-title"> 해당 강의 시간표</span>
				</div>
				<div class="popup-body">
					<div class="body-content">
						<div class="body-titlebox">
							<span id="null_time_display"></span> <span
								id="start_time_display"></span> <span id="end_time_display"></span>
						</div>
						<div class="body-contentbox" style="z-index: 1080;">
							<!-- 모달창 내용 -->

							<input type="hidden" id="enroll_course_id"
								name="enroll_course_id">
							<div class="row align-items-center mb-3">
								<div class="col-auto d-flex align-items-center">
									<span class="material-symbols-outlined"> hourglass_top </span>
									<input type="time" class="form-control" id="enroll_start_time"
										name="enroll_start_time"> <span
										class="material-symbols-outlined"> hourglass_bottom</span> <input
										type="time" min="09:00" max="18:00" required
										class="form-control" id="enroll_end_time"
										name="enroll_end_time">
									<button type="button"
										style="background-color: white; border: 1px; left: 5px"
										onclick="time_title_professor()">
										<span class="material-symbols-outlined"> mystery </span>
									</button>
								</div>
							</div>


						</div>
						<table class="table table-bordered" id="dataTable_time">
							<thead>
								<tr>
									<th scope="col" style="text-align: center;">강좌명</th>
									<th scope="col" style="text-align: center;">교수님</th>
								</tr>
							</thead>
							<tbody>


							</tbody>

						</table>
					</div>
				</div>
				<div class="popup-foot"
					style="display: flex; justify-content: center;">
					<span class="pop-btn close" id="close">창 닫기</span>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
$(function(){
    $("#confirm").click(function(){
        modalClose();
        //컨펌 이벤트 처리
    });
    function modalClose(){
        $("#popup").fadeOut();
      }
    
      
    
    $("#close").click(function(){
        modalClose();
    });
   
});

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

// 수강신청 시, 해당 강의의 시간과 관련된 모달창 오픈
function time_modal_open(enroll_course_id){
    console.log(enroll_course_id);
    $.ajax({
        url:"/PLT/enroll_time.do",
        type:"POST",
        data : {course_id : enroll_course_id},
        dataType:"json",
        success: function(response) {
            document.getElementById('enroll_course_id').value = enroll_course_id;
            
            // null_time_display 요소를 초기화 (비워두기)
            var nullTimeDisplay = document.getElementById('null_time_display');
            
            if (response.status === "ok") {
                // 시간 정보가 있을 경우
                document.getElementById('start_time_display').innerText = response.start_time +'~';
                document.getElementById('end_time_display').innerText = response.end_time;

                // '해당 강의 시간 정보가 없습니다.' 메시지를 지운다
                nullTimeDisplay.innerText = ''; // 비워두기
            } else if (response.status === "fail") {
                // 시간 정보가 없을 경우
                document.getElementById('start_time_display').innerText = ''; // 비워두기
                document.getElementById('end_time_display').innerText = ''; // 비워두기
                
                // null_time_display에 메시지를 설정
                nullTimeDisplay.innerText = '해당 강의에 대한 시간 정보가 없습니다.';
            }

            // 모달을 표시
            $("#popup").css('display', 'flex').hide().fadeIn();
        },
        error:function(){
            alert("서버 오류 발생!! 서버를 확인하세요.");
        }
    });
    
  
}



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
  
    
   function time_title_professor(){
      var enroll_course_id = document.getElementById('enroll_course_id').value;
      var enroll_start_time = document.getElementById('enroll_start_time').value;
      var enroll_end_time = document.getElementById('enroll_end_time').value;
      
      if(enroll_start_time === ""){
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
      
      
      
      formdata = {course_id:enroll_course_id,
              enroll_start_time : enroll_start_time,
              enroll_end_time : enroll_end_time};
      
      $.ajax({
          data : formdata,
          type:"POST",
          dataType:"json",
          url:"/PLT/time_title_professor.do",
          success: function(response) {
              const tbody = $('#dataTable_time tbody'); // tbody 선택
              tbody.empty(); // 기존 내용 비우기

              if (response && response.length > 0) {
                  response.forEach(function(item) {
                      // 새로운 행 생성
                      const title = escapeHtml(item.title);
                      const professor = escapeHtml(item.professor);
                      tbody.append(
                          '<tr>' +
                              '<td class="title" data-title="' + title + '" style="text-align:center;">' + title + '</td>' +
                              '<td class="professor" data-professor="' + professor + '" style="text-align:center;">' + professor + '</td>' +
                          '</tr>'
                      ); // tbody에 새 행 추가
                  });
              } else {
                  // 데이터가 없을 경우 메시지 표시
                  tbody.append(
                      '<tr>' +
                          '<td colspan="2" style="text-align:center;">조건에 해당되는 정보가 없습니다.</td>' +
                      '</tr>'
                  ); // tbody에 메시지 추가
              }
          },
          error: function(xhr, status, error) {
              console.error("AJAX 요청 실패:", status, error);
          }
      });

      // HTML escaping 함수
      function escapeHtml(text) {
          const div = document.createElement('div');
          div.appendChild(document.createTextNode(text));
          return div.innerHTML;
      }
   }

   /*  ************************************************************************************************* */
   /*  ************************************************************************************************* */
   // 수강신청 시, 데이터 저장
   function insert_enrollData(course_id){
       
	var title = document.getElementById('title_data' + course_id).value;
    var department = document.getElementById('department_data' + course_id).value;   
    var semester = document.getElementById('semester_data' + course_id).value;   
    var credit = document.getElementById('credit_data' + course_id).value;   
    var classification = document.getElementById('classification_data' + course_id).value;   
    var professor = document.getElementById('professor_data' + course_id).value;   
    var username = document.getElementById('username_data' + course_id).value;   
    var instructor_id = document.getElementById('instructor_id_data' + course_id).value;   
    
    
    console.log(title);
    console.log(department);
    console.log(semester);
    console.log(credit);
    console.log(classification);
    console.log(professor);
    console.log(username);
    console.log(course_id);
    console.log(instructor_id);
    
    const formData = 
    				{title : title, department:department,
            semester : semester, credit:credit,
            classification : classification, professor: professor,
            username : username, course_id :course_id, instructor_id:instructor_id};
    
    if(semester ==="X" || department ==="X" || credit ==="X" || classification ==="X"){
        alert("등록되지 않은 정보들이 있어 수강신청을 할 수 없습니다.");
        return;
    }else{
        if(confirm("해당 코스를 수강하시겠습니까??")){
            $.ajax({
                url:"/PLT/selected_register.do",
                data : formData,
                dataType:"json",
                type:"POST",
                success:function(response){
                        if (response.status === "ok") {
                            alert("해당 코스에 대한 수강신청이 완료되었습니다.");
                            location.href="/PLT/redirect_enrollmentPage.do";
                       }else if(response.status === "fail"){
                           alert("수강신청을 진행할 수 없습니다.");
                           return;
                       }else if(response.status === "invalid"){
                           alert("[서버]등록되지 않은 정보들이 있어 수강신청을 할 수 없습니다.");
                           return;
                       }else if(response.status === "time_invalid"){
                           alert("해당 강의에 대한 시간정보가 존재하지 않습니다.");
                           return;
                       }else if(response.status === "total_update_NOresult"){
                           alert("신청학점을 적용할 수 없습니다.");
                           return;
                       }else if(response.status === "21down"){
                           alert("신청학점은 21학점을 넘길 수 없습니다.");
                           return;
                       }    
                    },
                error:function(){
                    alert("서버 오류 발생!! 서버를 확인하세요.");
                    return;
                }
            });     
        }else{
            alert("코스 신청을 취소하였습니다.");
            return;
        }
       
    }
   }
   /*  ************************************************************************************************* */
   /*  ************************************************************************************************* */

   /* 수강신청 취소 */
   function cancle_enrollStatus(course_id, username){
       var credit = document.getElementById('credit_data' + course_id).value;   
       if(confirm("신청한 해당 코스를 취소하시겠습니까??")){
           $.ajax({
               url: "/PLT/cancle_enrollStatus.do",
               data : { course_id : course_id, username : username, credit:credit},
               type:"POST",
               dataType:"json",
               success:function(response){
                   if(response === "ok"){
                       alert("해당 과목의 수강신청을 취소하였습니다.");
                       location.href="/PLT/redirect_enrollmentPage.do";
                   }else if(response === "fail"){
                       alert("수강신청 취소가 실패했습니다...");
                       return;
                   }
               },
               error:function(){
                   alert("[서버] 오류 발생!! 서버를 확인하세요..");
                   return;
               }
            });
       }else{
           alert("수강신청을 취소하지 않았습니다.");
           return;
       }
       
   }
   
   
   
   // 툴팁 활성화
   var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
   var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
       return new bootstrap.Tooltip(tooltipTriggerEl);
   });
</script>

	<script src="../js/enrollment/enrollment.js"></script>
</body>
</html>