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

    <title>SB Admin 2 - Buttons</title>

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
<!-- jQuery 추가 (Ajax사용) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
                <div class="sidebar-brand-text mx-3">과제 등록 페이지</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
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
            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
                    aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Components</span>
                </a>
                <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item active" href="buttons.html">Buttons</a>
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
                        <a class="collapse-item" href="login.html">Login</a>
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
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
               <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">과제 등록</h1>

    <div class="row">

        <div class="col-lg-6">

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">과제 정보 입력</h6>
                </div>
                <div class="card-body">
                    
                        <div class="form-group">
                            <label for="assignmentTitle">과제 제목</label>
                            <input type="text" class="form-control" id="assignmentTitle" name="title" required>
                        </div>
                        <div class="form-group">
                            <label for="assignmentDescription">과제 설명</label>
                            <textarea class="form-control" id="assignmentDescription" name="description" rows="5" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="dueDate">마감일</label>
                            <input type="datetime-local" class="form-control" id="dueDate" name="due_date" required>
                        </div>
                        <div class="form-group">
                            <label for="maxGrade">최대 점수</label>
                            <input type="number" class="form-control" id="maxGrade" name="max_grade" min="1" required>
                        </div>
                        <button type="button" class="btn btn-primary btn-icon-split" onclick="assignmentRegistration()">
                            <span class="icon text-white-50">
                                <i class="fas fa-paper-plane"></i>
                            </span>
                            <span class="text">과제 등록</span>
                        </button>
                    
                </div>
            </div>
        </div>

        <div class="col-lg-6">

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">기타 정보</h6>
                </div>
                <div class="card-body">
                    <p>여기에는 과제 등록 관련된 추가 정보를 안내하거나, 과제 제출 방법에 대한 설명을 추가할 수 있습니다.</p>
                    <p>과제를 등록한 후, 학생들이 해당 과제를 확인하고 제출할 수 있습니다.</p>
                </div>
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
                        <span>Copyright &copy; Toy Project 2024</span>
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


<script type="text/javascript">
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

function assignmentRegistration(){
	var title = document.getElementById('assignmentTitle').value;
	var description = document.getElementById('assignmentDescription').value;
	var due_date = document.getElementById('dueDate').value;
	var maxGrade = document.getElementById('maxGrade').value;
	
	var at = document.getElementById('assignmentTitle');
	var ad = document.getElementById('assignmentDescription');
	var dd = document.getElementById('dueDate');
	var mg = document.getElementById('maxGrade');
	
	if(title === ""){
	    alert("과제 제목을 입력하세요.");
	    at.focus();
	    return;
	}else if(description === ""){
	    alert("과제 설명을 작성하세요.");
	    ad.focus();
	    return;
	}else if(due_date === ""){
	    alert("마감일을 설정하세요.");
	    dd.focus();
	    return;
	}else if(maxGrade === ""){
	    alert("최대 점수를 부여하세요.");
	    mg.focus();
	    return;
	}else if(maxGrade > 100){
	    alert("최대 점수는 100점 이하까지 가능합니다.");
	    mg.focus();
	    return;
	}
	
	console.log(title);
	console.log(description);
	console.log(due_date);
	console.log(maxGrade);
	
	var formData = {title:title, description:description, due_date:due_date, maxGrade:maxGrade};
	
	$.ajax({
	    url:"/PLT/assignmentRegistration.do",
	    data:formData,
	    dataType:"json",
	    type:"POST",
	    success:function(response){
	        if(response === "ok"){
	            alert("과제를 등록하였습니다.");
	            location.href="/PLT/assginmentPage.do";
	        }else if(response === "fail"){
	            alert("과제 등록이 실패하였습니다.");
	            return;
	        }
	    },
	    error:function(){
	        alert("과제 등록 중, 서버 오류 발생...");
	        return;
	    }
	});
	
}

</script>
    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>

</body>

</html>