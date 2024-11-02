<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 세션 가져오기 -->
<%
	String username = "";
	if (session.getAttribute("username") != null) {
		username = (String) session.getAttribute("username");
	}else{
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('Todo는 로그인 이후 이용해주세요!');");
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 구글 폰트 - cabin -->
<link
	href="https://fonts.googleapis.com/css2?family=Cabin:ital,wght@0,400..700;1,400..700&display=swap"
	rel="stylesheet">
	
	<!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link  href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
	<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght@100;200;300;400;500;600;700&display=swap" />
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

<!-- Bootstrap CSS 추가 -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght@100;200;300;400;500;600;700&display=swap" />


    <!-- Font Awesome 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

   
	

	
	<link rel="stylesheet" href="../css/enrollment/enrollment_register.css">
    <!-- Todo CSS 추가 -->
    <link rel="stylesheet" href="../css/todo/todo.css">
    
    <!-- jQuery 3.6.0 CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- jQuery UI 라이브러리 -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    
    <!-- Bootstrap JS (Popper.js 포함) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
    
<!-- 홈페이지 JS추가 -->
	<script src="../js/homepage.js"></script>
 <!-- todo JS -->
    <script type="text/javascript" src="../js/todo/todo_datepicker.js"></script>
    <title>To-do List 페이지</title>
    
<style>
        .material-symbols-outlined {
            font-variation-settings:
            'FILL' 0,
            'wght' 400,
            'GRAD' 0,
            'opsz' 24;
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
		<!-- ToDo-리스트 추가 -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#exampleModal">
			<i class="fas fa-pencil-alt"></i>
		</button><span>(1 - 개인 / 2 - 학습 / 3 - 과제)</span>


		<!-- Todo 표시 -->
<div id="todo_container" class="d-flex flex-wrap">
    <c:forEach var="todo_list" items="${todo_list}" varStatus="status">
        <input type="hidden" class="todo_id" value="${todo_list.todo_id}">

        <c:if test="${status.index < 10}">
            <!-- 최대 10개까지만 출력 -->
            <div class="card border-info mb-3 todo-card " style="max-width: 30rem; position: relative; top: 20px;">
            
                <!-- 완료 여부 추가 -->
                <div class="form-check" style="position: absolute; top: -15%; left: 5px;">
				    <input class="form-check-input" type="checkbox" id="completedCheckbox_${todo_list.todo_id}">
				    <label class="form-check-label" for="completedCheckbox_${todo_list.todo_id}">
				        ${todo_list.completed}
				    </label>
				</div>

                <div class="card-header">${todo_list.title}</div>
                <input type="hidden" class="todo_id" value="${todo_list.todo_id}">

                <div class="card-body">
                    <h5 class="card-title">카테고리 : ${todo_list.todo_categories_id}</h5>
                    <hr />
                    <p class="card-text">우선순위 : ${todo_list.priority}</p>
                </div>

                <div class="card-footer bg-transparent border-success">
                  마감일 : ${todo_list.due_date} 
                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                    
                    <!--  상세보기 -->
                     <button type="button" class="btn btn-lg btn-primary small-button"
				            data-todo-id="${todo_list.todo_id}"
				            data-title="${todo_list.title}"
				            data-category="${todo_list.todo_categories_id}"
				            data-description="${todo_list.description}"
				            data-priority="${todo_list.priority}"
				            data-completed="${todo_list.completed}"
				            data-due_date="${todo_list.due_date}"
				            onclick="openDetailModal(this)" style="left:13px;">
				        <i class="fas fa-bars"></i>
				    </button>
                    <!--  상세보기 -->
                    
                    <!-- 수정하기 -->
                        <button type="button" class="btn btn-lg btn-success small-button"
                                data-bs-toggle="modal" data-bs-target="#exampleModal_2"
                                data-todo-id="${todo_list.todo_id}"
                                data-title="${todo_list.title}"
                                data-category="${todo_list.todo_categories_id}"
                                data-description="${todo_list.description}"
                                data-priority="${todo_list.priority}"
                                data-completed="${todo_list.completed}"
                                data-due_date="${todo_list.due_date}"
                                onclick="openEditModal(this)" style="left:13px;">
                            <i class="fas fa-edit"></i>
                        </button>
						<!-- 수정하기 -->
						
						<!-- 삭제하기 -->
                        <button type="button" class="btn btn-danger small-button" 
                                data-todo-id="${todo_list.todo_id}"
                                onclick="delete_todo(this)"style="left:13px;">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                        <!-- 삭제하기 -->
  
                    </div>
                </div>
            </div>
        </c:if>

    </c:forEach>
</div>
</section>




	<!-- todo 추가 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Header -->
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Add Todo</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<!-- /Header -->

				<!-- Body -->
				<div class="modal-body">
					<!-- 달력추가 -->
					<div id="wrap">
						<div class="container">
							<div class="container__wrap">
								<h1 class="container__tit">DeadLine</h1>
								<div class="input__wrap">
									<input type="text" class="input__item" id="todo_date"
										placeholder="click me :)" readonly>
								</div>
							</div>
						</div>
					</div>
					<!-- /달력추가 -->

					<form class="row gy-2 gx-3 align-items-center">
					
						<div class="row align-items-center mb-3"> <!-- row 추가 -->
						    <div class="col-auto d-flex align-items-center"> <!-- flexbox로 정렬 -->
						        <span class="material-symbols-outlined me-2">list_alt</span> <!-- 아이콘과 입력 필드 사이에 여백 추가 -->
						        <input type="text" class="form-control" id="title" placeholder="할일 제목">
						    </div>
						
						    <div class="col-auto d-flex align-items-center"> <!-- flexbox로 정렬 -->
						        <label class="recipient-name me-2" for="category">
						            <span class="material-symbols-outlined">category_search</span>
						        </label>
						        <select class="form-select" id="category">
						            <option value="" selected>Select...</option>
						            <option value="1">개인</option>
						            <option value="2">학습</option>
						            <option value="3">과제</option>
						        </select>
						    </div>
						</div>
						<!-- /todo_categories_name 선택 -->

						<!-- 할일 상세설명 -->
						<div class="mb-3 d-flex"> <!-- flexbox로 정렬 -->
							<label for="message-text" class="col-form-label">
								<span class="material-symbols-outlined me-2"> <!-- 아이콘과 내용 사이 여백추가 -->
									content_paste
								</span>
							</label>
							<textarea class="form-control" id="todo_details"></textarea>
						</div>
						<!-- /할일 상세설명 -->

						<!-- 할일 우선순위 -->
						<fieldset class="row mb-3 ">
							
							<div class="col-sm-10 d-flex">
								<span class="material-symbols-outlined me-3">
										low_priority
									</span>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="priority"
										id="priority-low" value="낮음" checked> <label
										class="form-check-label" for="priority-low"> Low </label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="priority"
										id="priority-middle" value="중간"> <label
										class="form-check-label" for="priority-middle"> Middle
									</label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="priority"
										id="priority-high" value="높음"> <label
										class="form-check-label" for="priority-high"> High </label>
								</div>

							</div>
						</fieldset>
						<!-- /할일 우선순위 -->
					</form>
				</div>

				<!-- /Body -->


				<!--  Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="send_todo_data()">Add</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
				<!--  /Footer -->

			</div>
		</div>
	</div>
	<!-- /ToDo-리스트 추가 -->
	
	
	
	
	<!-- ToDo 수정 모달창 -->
	<div class="modal fade" id="exampleModal_2" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Header -->
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Update</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<!-- /Header -->

				<!-- Body -->
				<div class="modal-body">
					<!-- 달력추가 -->
					<div id="wrap">
						<div class="container">
							<div class="container__wrap">
								<h1 class="container__tit">DeadLine</h1>
								<div class="input__wrap">
									<input type="text" class="input__item" id="update_todo_date"
										placeholder="click me :)" readonly>
								</div>
							</div>
						</div>
					</div>
					<!-- /달력추가 -->

					<form class="row gy-2 gx-3 align-items-center">
					 <input type="hidden" id="Todo_Id">
						<div class="col-auto">
							<span class="material-symbols-outlined">list_alt
							</span>
							<input type="text" class="form-control" id="update_title"
								placeholder="할일 제목">
						</div>

						<!-- todo_categories_name 선택 -->
						<div class="col-auto">
							<label class="recipient-name" for="autoSizingSelect">Category</label>
							<select class="form-select" id="update_category">
								<option value="" selected>Select...</option>
								<option value="1">개인</option>
								<option value="2">학습</option>
								<option value="3">과제</option>
							</select>
						</div>
						<!-- /todo_categories_name 선택 -->

						<!-- 할일 상세설명 -->
						<div class="mb-3">
							<label for="message-text" class="col-form-label">Details</label>
							<textarea class="form-control" id="Description"></textarea>
						</div>
						<!-- /할일 상세설명 -->

						<!-- 할일 우선순위 -->
						<fieldset class="row mb-3">
							<legend class="col-form-label col-sm-2 pt-0">Priority</legend>
							<div class="col-sm-10">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="update_priority" id="priority-low" value="낮음"> 
									<label class="form-check-label" for="priority-low"> Low </label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="update_priority" 	id="priority-middle" value="중간">
									 <label	class="form-check-label" for="priority-middle"> Middle
									</label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="update_priority" id="priority-high" value="높음"> 
									<label 	class="form-check-label" for="priority-high"> High </label>
								</div>

							</div>
						</fieldset>
						<!-- /할일 우선순위 -->
					</form>
				</div>

				<!-- /Body -->


				<!--  Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="todo_update();">수정</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
				<!--  /Footer -->

			</div>
		</div>
	</div>
	<!-- /ToDo-리스트 수정 -->






<!-- 해당 todo 상세보기 모달창 -->
<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="detailModalLabel">할일 상세정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h5 id="modal-title"></h5>
                <p><strong>카테고리:</strong> <span id="modal-category"></span></p>
                <p><strong>우선순위:</strong> <span id="modal-priority"></span></p>
                <p><strong>상세 설명:</strong> <span id="modal-description"></span></p>
                <p><strong>마감일:</strong> <span id="modal-due-date"></span></p>
                <p><strong>상태:</strong> <span id="modal-completed"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- !해당 todo 상세보기 모달창 -->
</div>

<script>
/*********************************************/
/*********todo 데이터 전송 메소드*********/
function send_todo_data(){
    var due_date = document.getElementById('todo_date').value;
    var title = document.getElementById('title').value;
    var description = document.getElementById('todo_details').value;
    var todo_categories_name = document.getElementById('category').value;
    const selector = "input[type=radio][name=priority]:checked";
    const selectedRadio = document.querySelector(selector);
    if (selectedRadio) {
        console.log('Selected priority:', selectedRadio.value);
    } else {
        console.log('No priority selected');
    }
    
 // 현재 할 일의 개수
    var todoItems = document.querySelectorAll('#todo_container .todo-card');
    
    // 할 일의 개수를 확인
    if (todoItems.length >= 10) {
        alert("할 일은 최대 10개까지만 추가할 수 있습니다.");
        return; 
    }
    
    
    if(due_date===""){
        alert("일자를 선택해주세요.");
        return;
    }else if(title === ""){
        alert("제목을 입력해주세요.");
        return;
    }else if(todo_categories_name === ""){
        alert("카테고리를 선택해주세요.");
        return;
    }
    // 상세설명(details)은 굳이 안적어도 될 것 같아. 
    
    const form_data = { due_date : due_date,
                                title : title, 
                                description : description, 
                                todo_categories_name : todo_categories_name ,
                                priority : selectedRadio.value};
    
    $.ajax({
       type:"POST",
       data : form_data,
       dataType : "json",
       url : "/PLT/send_todo_data.do",
       success:function(response){
           if(response.status === "invalid_todo_categories_name"){
               alert("카테고리를 선택해달라거");
               return;
           }else if(response.status === "invalid_todo_data"){
               alert("데이터를 가져올 수 없습니다.\n서버를 확인하세요");
               return;
           }else{
               alert("할일이 추가되었습니다.");
               location.href="/PLT/plt_redirect.do";
           }
       },
       error:function(){
           alert("데이터 연결 실패");
           return;
       }
    });
    
    
}
/*********todo 데이터 전송 메소드*********/
/********************************************/



/********************************************/
 /*********Todo 수정 관련 메소드 *********/
function openEditModal(button) {
    // 버튼의 data-* 속성에서 값 가져오기
    var todoId = button.getAttribute('data-todo-id');
    var title = button.getAttribute('data-title');
    var description = button.getAttribute('data-description');
    var priority = button.getAttribute('data-priority').trim(); // 굳이 객체로 만들 필요 없음
    var category = button.getAttribute('data-category');
    var completed = button.getAttribute('data-completed');
    var due_date = button.getAttribute('data-due_date');
    
    // 콘솔에서 값 확인
    console.log(todoId);
    console.log(title);
    console.log(description);
    console.log(priority);
    console.log(category);
    console.log(completed);
    console.log(due_date);
    
    // 모달의 입력 필드에 값 설정
    document.getElementById('Todo_Id').value = todoId;
    document.getElementById('update_title').value = title;
    document.getElementById('Description').value = description;
    document.getElementById('update_category').value = category;
    document.getElementById('update_todo_date').value = due_date;
    
    // 우선순위에 맞는 라디오 버튼 선택
    if (priority) { // priority가 비어있지 않으면
        console.log("Priority data before check:" + priority); // 백틱 사용
        const selector = document.querySelector("input[name=update_priority][value="+priority+"]"); 
        if (selector) {
            selector.checked = true; // 라디오 버튼이 존재할 경우 체크
        } else {
            console.warn("No radio button found for priority:"+priority);
        }
    } else {
        console.warn('Priority data is empty or undefined');
    }
}



//todo 수정 메소드 
function todo_update(){
    
  var todo_id =  document.getElementById('Todo_Id').value;
  var due_date = document.getElementById('update_todo_date').value;
    var title = document.getElementById('update_title').value;
    var category = document.getElementById('update_category').value;
    var description = document.getElementById('Description').value;
    const priority = document.querySelector("input[type=radio][name=update_priority]:checked");
  
    
    if(due_date===""){
        alert("일자를 선택해주세요.");
        return;
    }else if(title === ""){
        alert("제목을 입력해주세요.");
        return;
    }else if(category === ""){
        alert("카테고리를 선택해주세요.");
        return;
    }
    
    const formdata = { 
            todo_id: todo_id,
            due_date:due_date,
            title : title,
            category : category,
            description : description,
            priority : priority.value};
    
    $.ajax({
        url:"/PLT/todo_update.do",
        data : formdata,
        dataType : "json",
        type: "POST",
        success:function(response){
            if(response === "ok"){
                alert("수정이 완료되었습니다.");
                location.href="/PLT/plt_redirect.do";
            }else if(response ==="fail"){
                alert("수정이 실패했습니다.");
                return;
            }else if(response === "invalid_data"){
                alert("입력사항을 확인해주세요.");
                return;
            }
        },
        error:function(){
            alert("서버 오류가 발생했습니다. 서버를 확인하세요.");
            return;
        }
        
    });
}
/*********Todo 수정 관련 메소드 *********/
/*******************************************/





/*******************************************/
/*********Todo 삭제 관련 메소드 *********/
function delete_todo(button){
    var todo_id = button.getAttribute('data-todo-id');
    
    if(confirm("해당 Todo를 삭제하시겠습니까??") === true){
        // 확인 버튼 클릭시
        $.ajax({
       	    url:"/PLT/todo_delete.do",
       	    data : {todo_id : todo_id},
       	    dataType:"json",
       	    type:"POST",
       	    success:function(response){
       	       if(response == "ok"){
       	        alert("삭제가 완료되었습니다.");  
       	        location.href="/PLT/plt_redirect.do";
       	       }else{
       	           alert("알 수 없는 오류가 발생하였습니다.\n서버를 확인하세요.");
       	       }
       	    },
       	    error:function(){
       	        alert("서버오류가 발생하였습니다. 서버를 확인해주세요.");
       	    }
       	});
        
       	
    }else{
        // 취소 버튼 클릭시
        alert("삭제를 취소하였습니다.");
    }
    
    
    
} 
/*********Todo 삭제 관련 메소드 *********/
/*******************************************/

/* 상세보기 모달 창 */
function openDetailModal(element) {
    // 데이터 가져오기
    const title = element.getAttribute("data-title");
    const category = element.getAttribute("data-category");
    const description = element.getAttribute("data-description");
    const priority = element.getAttribute("data-priority");
    const due_date = element.getAttribute("data-due_date");
    const completed = element.getAttribute("data-completed");

    // 모달에 데이터 설정
    document.getElementById("modal-title").innerText = title;
    document.getElementById("modal-category").innerText = category;
    document.getElementById("modal-priority").innerText = priority;
    document.getElementById("modal-description").innerText = description;
    document.getElementById("modal-due-date").innerText = due_date;
    document.getElementById("modal-completed").innerText = completed;

    // 모달 열기
    const modal = new bootstrap.Modal(document.getElementById('detailModal'));
    modal.show();
}

</script>


</body>
</html>