<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<!-- 세션 가져오기 -->
<%
	String username = "";
if (session.getAttribute("username") != null) {
	username = (String) session.getAttribute("username");
}else{
	PrintWriter script = response.getWriter();
	script.print("<script>");
	script.print("alert('강의등록은 로그인 이후 이용해주세요!');");
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
<title>코스 및 강의 등록 페이지</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 구글 폰트 - cabin -->
<link
	href="https://fonts.googleapis.com/css2?family=Cabin:ital,wght@0,400..700;1,400..700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght@100;200;300;400;500;600;700&display=swap" />
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link  href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
	<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght@100;200;300;400;500;600;700&display=swap" />
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

<link rel="stylesheet" href="../css/enrollment/enrollment_register.css">
	<!-- Bootstrap 5 JS (Popper 포함) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

		<!-- Bootstrap JS -->
<!-- jQuery 추가 (Ajax사용) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>




<style>

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 20
}

.accordion-body {
    padding: 1rem; /* 기본 패딩 조정 */
}

.accordion-item {
    max-width: 500px; /* 원하는 최대 너비 설정 */
    margin: 0 auto; /* 중앙 정렬 */
}

.accordion-button {
    width: 100%; /* 버튼을 전체 너비로 설정 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
}

.accordion-body_enroll{
 padding: 1rem; /* 기본 패딩 조정 */
}
</style>
</head>

<body>
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
					id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
					<div class="offcanvas-header">
						<span class="material-symbols-outlined">borg </span>
						<h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">[ <%=username %> ]님의 PLT </h5>
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
									<li><a class="dropdown-item" href="#">수강신청</a></li>
									<li>
										<hr style="border: 0.5px solid white;" />
									</li>
								</ul></li>

							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> ?????? </a>
								<ul class="dropdown-menu dropdown-menu-dark">
									<li><a class="dropdown-item" href="#">??????</a></li>
									<li><a class="dropdown-item" href="#">??????</a></li>
									<li>
										<hr style="border: 0.5px solid white;" />
									</li>
									<li><a class="dropdown-item" href="#">??????</a></li>
								</ul>
							</li>
							
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> ?????? </a>
								<ul class="dropdown-menu dropdown-menu-dark">
									<li><a class="dropdown-item" href="#">??????</a></li>
									<li><a class="dropdown-item" href="#">??????</a></li>
									<li>
										<hr style="border: 0.5px solid white;" />
									</li>
									<li><a class="dropdown-item" href="#">??????</a></li>
								</ul>
							</li>
							
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<!-- Page Wrapper -->
    <div id="wrapper">
