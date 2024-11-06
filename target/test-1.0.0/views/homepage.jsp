<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 세션 가져오기 -->
<%
	String username = "";
	if (session.getAttribute("username") != null) {
		username = (String) session.getAttribute("username");
	}else{
		  PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('해당 페이지는 로그인 이후 이용가능합니다.');");
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

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link  href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
	<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght@100;200;300;400;500;600;700&display=swap" />
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- 과제 제출 상태를 저장하기 위해 쿠키사용 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/3.0.1/js.cookie.min.js"></script>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/PLT/plt_homepage.do">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Toy Project </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/PLT/plt_homepage.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
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
                <img class="sidebar-card-illustration mb-2" src="../images/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>사용한 템플릿</strong> </p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-2">sb-admin-2</a>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

				
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                    
                        
						<%if (role_id == 1) { %>
                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter" id="messageCount"></span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    알림 메시지
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#" id="showMessage">
                                    <div class="dropdown-list-image mr-3">
                                        <span class="material-symbols-outlined">
											wifi_notification
										</span>
                                    </div>
                                    
                                    
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">
                                        	
                                        </div>
                                        <div class="small text-gray-500">보낸 강사 이름</div>
                                    </div>
                                </a>
                              
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>
   					 <%} %>
   					 
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
								<%
									if (username != "") {
								%>
								 <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
	                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <strong><%=username%></strong>님
	                                <input type="hidden" id="username" name="username" value="<%=username%>">
	                                <span class="material-symbols-outlined">	logout</span>
	                            	</a>
								<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
									<%
										if (role_name != "") {
									%> 
											<%=role_name%> 
									<%
										} 
									%>
								</a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <a class="dropdown-item" href="/PLT/todoPage.do">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    To Do
                                </a>
								<%
									if(role_id == 1) {
								%>
								<a class="dropdown-item" href="/PLT/enrollmentPage.do"> 
								<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 수강신청
								</a>
								<a class="dropdown-item" href="/PLT/enroll_ListPage.do"> 
								<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 수강신청 목록
								</a>
								<%
									}
								%>
								<%
									if (role_id == 2) {
								%>
								<a class="dropdown-item" href="/PLT/enrollment_registerPage.do"> 
								<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 
								코스/강의 등록
								</a>
								<a class="dropdown-item" href="/PLT/assginmentPage.do"> 
								<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 
								과제 등록
								</a>
								<%
									}
								%>

								<div class="dropdown-divider"></div>
                                
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
								<%
									} else{
									%>
									 <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
	                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <span class="material-symbols-outlined">	login</span>
	                            	</a>
	                            	<!-- Dropdown - User Information -->
		                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
		                                aria-labelledby="userDropdown">
		                                <a class="dropdown-item" href="/PLT/LoginJoin.do">
		                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
		                                    Sign Up/ Sign In
		                                </a>
		                                <a class="dropdown-item" href="">
		                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
		                                    Activity Log
		                                </a>
		                                <div class="dropdown-divider"></div>
		                            
		                            </div>
									<%
									}
								%>
                            
                        </li>

                    </ul>

                </nav>
                    
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-1 text-gray-800">Toy Project</h1>
                    <span class="mb-4">해당 페이지는 홈페이지입니다.</span>
                   	<br/>
                    <span>오른쪽 상단의 <strong>사용자 정보</strong>를 클릭하여 <strong><code>Todo리스트</code></strong>를 작성하고,
                     <% if(role_id == 2) { %>
                   	 <strong><code>코스 </code></strong>및 <strong><code>과제</code></strong>를 등록해보세요!! </span> 
                    <% } else if(role_id ==1) { %>
                    	<span><strong><code>수강신청 </code></strong>및 <strong><code>수강신청 목록</code></strong>에서 <strong>강의</strong>에 대한 정보를  확인하세요!</span> 
                    <% } %>
                    <hr />
                    <P> 이곳에서 등록된 과제를 확인하세요!!</P>
                

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">등록된 과제 목록</h1>
                    </div>

                    <div class="row">
					    <div class="col-lg-4 mb-4">
					        <!-- Earnings (Monthly) Card Example -->
					       <c:forEach items="${getAssignMentList}" var="aml">
							    <div class="card mb-4 py-3 border-left-primary">
							        <div class="card-body">
							            <div class="row no-gutters align-items-center">
							                <div class="col mr-2">
							                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
							                        ${aml.title}
							                    </div>
							                    <div class="h5 mb-0 font-weight-bold text-gray-800">
							                        ${aml.description}
							                    </div>
							                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
							                        <a>[마감일]</a><br />
							                        : ${aml.due_date}
							                    </div>
							                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
							                        최대 점수 : ${aml.max_grade}
							                    </div>
							                </div>
							
							                <div class="col-auto">
							                    <a type="button" onclick="show_submission_form(${aml.assignment_id})">
							                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
							                    </a>
							                </div>
							            </div>
							        </div>
							    </div>
							</c:forEach>
					    </div>
					    
					
					    <% if (role_id == 1) { %>
					        <c:forEach items="${getAssignMentList}" var="aml">
					            <!-- 과제 작성 및 제출 폼 -->
					            <div class="col-lg-4 mb-4" id="submission_form${aml.assignment_id}" style="display:none; margin-top: 20px;">
					                <div class="card shadow h-100 py-2">
					                    <div class="card-body">
					                        <h5 class="text-center font-weight-bold">과제 작성 및 제출</h5>
					
					                        <form id="assignmentForm">
					                            <div class="form-group">
					                                <label for="assignmentTitle">과제 제목</label>
					                                <input type="text" class="form-control" id="assignmentTitle${aml.assignment_id}" placeholder="제목을 입력하세요">
					                            </div>
					                            <div class="form-group">
					                                <label for="assignmentDescription">과제 내용</label>
					                                <textarea class="form-control" id="assignmentDescription${aml.assignment_id}" rows="3" placeholder="설명을 입력하세요"></textarea>
					                            </div>
					                            <div class="form-group">
					                                <label for="assignmentFile">파일 첨부</label>
					                                <div class="input-group">
					                                    <input type="file" class="form-control-file" id="assignmentFile${aml.assignment_id}" name="assignmentFile">
					                                    <a onclick="fileDelete()" class="file-delete">삭제</a>
					                                </div>
					                            </div>
					                            <button type="button" id="formclick" class="btn btn-primary" onclick="formRegistration(${aml.assignment_id})">과제 제출</button>
					                        </form>
					                    </div>
					                </div>
					            </div>
					        </c:forEach>
					    <% } %>
					</div>
            <!-- End of Main Content -->
            
            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; [해양SI - 인턴] 토이프로젝트_PLT 2024</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">현재 세션의 종료를 원하신다면 'Logout'을 클릭해주세요.</div>
                <div class="modal-footer">
                    <a class="btn btn-primary" onclick="logout()">Logout</a>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>


    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>
    <script src="../js/homepage/homepage.js"></script>

</body>

</html>