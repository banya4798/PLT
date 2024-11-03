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
	<!-- Bootstrap CSS 추가 -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3"><sup>*</sup>수강신청 목록<sup>*</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index.html">
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

					<h1 class="h3 mb-2 text-gray-800" style="margin-top:20px;">#</h1>
                    <!-- Topbar Search -->
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                    action="/PLT/enroll_ListPage.do">
                   		
                   			 <select class="form-control" id="exampleSelect" name="search_1" style="width:20%; margin-top: 10px;">
						        <option value="">학기</option>
						        <c:forEach var="gs1" items="${gs1 }">
						        <option value="${gs1.semester }">${gs1.semester }</option>
						        </c:forEach>
						    </select>
						    
						     <select class="form-control" id="exampleSelect" name="search_2" style="width:20%; margin-top: 10px;">
						        <option value="">학점</option>
						         <c:forEach var="gs2" items="${gs2 }">
						        <option value="${gs2.credit}">${gs2.credit}</option>
						        </c:forEach>
						    </select>
						    
						    <select class="form-control" id="exampleSelect" name="search_3" style="width:20%; margin-top: 10px;">
						        <option value="">학부(과)</option>
						           <c:forEach var="gs3" items="${gs3 }">
						        <option value="${gs3.classification }">${gs3.classification }</option>
						        </c:forEach>
						    </select>
						    
						    <div class="input-group" style="left:265px; width:65%; margin-top: -38px;">
	                            <input type="text" class="form-control bg-light border-0 small" placeholder="강좌명 및 전공..."
	                                aria-label="Search" aria-describedby="basic-addon2" name="searchText">
	                            <div class="input-group-append">
	                                <button class="btn btn-primary" type="submit">
	                                    <i class="fas fa-search"></i>
	                                </button>
	                            </div>
	                            <button class="btn btn-info" type="button" onclick="location.href='/PLT/enroll_ListPage.do'"
	                            style="margin-left:10px;">
	                                 <i class="fas fa-redo"></i>
	                                </button>
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
                       
                        <li class="nav-item dropdown no-arrow">
								<%
									if (username != "") {
								%>
								 <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
	                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <strong><%=username%></strong>님
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
               <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">신청 목록</h1>
                    <p class="mb-3">코스에 대해 신청한 목록을 <strong>#</strong>에서 정렬을 통해 조회할 수 있습니다.</p>

					<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">신청학점: ${getCredit }</h6>
                            <select id="select_enrollPage" onchange="go_enrollPage()"
								class="form-select form-select-sm"
								aria-label="Small select example" style="margin-left:110px; margin-top:-25px; width: 150px;">
								<option value="">- 페이지 선택 -</option>
								<c:forEach var="e_list" items="${getEnrollments_List }">
									<option value="/PLT/enroll_start.do?course_id=${e_list.course_id}&instructor_id=${e_list.instructor_id}">${e_list.title }</option>
								</c:forEach>
							</select>
						</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
                                    <thead>
                                        <tr>
                                            <th>Num </th>
                                            <th>강좌명</th>
                                            <th>교수명</th>
                                            <th>학기</th>
                                            <th>학점</th>
                                            <th>전공</th>
                                            <th>학부(과)</th>
                                            <th>시작시간</th>
                                            <th>종료시간</th>
                                        </tr>
                                    </thead>
                                   	 <tbody>
                                    
                                    <c:choose>
                                    	<c:when test="${empty getEnrollments_List}">
	                                        <tr>
												<td colspan="9" style="text-align: center;">수강신청 정보가 없습니다.</td>
											</tr>
                                    	</c:when>
                                    	
                                    	<c:otherwise>
                                    	<c:forEach var="e_list" items="${getEnrollments_List }">
                                    	 	<tr>
	                                            <td>${e_list.enrollment_num }</td>
	                                            <td>${e_list.title }</a></td>
	                                            <td>${e_list.professor }</td>
	                                            <td>${e_list.semester }</td>
	                                            <td>${e_list.credit }</td>
	                                            <td>${e_list.department }</td>
	                                            <td>${e_list.classification }</td>
	                                            <td>${e_list.enroll_start_time }</td>
	                                            <td>${e_list.enroll_end_time }</td>
	                                        </tr>
	                                        </c:forEach>
                                    	</c:otherwise>
                                    
                                    </c:choose>
                                    	
                                      
                                    
                                    </tbody>
                                </table>
                                
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>

            </div>
    

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

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



<script>
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

// 해당하는 강의페이지로 이동
function go_enrollPage(){
    var enrollPage = document.getElementById('select_enrollPage');
    var go_enrollPage = enrollPage.value;
    if(go_enrollPage){
        location.href=go_enrollPage;
    }
}


</script>

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../js/demo/chart-area-demo.js"></script>
    <script src="../js/demo/chart-pie-demo.js"></script>
</body>

</html>