<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3"><sup>*</sup>토이프로젝트 <sup>*</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <%=username %><span> 님의 커리큘럼</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Components</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="buttons.html">Buttons</a>
                        <a class="collapse-item" href="cards.html">Cards</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Utilities</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="/PLT/LoginJoin.do">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div>

        </ul>
        <!-- End of Sidebar -->


	<div class="container">
		<h1 class="title">공백 채우기</h1>
		<br />
		<h1 class="title">커리큘럼</h1>


		<!-- 코스 추가 -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" 
			data-bs-target="#exampleModal">
			<span class="material-symbols-outlined" id="course_span_1">
				golf_course </span>
		</button>
		<!-- !코스 추가 -->
		
			<!-- 코스 설명 -->
		<button type="button" class="btn btn-secondary"
		        data-bs-toggle="tooltip" data-bs-placement="top"
		        data-bs-custom-class="custom-tooltip"
		        data-bs-title="코스와 강의를 추가하고, 커리큘럼을 만들어보세요!">
		 ?
		</button>
		<!-- !코스 설명 -->


		<c:forEach var="course_list" items="${course_list }">
			<hr style="border: 1px solid red;" />
			<input type="hidden" id="course_id${course_list.course_id }" value="${course_list.course_id }">
			<div class="part">
				<div class="part-header">
					<span>${course_list.course_num }.</span> <span>${course_list.title }</span>
					
							<!-- 코스에 대한 학사정보 추가버튼-->
					<button type="button" class="btn btn-info" data-bs-toggle="modal"
						data-bs-target="#exampleModal3" onclick="course_info(${course_list.course_id })">
						<span class="material-symbols-outlined" id="course_span_1">
						menu_open
						</span>
					</button>
				<!-- 코스에 대한 학사정보 추가버튼-->
				<!-- 삭제하기 -->
					<button type="button" class="btn btn-danger" onclick="course_delete(${course_list.course_id })">
						<span class="material-symbols-outlined" id="course_span_1">
							delete </span>
					</button>
					<!-- 삭제하기 -->
					
					<!-- 해당 코스를 신청한 학생에게 알림보내기 위한 모달창을 여는 버튼 -->
					<button type="button" class="btn btn-success" data-bs-toggle="modal"
						data-bs-target="#exampleModal4" onclick="course_info2(${course_list.course_id })">
						<span class="material-symbols-outlined" id="course_span_1">
						menu_open
						</span>
					</button>
					<!-- !해당 코스를 신청한 학생에게 알림보내기 위한 모달창을 여는 버튼 -->
					
					<div class="accordion" id="accordionExample${course_list.course_id}">
					    <div class="accordion-item">
					        <h2 class="accordion-header">
					            <button class="accordion-button collapsed" type="button"
					                data-bs-toggle="collapse" data-bs-target="#collapse${course_list.course_id}" aria-controls="collapse${course_list.course_id}"
					                onclick="getCourseDetails(${course_list.course_id})">
					                코스 정보보기
					            </button>
					        </h2>
					        <div id="collapse${course_list.course_id}" class="accordion-collapse collapse"
					            data-bs-parent="#accordionExample${course_list.course_id}">
					            <div class="accordion-body">
					                <c:if test="${empty Course_Info}">
					              	  <strong>코스 정보가 없습니다.</strong>
					          		  </c:if>
					            </div>
					        </div>
					    </div>
					</div>
			</div>

			

				<div class="class">
					<hr />
					<span>강의</span>
					<div class="dropdown">
						<button>+</button>
						<div class="dropdown-content">
							<a type="button" onclick="openModal(${course_list.course_id})">새강의 만들기</a> 
							<a type="button" onclick="instruct_delete(${course_list.course_id})">전제 삭제하기</a>
						</div>
					</div>
					
					
					<div class="accordion" id="accordion_enroll${course_list.course_id}">
					    <div class="accordion-item">
					        <h2 class="accordion-header">
					            <button class="accordion-button collapsed" type="button"
					                data-bs-toggle="collapse"
					                data-bs-target="#collapse_enroll${course_list.course_id}"
					                aria-controls="collapse_enroll${course_list.course_id}"
					                onclick="getEnrollDetails(${course_list.course_id})">
					                강의 정보보기
					            </button>
					        </h2>
					    </div>
					
					    <div id="collapse_enroll${course_list.course_id}"
					        class="accordion-collapse collapse"
					        data-bs-parent="#accordion_enroll${course_list.course_id}">
					        
					        <div class="accordion-body_enroll" id="course_erList${course_list.course_id}">
					            <c:if test="${empty getEnroll_data}">
					                <strong>강의 정보가 없습니다.</strong>
					            </c:if>
					            <c:if test="${not empty getEnroll_data}">
					                <c:forEach items="${getEnroll_data}" var="enroll">
										
					                </c:forEach>
					            </c:if>
	
					        </div>
					    </div>
					</div>


				</div>
			</div>
		</c:forEach>
	</div>



	<!-- 코스 추가 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Header -->
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">코스 추가</h1>
					<button type="button" class="btn btn-close"data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<!-- /Header -->

				<!-- Body -->
				<div class="modal-body">
					<div class="bd-example">
						<ul>
							<li>코스는 텍스트, 과제와 같은 강의들의 묶음입니다.</li>
							<li>코스를 만들고 그에 적합한 강의를 추가할 수 있습니다.</li>
							<li>반드시 코스를 생성한 이후, 강의를 추가하세요.</li>
						</ul>
					</div>
					<hr>

					<input type="hidden" id="username" value="<%=username%>">

					<div class="row align-items-center mb-3">
						<div class="col-auto d-flex align-items-center">
							<span class="material-symbols-outlined me-2">list_alt</span> <input
								type="text" class="form-control" id="title" placeholder="코스 제목">
						</div>

					</div>
					<hr>
					<div class="mb-3 d-flex">
						<label for="message-text" class="col-form-label"> <span
							class="material-symbols-outlined me-2"> content_paste </span>
						</label>
						<textarea class="form-control" id="description"
							placeholder="코스에 대하여 설명해주세요."></textarea>
					</div>

				</div>
				<!-- /Body -->


				<!--  Footer -->
				<div class="modal-footer">
				<button type="button" class="btn btn-success" id="course_add">
				<span class="material-symbols-outlined">note_add</span>
				</button>
				</div>
				<!--  /Footer -->

			</div>

		</div>
	</div>
	<!-- /코스 추가 모달창 -->


