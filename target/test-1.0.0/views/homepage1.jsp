<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 세션 가져오기 -->
<%
	String username = "";
	if (session.getAttribute("username") != null) {
		username = (String) session.getAttribute("username");
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
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta charset="UTF-8">
<title>PLT홈페이지</title>

<!-- 구글 폰트 - cabin -->
<link
	href="https://fonts.googleapis.com/css2?family=Cabin:ital,wght@0,400..700;1,400..700&display=swap"
	rel="stylesheet">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 홈페이지 CSS추가 -->
<link rel="stylesheet" href="/css/Homepage/homepage.css">

<!-- 홈페이지 JS추가 -->
<script src="/js/homepage.js"></script>
<!-- Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 추가 (Ajax사용) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>


<body>

	<!-- 사용자 정보 구분 -->
	<div>
		<%
			if (role_name != "") {
		%>
		<a>사용자 유형 : <%=role_name%></a>
		<%
			} else {
		%>
		<a>[사용자 정보는 로그인 후 확인이 가능합니다.]</a>
		<%
			}
		%>
		<br />
		<%
			if (username != "") {
		%>
		<a><%=username%>님, 환영합니다!</a>
		<%
			}
		%>
	</div>

	<header>
		<nav class="navbar" style="background-color: #e3f2fd;">
			<div class="container">
				<!-- <a class="navbar-brand" href="#">
	      <img src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="Bootstrap" width="30" height="24">
	    </a> -->

				<a class="logo" data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasWithBothOptions"
					aria-controls="offcanvasWithBothOptions"> <svg width="50"
						height="30" viewBox="0 0 20 24" xmlns="http://www.w3.org/2000/svg">
			    		<path fill="#495057" fill-rule="evenodd" clip-rule="evenodd"
							d="M1.5 6C1.22386 6 1 6.22386 1 6.5C1 6.77614 1.22386 7 1.5 7H10C10.2761 7 10.5 6.77614 10.5 6.5C10.5 6.22386 10.2761 6 10 6H1.5Z
			    																							M1.5 16C1.22386 16 1 16.2239 1 16.5C1 16.7761 1.22386 17 1.5 17H10C10.2761 17 10.5 16.7761 10.5 16.5C10.5 16.2239 10.2761 16 10 16H1.5ZM1 11.5C1 11.2239 1.22386 11 1.5 11H8.5C8.77614 11 9 11.2239 9 11.5C9 11.7761 8.77614 12 8.5 12H1.5C1.22386 12 1 11.7761 1 11.5Z
			    																							M15.5 15.5C17.7091 15.5 19.5 13.7091 19.5 11.5C19.5 9.29086 17.7091 7.5 15.5 7.5C13.2909 7.5 11.5 9.29086 11.5 11.5C11.5 13.7091 13.2909 15.5 15.5 15.5ZM15.5 16.5C16.7006 16.5 17.8024 16.0768 18.6644 15.3715L22.1464 18.8536C22.3417 19.0488 22.6583 19.0488 22.8536 18.8536C23.0488 18.6583 23.0488 18.3417 22.8536 18.1464L19.3715 14.6644C20.0768 13.8024 20.5 12.7006 20.5 11.5C20.5 8.73858 18.2614 6.5 15.5 6.5C12.7386 6.5 10.5 8.73858 10.5 11.5C10.5 14.2614 12.7386 16.5 15.5 16.5Z"></path>
			   		 </svg>
				</a> <a> <img src="/images/PLT로고.png" alt="Logo" width="100" height="50" onclick="location.href='/PLT/plt_home_redirect.do'"> 
				</a>

				<div class="offcanvas offcanvas-start" data-bs-scroll="true"
					tabindex="-1" id="offcanvasWithBothOptions"
					aria-labelledby="offcanvasWithBothOptionsLabel">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">???????????</h5>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>

					<hr class='hr-dashed' />

					<div class="offcanvas-body">
						<div class="accordion accordion-flush" id="accordionFlushExample">
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
										aria-expanded="false" aria-controls="flush-collapseOne">
										PLT 구성요소</button>
								</h2>
								<div id="flush-collapseOne" class="accordion-collapse collapse"
									data-bs-parent="#accordionFlushExample">
									<div class="accordion-body">

										<h3>[ToyProject : PLT]</h3>
										웹사이트 개발에 사용한 기술들입니다. <br> <a href="#">PLT's elements</a>


									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
										aria-expanded="false" aria-controls="flush-collapseTwo">
										MY-Todo</button>
								</h2>
								<div id="flush-collapseTwo" class="accordion-collapse collapse"
									data-bs-parent="#accordionFlushExample">
									<div class="accordion-body">
										<ul>
											<li>Todo_List</li>
											<li>Todo_Add</li>
											<li>Todo_Modify</li>
											<li>Todo_Delete</li>
										</ul>
										#<a href="/PLT/todoPage.do">Go-ToDo</a>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#flush-collapseThree" aria-expanded="false"
										aria-controls="flush-collapseThree">EnrollMent</button>
								</h2>
								<div id="flush-collapseThree"
									class="accordion-collapse collapse"
									data-bs-parent="#accordionFlushExample">
									<div class="accordion-body">
										수강신청 기능들 <br> #<a href="/PLT/enrollmentPage.do">Go-EnrollMent</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<ul class="nav">
					<li><a href="/PLT/todoPage.do">Todo</a></li>
					<li><a href="/PLT/enrollmentPage.do">수강신청</a></li>
					<%
						if(role_id == 2){
					%>
					<li><a href="/PLT/enrollment_registerPage.do">코스/강의 등록</a></li>
					<%
						} 
					%>
					
					
					<%
						if (username == null || username.isEmpty()) {
					%>
					<li><a href="/PLT/LoginJoin.do">Sign In/Up</a></li>
					<%
						} else {
					%>
					<li><a href="" onclick="logout();">LogOut</a></li>
					<%
						}
					%>

				</ul>
			</div>
		</nav>
	</header>
	<!--퀵메뉴-->
	
	<!--/퀵메뉴-->










</body>
</html>