<!-- 코스에 대한 학사정보 추가 모달창 -->
	<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Header -->
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel" >학사정보 세팅</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<!-- /Header -->

				<!-- Body -->
				<div class="modal-body">
					<div class="bd-example">
						<ul>
							<li>코스에 해당하는 아래의 정보를 입력해주세요.</li>
							<li>모든 입력 값은 필수로 입력해야합니다.</li>
							<li>1) 학기, 2) 학점, 3) 이수구분(전공/기타), 4) 학부(과)</li>
						</ul>
					</div>
					<hr>
					<div class="row align-items-center mb-3">
						<div class="col-auto d-flex align-items-center">
						
							<input type="hidden" id="com_course_id">
							
							<span class="material-symbols-outlined me-2">list_alt</span>학기
								 <select name="course_common" id="semester">
								 <c:forEach items="${getCourse_common_semester }" var="common_semester">
								 	<option value="${common_semester }">${common_semester}</option>
								 </c:forEach>
								</select>
								
							 <span class="material-symbols-outlined me-2">list_alt</span>학점
							<select name="course_common" id="credit">
								<c:forEach items="${getCourse_common_credit }"
									var="common_credit">
									<option value="${common_credit }">${common_credit }</option>
								</c:forEach>
							</select>
							
							 <span class="material-symbols-outlined me-2">list_alt</span>학부(과) 
							 <select name="course_common" id="department" onchange="updateMajors()">
							 <option value="">----선택----</option>
								<c:forEach items="${getCourse_common_department }" var="common_department">
									<option id="send_department" value="${common_department }">${common_department }</option>
								</c:forEach>
							</select> 
							
							<span class="material-symbols-outlined me-2">list_alt</span>전공
								<select  name="course_common" id="classification">
					<%-- 			<c:forEach items="${getCourse_common_classification }" var="common_classification">
									<option value="${common_classification }">${common_classification }</option>
								</c:forEach> --%>
							</select>
								
						</div>
				<!-- /Body -->

				<!--  Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="course_com_add">Set</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
				<!--  /Footer -->

			</div>

		</div>
	</div>
	</div></div>
	<!-- /코스에 대한 학사정보 추가 모달창 -->





	<!-- 강의 추가모달창 -->
	<div class="modal fade" id="exampleModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Header -->
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">강의 추가</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<!-- /Header -->

				<!-- Body -->
				<div class="modal-body">
					<input type="hidden" id="modal_course_id">
					<div class="row align-items-center mb-3">
						<div class="col-auto d-flex align-items-center">
							<span class="material-symbols-outlined me-2">list_alt</span> <input
								type="text" class="form-control" id="instructor_name"
								placeholder="강사명"> <span
								class="material-symbols-outlined me-2">list_alt</span> <input
								type="text" class="form-control" id="instruct_title"
								placeholder="강의 제목">
						</div>

					</div>
					<hr>
					<div class="mb-3 d-flex">
						<label for="message-text" class="col-form-label"> <span
							class="material-symbols-outlined me-2"> content_paste </span>
						</label>
						<textarea class="form-control" id="i_description"
							placeholder="강의 설명"></textarea>
					</div>

					<div class="row align-items-center mb-3">
						<div class="col-auto d-flex align-items-center">
							<span class="material-symbols-outlined"> hourglass_top </span> <input
								type="time" class="form-control" id="enroll_start_time">

							<span class="material-symbols-outlined"> hourglass_bottom
							</span> <input type="time" class="form-control" id="enroll_end_time">
						</div>
					</div>
				</div>
				<!-- /Body -->


				<!--  Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="instruct_add">Add</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
				<!--  /Footer -->

			</div>

		</div>
	</div>
</div>



<!-- 해당 강의에 업로드한 파일 목록 보여주기 모달창 -->
	<div class="modal fade" id="file_Modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Header -->
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">강의 자료 목록</h1>
				</div>
				<!-- /Header -->

				<!-- Body -->
				<div class="modal-body_file">
					<hr>
					<div class="mb-3 d-flex" >
					
					</div>

				
				</div>
				<!-- /Body -->


				<!--  Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="instruct_add">Add</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
				<!--  /Footer -->

			</div>

		</div>
	</div>


<!-- 해당 코스를 신청한 학생에 대하여 알림을 보내기 위한 모달창 -->
<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Header -->
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel" >학사정보 세팅</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<!-- /Header -->

				<!-- Body -->
				<div class="modal-body">
					<div class="bd-example">
						<ul>
							<li>코스에 해당하는 아래의 정보를 입력해주세요.</li>
							<li>모든 입력 값은 필수로 입력해야합니다.</li>
							<li>1) 학기, 2) 학점, 3) 이수구분(전공/기타), 4) 학부(과)</li>
						</ul>
					</div>
					<hr>
					<div class="row align-items-center mb-3">
						<div class="col-auto d-flex align-items-center">
						
							<input type="hidden" id="com_course_id_2">
							
							<span class="material-symbols-outlined me-2">list_alt</span>수강신청 학생목록
								<select name="notifcation" id="notifcation">
								    <option value="">학생 목록을 불러오는 중...</option>
								</select>
							 </div>
							 <hr />
							 <!-- 보낼 메시지 -->
							 <div class="mb-3 d-flex">
								<label for="message-text" class="col-form-label">
									<span class="material-symbols-outlined">
											notifications_active
									</span>
								</label>
								<textarea class="form-control" id="notification_message" placeholder="알람 메시지"></textarea>
							</div>
						</div>
				<!-- /Body -->

				<!--  Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="nofication_send">알림보내기</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
				<!--  /Footer -->

			</div>

	</div>
	</div>
	</div>
<!-- !해당 코스를 신청한 학생에 대하여 알림을 보내기 위한 모달창 -->


<!-- enrollment_register.js -->
<script src="../js/enrollment_register/enrollment_register.js"></script>
<script>

    // 툴팁 활성화
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>


</body>
</html>