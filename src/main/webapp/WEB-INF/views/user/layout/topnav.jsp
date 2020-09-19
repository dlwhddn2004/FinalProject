<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <!-- Favicon -->
  <link rel="icon" href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" type="image/png">
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <!-- Icons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/nucleo/css/nucleo.css" type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <!-- Page plugins -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css/animate.min.css">
  <!-- Argon CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">
<style type="text/css">
   .btn-login:hover {
      color: #5e72e4 !important;
   }

    .search{
      display: block;
    }
    
	#signIn-form .card-header{
	  text-align : center;
      height: 250px;
    }

    #capcha {
      width: 500px;
    }

    #capcha .capchaImg{
      width : 200px;
      height: 100px;
      background-color: #0b90a8;
    }

    #signIn-form .btn-wrapper{
      display: flex !important;
    }
    #signIn-form .custom-control {
      float: left;
      width: 150px;
    }
</style>
</head>
<body>

   <!-- Topnav -->
   <nav class="navbar navbar-top navbar-expand navbar-dark bg-primary border-bottom">
   <div class="container-fluid">
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <!-- Search form -->
         <form class="navbar-search navbar-search-light form-inline mr-sm-3"
            id="navbar-search-main">
            <div class="form-group mb-0">
               <div class="input-group input-group-alternative input-group-merge">
                  <div class="input-group-prepend">
                     <span class="input-group-text"><i class="fas fa-search"></i></span>
                  </div>
                  <input class="form-control" placeholder="Search" type="text">
               </div>
            </div>
            <button type="button" class="close" data-action="search-close"
               data-target="#navbar-search-main" aria-label="Close">
               <span aria-hidden="true">×</span>
            </button>
         </form>
         
         
         <!-- Navbar links -->
         <!-- 로그인 했을 때 (여기부터) -->
         <c:if test="${!empty MEMBER_LOGININFO }">
         <ul class="navbar-nav align-items-center  ml-md-auto ">
            <li class="nav-item d-xl-none">
               <!-- Sidenav toggler -->
               <div class="pr-3 sidenav-toggler sidenav-toggler-dark"
                  data-action="sidenav-pin" data-target="#sidenav-main">
                  <div class="sidenav-toggler-inner">
                     <i class="sidenav-toggler-line"></i> <i
                        class="sidenav-toggler-line"></i> <i
                        class="sidenav-toggler-line"></i>
                  </div>
               </div>
            </li>
            <li class="nav-item d-sm-none"><a class="nav-link" href="#"
               data-action="search-show" data-target="#navbar-search-main"> <i
                  class="ni ni-zoom-split-in"></i>
            </a></li>
            <li class="nav-item dropdown"><a class="nav-link" href="#"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <i class="ni ni-bell-55"></i>
            </a>
               <div class="dropdown-menu dropdown-menu-xl  dropdown-menu-right  py-0 overflow-hidden">
                  <!-- Dropdown header -->
                  <div class="px-3 py-3">
                     <h6 class="text-sm text-muted m-0">You have <strong class="text-primary">13</strong> notifications.</h6>
                  </div>
                  <!-- List group -->
                  <div class="list-group list-group-flush">
                     <a href="#!" class="list-group-item list-group-item-action">
                        <div class="row align-items-center">
                           <div class="col-auto">
                              <!-- Avatar -->
                             <img alt="Image placeholder" src="${pageContext.request.contextPath }/assets/img/theme/team-1.jpg" class="avatar rounded-circle">
                             
                           </div>
                           <div class="col ml--2">
                              <div class="d-flex justify-content-between align-items-center">
                                 <div>
                                    <h4 class="mb-0 text-sm">John Snow</h4>
                                 </div>
                                 <div class="text-right text-muted">
                                    <small>2 hrs ago</small>
                                 </div>
                              </div>
                              <p class="text-sm mb-0">Let's meet at Starbucks at 11:30. Wdyt?</p>
                           </div>
                        </div>
                     </a> <a href="#!" class="list-group-item list-group-item-action">
                        <div class="row align-items-center">
                           <div class="col-auto">
                              <!-- Avatar -->
                              <img alt="Image placeholder"
                                 src="${pageContext.request.contextPath }/assets/img/theme/team-2.jpg"
                                 class="avatar rounded-circle">
                           </div>
                           <div class="col ml--2">
                              <div class="d-flex justify-content-between align-items-center">
                                 <div>
                                    <h4 class="mb-0 text-sm">John Snow</h4>
                                 </div>
                                 <div class="text-right text-muted">
                                    <small>3 hrs ago</small>
                                 </div>
                              </div>
                              <p class="text-sm mb-0">A new issue has been reported for Argon.</p>
                           </div>
                        </div>
                     </a> <a href="#!" class="list-group-item list-group-item-action">
                        <div class="row align-items-center">
                           <div class="col-auto">
                              <!-- Avatar -->
                              <img alt="Image placeholder" src="${pageContext.request.contextPath }/assets/img/theme/team-3.jpg" class="avatar rounded-circle">
                           </div>
                           <div class="col ml--2">
                              <div class="d-flex justify-content-between align-items-center">
                                 <div>
                                    <h4 class="mb-0 text-sm">John Snow</h4>
                                 </div>
                                 <div class="text-right text-muted">
                                    <small>5 hrs ago</small>
                                 </div>
                              </div>
                              <p class="text-sm mb-0">Your posts have been liked a lot.</p>
                           </div>
                        </div>
                     </a> <a href="#!" class="list-group-item list-group-item-action">
                        <div class="row align-items-center">
                           <div class="col-auto">
                              <!-- Avatar -->
                              <img alt="Image placeholder" src="${pageContext.request.contextPath }/assets/img/theme/team-4.jpg" class="avatar rounded-circle">
                           </div>
                           <div class="col ml--2">
                              <div class="d-flex justify-content-between align-items-center">
                                 <div>
                                    <h4 class="mb-0 text-sm">John Snow</h4>
                                 </div>
                                 <div class="text-right text-muted">
                                    <small>2 hrs ago</small>
                                 </div>
                              </div>
                              <p class="text-sm mb-0">Let's meet at Starbucks at 11:30. Wdyt?</p>
                           </div>
                        </div>
                     </a> <a href="#!" class="list-group-item list-group-item-action">
                        <div class="row align-items-center">
                           <div class="col-auto">
                              <!-- Avatar -->
                              <img alt="Image placeholder" src="${pageContext.request.contextPath }/assets/img/theme/team-5.jpg" class="avatar rounded-circle">
                           </div>
                           <div class="col ml--2">
                              <div class="d-flex justify-content-between align-items-center">
                                 <div>
                                    <h4 class="mb-0 text-sm">John Snow</h4>
                                 </div>
                                 <div class="text-right text-muted">
                                    <small>3 hrs ago</small>
                                 </div>
                              </div>
                              <p class="text-sm mb-0">A new issue has been reported for Argon.</p>
                           </div>
                        </div>
                     </a>
                  </div>
                  <!-- View all -->
                  <a href="#!" class="dropdown-item text-center text-primary font-weight-bold py-3">View all</a>
               </div></li>
            <li class="nav-item dropdown"><a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="ni ni-ungroup"></i>
            </a>
               <div class="dropdown-menu dropdown-menu-lg dropdown-menu-dark bg-default  dropdown-menu-right ">
                  <div class="row shortcuts px-4">
                     <a href="#!" class="col-4 shortcut-item"> <span class="shortcut-media avatar rounded-circle bg-gradient-red"> <i class="ni ni-calendar-grid-58"></i>
                     </span> <small>Calendar</small>
                     </a> <a href="#!" class="col-4 shortcut-item"> <span
                        class="shortcut-media avatar rounded-circle bg-gradient-orange">
                           <i class="ni ni-email-83"></i>
                     </span> <small>Email</small>
                     </a> <a href="#!" class="col-4 shortcut-item"> <span
                        class="shortcut-media avatar rounded-circle bg-gradient-info">
                           <i class="ni ni-credit-card"></i>
                     </span> <small>Payments</small>
                     </a> <a href="#!" class="col-4 shortcut-item"> <span
                        class="shortcut-media avatar rounded-circle bg-gradient-green">
                           <i class="ni ni-books"></i>
                     </span> <small>Reports</small>
                     </a> <a href="#!" class="col-4 shortcut-item"> <span
                        class="shortcut-media avatar rounded-circle bg-gradient-purple">
                           <i class="ni ni-pin-3"></i>
                     </span> <small>Maps</small>
                     </a> <a href="#!" class="col-4 shortcut-item"> <span
                        class="shortcut-media avatar rounded-circle bg-gradient-yellow">
                           <i class="ni ni-basket"></i>
                     </span> <small>Shop</small>
                     </a>
                  </div>
               </div></li>
         </ul>
         <ul class="navbar-nav align-items-center  ml-auto ml-md-0 ">
            <li class="nav-item dropdown"><a class="nav-link pr-0" href="#"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false">
                  <div class="media align-items-center" id="imgtitle">
                     <!-- <span class="avatar avatar-sm rounded-circle titleImg"> -->
                     	
                              <!-- <img id = "ImgHeader" alt="Image placeholder"  class="avatar rounded-circle"> -->
                     <!-- </span> -->
                     <div class="media-body  ml-2  d-none d-lg-block">
                        <span class="mb-0 text-sm  font-weight-bold">${MEMBER_LOGININFO.mem_name }</span>
                     </div>
                  </div>
            </a>
               <div class="dropdown-menu  dropdown-menu-right ">
                  <div class="dropdown-header noti-title">
                     <h6 class="text-overflow m-0">Welcome!</h6>
                  </div>
                  <a href="${pageContext.request.contextPath }/user/mypage/myPageView.do?mem_id=${MEMBER_LOGININFO.mem_id}&category_no=${MEMBER_LOGININFO.category_no}" class="dropdown-item"> <i class="ni ni-single-02"></i>
                     <span>My profile</span>
                  </a> <a href="${pageContext.request.contextPath }/user/myprofile/myprofile.do?mem_id=${MEMBER_LOGININFO.mem_id}" class="dropdown-item"> <i
                     class="ni ni-settings-gear-65"></i> <span>Settings</span>
                  </a> <a href="#!" class="dropdown-item"> <i
                     class="ni ni-calendar-grid-58"></i> <span>Activity</span>
                  </a> <a href="${pageContext.request.contextPath }/user/myprofile/myprofiledelete.do?mem_id=${MEMBER_LOGININFO.mem_id}" class="dropdown-item"> <i
                     class="ni ni-support-16"></i> <span>Support</span>
                  </a>
                  <div class="dropdown-divider"></div>
                   <a href="${pageContext.request.contextPath }/user/member/logout.do" class="dropdown-item" id="btnLogout"> <i class="ni ni-user-run"></i>
                     <span>Logout</span>
                  </a>
               </div>
            </li>
         </ul>
         </ul>
         </ul>
        </c:if> 
         <!-- 로그인 했을 때 (여기까지) -->
		</div>
      <c:if test="${empty MEMBER_LOGININFO }">
      	<div align="right">
           <button type="button" class="btn btn-outline-secondary btn-login" style="color: white;" data-toggle="modal" data-target="#LogIn-form">Log In</button>
           <button type="button" class="btn btn-outline-secondary btn-login" style="color: white;" data-toggle="modal" data-target="#signIn-form">Sign In</button>
         </div>
      </c:if>
      	  
   </div>
</nav>

			<!-- 로그인 모달 -->
              <div class="modal fade" id="LogIn-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
			    <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
			      <div class="modal-content">
			        <div class="modal-body p-0">
			          <div class="card bg-secondary border-0 mb-0">
			            <div class="card-header bg-transparent pb-5">
			              <div class="text-muted text-center mt-2 mb-3"><h3>로그인</h3></div>
			            </div>
			            <div class="card-body">
			              <form role="form" method="post">
			                <div class="form-group mb-3">
			                  <div class="input-group input-group-merge input-group-alternative">
			                    <div class="input-group-prepend">
			                      <span class="input-group-text"><i class="fas fa-id-card-alt"></i></span>
			                    </div>
			                    <input id="validationCustom01" class="form-control" placeholder="아이디" type="text" name="login_id">
			                  </div>
			                </div>
			                <div class="form-group">
			                  <div class="input-group input-group-merge input-group-alternative">
			                    <div class="input-group-prepend">
			                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
			                    </div>
			                    <input class="form-control" placeholder="비밀번호" type="password" name="login_pass">
			                  </div>
			                </div>
			                <div class="search">
			                  <span><a href="#" data-toggle="modal" data-target="#ID-form"><small>아이디 찾기</small></a></span>
			                  <span><a href="#"><small>비밀번호 찾기</small></a></span>
			                </div>
			                <!-- 로그인 상태 유지 체크 박스!!-->
			
							<!--<div class="custom-control custom-checkbox">
			                  <input type="checkbox" class="custom-control-input" id="customCheck1">
			                  <label class="custom-control-label" for="customCheck1">로그인 상태 유지</label>
			                </div>-->
			                <div class="text-center">
			                  <button id="btnLogin" type="button" class="btn btn-primary my-4 loginBtn">로그인</button>
			                </div>
			              </form>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
    <div class="modal fade" id="ID-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
			    <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
			      <div class="modal-content">
			        <div class="modal-body p-0">
			          <div class="card bg-secondary border-0 mb-0">
			            <div class="card-header bg-transparent pb-5">
			              <div class="text-muted text-center mt-2 mb-3"><h3>아이디 찾기</h3></div>
			            </div>
			            <div class="card-body">
			                <div class="nav-wrapper">
							    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
							        <li class="nav-item">
							            <a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true"><i class="ni ni-cloud-upload-96 mr-2"></i>이메일로 찾기</a>
							        </li>
							        <li class="nav-item">
							            <a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-2-tab" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false"><i class="ni ni-bell-55 mr-2"></i>전화번호로 찾기</a>
							        </li>
							    </ul>
							</div>
							<div class="card shadow">
							    <div class="card-body">
							        <div class="tab-content" id="myTabContent">
							            <div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
							            	<%--  작업중 <form role="form" action="${pageContext.request.contextPath}/user/find/findIDMail.do" method ="post"> --%>
								                <div class="form-group mb-3">
								                  <div class="input-group input-group-merge input-group-alternative">
								                    <div class="input-group-prepend">
								                      <span class="input-group-text"><i class="fas fa-id-card-alt"></i></span>
								                    </div>
								                    <input class="form-control" placeholder="이름" type="text" name="Search_mem_name">
								                  </div>
								                </div>
								                <div class="form-group div-email">
								                  <div class="input-group input-group-merge input-group-alternative">
								                    <div class="input-group-prepend">
								                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
								                    </div>
								                    <input class="form-control" placeholder="이메일" type="text" name="Search_mem_mail" />
								                  </div>

								                </div>
								                <div class="text-center">
								                  <button id="btnFind" onclick="searchBtn();" type="submit" class="btn btn-primary my-4 FindBtn">찾기</button>
								                   <button id="btnLogin" type="button" class="btn btn-primary my-4 loginBtn">취소</button>
								                </div>
							              <!-- </form> -->
							            </div>
							            <div class="tab-pane fade" id="tabs-icons-text-2" role="tabpanel" aria-labelledby="tabs-icons-text-2-tab">
							            	<form role="form" method="post">
								                <div class="form-group mb-3">
								                  <div class="input-group input-group-merge input-group-alternative">
								                    <div class="input-group-prepend">
								                      <span class="input-group-text"><i class="fas fa-id-card-alt"></i></span>
								                    </div>
								                    <input id="validationCustom01" class="form-control" placeholder="이름" type="text" name="find_mem_name">
								                  </div>
								                </div>
								                <div class="form-group">
								                  <div class="input-group input-group-merge input-group-alternative">
								                    <div class="input-group-prepend">
								                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
								                    </div>
								                    <input class="form-control" placeholder="전화번호" type="text" name="find_mem_tel">
								                  </div>
								                </div>
								                <div class="text-center">
								                  <button id="findbtn" onclick="findBtn();" type="button" class="btn btn-primary my-4 loginBtn">찾기</button>
								                   <button id="findcancle" type="button" class="btn btn-primary my-4 loginBtn">취소</button>
								                </div>
							              </form>
							            </div>
							        </div>
							    </div>
							</div>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
   
   
<div class="modal fade" id="signIn-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
    <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
      <div class="modal-content modal-position-center" style="width: 500px;">
        <div class="modal-body p-0" style="width: 500px;">
          <div class="card bg-secondary mb-0">
            <div class="card-header bg-transparent pb-5" style="height: 50px;">
              <div class="text-muted text-center mt-2 mb-3"><h3>회원가입</h3></div>
            </div>
            <div class="card-body bg-gradient-neutral">
              <div class="form-group mb-3">
                <label class="form-control-label">이용목적</label>
                <div style="display: flex; justify-content: center; align-items: center;">
                  <div class="btn-wrapper text-center py-2">
                    <div class="custom-control custom-radio" style="width: 180px;">
                      <input type="radio" id="customRadioInline2" name="category" class="custom-control-input" value=1 checked>
                      <label class="custom-control-label" for="customRadioInline2"><i class="ni ni-building"></i> 파트너스</label>
                      <div class="text-center mt-2 mb-3"><small>프로젝트를 의뢰하고자<br> 하는 기업, 개발자</small></div>
                    </div>
                    <div class="custom-control custom-radio" style="width: 180px;">
                      <input type="radio" id="customRadioInline1" name="category" class="custom-control-input" value=2>
                      <label class="custom-control-label" for="customRadioInline1"><i class="ni ni-laptop"></i> 디벨로퍼</label>
                      <div class="text-center mt-2 mb-3"><small>포트폴리오를 등록하고 &nbsp; 프로젝트를 수주하고자<br> 하는 개발자</small></div>
                    </div>
                  </div>
                </div>
              </div>
<%--               <form name="regist" class="needs-validation" novalidate action="${pageContext.request.contextPath}/user/member/insertMember.do" method="post"> --%>
              <form name="regist" class="needs-validation" novalidate method="post">
                  <div class="mb-3">
                    <label class="form-control-label" for="validationCustom01">아이디</label>
                    <input type="text" class="form-control" id="validationCustom01" placeholder="connector123" required pattern="^[A-Za-z0-9]{4,12}$" name="mem_id" onkeyup="">
                    <div class="invalid-feedback">
                      	아이디는 영 소문자, 숫자 4~12자리로 입력해주세요.
                    </div>
                    <div class="invalid-feedback idcheck">
                      	중복된 아이디입니다. 
                    </div>
                  </div>
                  <div class="mb-3">
                    <label class="form-control-label" for="validationCustom02">이메일</label>
                    <div class="input-group">
                      <input type="email" class="form-control" id="validationCustom02" placeholder="aaa@connector.com" required="" name="mem_mail">
                      <button type="button" id="mail_confirm" class="btn btn-outline-default" onclick="mailCheck()">인증</button>
                    </div>
                    <div class="invalid-feedback">
                      	이메일 형식에 맞게 입력해주세요.
                    </div>
                  </div>
                  <div class="mb-3">
                    <label class="form-control-label" for="validationCustomUsername">이메일 인증번호</label>
                    <input type="text" class="form-control" name="mail_confirm" id="validationCustomUsername" placeholder="인증번호" aria-describedby="inputGroupPrepend" required="">
                    <div class="invalid-feedback">
                     	 인증번호를 바르게 입력해 주세요.
                    </div>
                  </div>
                  <div class="mb-3">
                    <label class="form-control-label" for="validationCustom03">비밀번호</label>
                    <input type="password" class="form-control" name="password" id="validationCustom03" placeholder="Password" required pattern="^[A-Za-z0-9]{6,12}$">
                    <div class="invalid-feedback">
                      	비밀번호는 영 소문자, 숫자 6~12자리로 입력해주세요.
                    </div>
                  </div>
                  <div class="mb-3 password_confirm">
                    <label class="form-control-label" for="validationCustom04">비밀번호 확인</label>
                    <input type="password" class="form-control" name="password_confirm" id="validationCustom04" placeholder="PasswordCheck" required>
                    <div class="invalid-feedback">
                      	비밀번호가 일치하지 않습니다.
                    </div>
                  </div>
                  <div class="mb-3">
                    <label class="form-control-label" for="validationCustom05">이름</label>
                    <input type="text" class="form-control" id="validationCustom05" placeholder="이름" required="" name="mem_name">
                    <div class="invalid-feedback">
                     	이름을 입력해 주세요.
                    </div>
                  </div>
                  <div class="mb-3">
                    <label class="form-control-label" for="validationCustom06">생일</label>
                    <div class="invalid-feedback">
                      Please provide a valid zip.
                    </div>
                    <div class="form-group px-0">
                        <input class="form-control" placeholder="Select date" type="date" id="validationCustom06" name="mem_bir">
                    </div>
                </div>
                <div class="text-center">
<!--                   <button type="submit" class="btn btn-primary my-4" id="btnRegistMember">회원가입</button> -->
                  <button type="button" class="btn btn-primary my-4" id="btnRegistMember">회원가입</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


	<script src="${pageContext.request.contextPath}/assets/vendor/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/crypto/jsbn.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/crypto/rsa.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/crypto/prng4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/crypto/rng.js"></script>
	
		<script type="text/javascript">
		
		$(function() {
			$('.idcheck').hide();
			
			$('#btnLogin').click(function() {
				var mem_id = $('input[name=login_id]').val();
				var mem_pass = $('input[name=login_pass]').val();
				
				//가수부
				const modulus = '${publicKeyMap.publicModuls}';
				//지수부
				const exponent = '${publicKeyMap.publicExponent}';
				
				var rsaObject = new RSAKey();
				rsaObject.setPublic(modulus, exponent);
				
				var encryptID = rsaObject.encrypt(mem_id);
				var encryptPASS = rsaObject.encrypt(mem_pass);
				
		        var $frm = $('<form action="${pageContext.request.contextPath}/user/member/loginCheck.do" method ="post" ></form>');
		        var $inputID = $('<input type="hidden" value="' + encryptID + '" name="mem_id" />');    
		        var $inputPWD = $('<input type="hidden" value="' + encryptPASS + '" name="mem_pass" />');
		        
		        $frm.append($inputID);
		        $frm.append($inputPWD);
		        $(document.body).append($frm);
		        
		        $frm.submit();
				/* alert(encryptID); */
			});
			
			
            $('#btnRegistMember').on('click', function() {
            	invalidClass = $('form[name=regist] .form-control:invalid').length;
            	
            	if(invalidClass > 0){
    				Swal.fire(
    						'Warning',
    						'회원 정보를 바르게 입력해 주세요.',
    						'warning'
    					)
    					return;
            	}else{
	            	category = $('input[name=category]:checked').val();
	            	pass = $('input[name=password]').val();
	
	            	
					$inputCAT = $('<input type ="hidden" value="' + category + '" name="category_no" />');
					$inputPass = $('<input type ="hidden" value="' + pass + '" name="mem_pass" />');
					$('form[name=regist]').append($inputCAT);
					$('form[name=regist]').append($inputPass);
					
					$('form[name=regist]').attr('action', '${pageContext.request.contextPath}/user/member/insertMember.do');
					$('form[name=regist]').submit();

            	}
			});
            
            $('#btnLogout').on('click', function() {
				$(location).attr('href', '${pageContext.request.contextPath}/user/member/logout.do');
			});
           
            
            
    		const mem_id = "${MEMBER_LOGININFO.mem_id}";
			if(mem_id== ""){
				return false;
			}else{
			 	 $.ajax({
   			    	type:'POST',
   				 url:'${pageContext.request.contextPath}/user/mypage/headerImgChange.do',
   				 dataType:'json',
   				 data: {mem_id : mem_id},
   				 success : function(result){

   					 const imgHeader = "/"+ result.headerImgChange.profile_savename;
   					 console.log(imgHeader);
   					//$('#ImgHeader').attr('src',imgHeader);
   					//<img id = "ImgHeader" alt="Image placeholder"  class="avatar rounded-circle">
   					//<span class='avatar avatar-sm rounded-circle titleImg'></span>
   					const $imgHeader_ipt = $("<span class='avatar avatar-sm rounded-circle'> <img id='ImgHeader' alt='Image placeholder' src='"
   							+ imgHeader +"' class='avatar rounded-circle'></span>");	
   					
   					 $('#imgtitle').prepend($imgHeader_ipt);
   				 },
   				 error: function(xhr,status,error){
   					 alert(error);
   				 }
   			 });	
			}
            
			/* $("#btnFind").click(function(){
				
				const mem_name = $('input[name="mem_name"]').val();
				const mem_mail = $('input[name="mem_mail"]').val();
				
				 	var $frm = $('<form action="${pageContext.request.contextPath}/user/find/findIDMail.do" method ="post" ></form>');
			        var $mem_name = $('<input type="hidden" value="' + mem_name + '" name="mem_name" />');    
			        var $mem_mail = $('<input type="hidden" value="' + mem_mail + '" name="mem_mail" />');
			        
			        $frm.append($mem_name);
			        $frm.append($mem_mail);
			        $(document.body).append($frm);
			        
			        $frm.submit();
			}); */
            
		});
	</script>
	
	<script>
	
		document.getElementById('validationCustom06').value = new Date().toISOString().substring(0, 10);;
		
	    (function() {
	      'use strict';
	      window.addEventListener('load', function() {
	        // Fetch all the forms we want to apply custom Bootstrap validation styles to
	        var forms = document.getElementsByClassName('needs-validation');
	        // Loop over them and prevent submission
	        var validation = Array.prototype.filter.call(forms, function(form) {
	          form.addEventListener('focusout', function(event) {
	            if (form.checkValidity() === false) {
	              event.preventDefault();
	              event.stopPropagation();
	            }
	            form.classList.add('was-validated');
	          }, false);
	        });
	      }, false);
	    })();

  </script>	

  <script>
	var password = document.getElementById("validationCustom03")
	        , confirm_password = document.getElementById("validationCustom04");
	function validatePassword(){
	  if(password.value != confirm_password.value) {
	    confirm_password.setCustomValidity("Passwords Don't Match");
	  } else {
	    confirm_password.setCustomValidity('');
	  }
	}
	
	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;
	
	$('input[name=mem_id]').keyup(function() {
		var inputID = document.getElementById("validationCustom01");
		
		$.ajax({
    		type : 'POST',
    		url : '${pageContext.request.contextPath}/user/member/selectMemberInfoJSON.do',
    		dataType : 'json',
    		data : {
    			mem_id : $('input[name=mem_id]').val()
    		},
    		success : function(data) {
    			$('input[name=mem_id]').css("border-color", "#fb6340");
    			$('.idcheck').show();
			},
			error : function(xhr, err) {
				$('input[name=mem_id]').css("border-color", "#2dce89");
				$('.idcheck').hide();
			}
    	});
	})
	
	function mailCheck() {
		Swal.fire(
				'info',
				'인증번호가 발송되었습니다.',
				'info'
			)
		memMailConfirm = document.getElementById("validationCustomUsername");
		$.ajax({
    		type : 'POST',
    		url : '${pageContext.request.contextPath}/user/member/mailConfirm.do',
    		dataType : 'json',
    		data : {
    			mem_mail : $('input[name=mem_mail]').val()
    		},
    		success : function(data) {
    			$('input[name=mail_confirm]').keyup(function() {
    				if ($('input[name=mail_confirm]').val() != data){
    					memMailConfirm.setCustomValidity("Passwords Don't Match");
    				}else{
    					memMailConfirm.setCustomValidity("");
    				}
    			})
			},
			error : function(xhr, err) {
				
			}
    	});
	}
	
	//이메일로 아이디 찾기
	function searchBtn(){
		const mem_name123 = $('input[name=Search_mem_name]').val();
		const mem_mail123 =$('input[name=Search_mem_mail]').val();
		$.ajax({
			url : "${pageContext.request.contextPath}/user/find/findIDMail.do",
			data : {mem_name : mem_name123, mem_mail: mem_mail123},
			dataType : 'json',
			type : 'POST',
			error : function(result){
				Swal.fire(
						'Warning',
						'이름과 이메일을 다시한번 확인해주세요.',
						'warning'
					)
			},
			success : function(result){
				
				/* var $frm = $('.div-email');
		        var $findID= $('<span style="color : #fb6340; font-size : 80%">'+ "회원님의 이름으로 등록된 아이디는 " + result.MEM_ID + "입니다." +'</span>');    
		        
		        $frm.append($findID); */
				Swal.fire(
						result.MEM_ID,
						'회원님의 이메일로 등록된 아이디입니다.',
						'info'
					)
/* 					return; */
		        
		       $('#ID-form').hide();

		       
			}
		})
		
	}
	
	//등록된 Tel로 아이디 찾기
	function findBtn(){
		const mem_name2 =$('input[name=find_mem_name]').val();
		const mem_tel2 =$('input[name=find_mem_tel]').val();
		$.ajax({
			url : "${pageContext.request.contextPath}/user/find/findIDTel.do",
			data : {mem_name : mem_name2, mem_tel: mem_tel2},
			dataType : 'json',
			type : 'POST',
			error : function(result){
				Swal.fire(
						'Warning',
						'이름과 전화번호를 다시한번 확인해주세요.',
						'warning'
					)
			},
			success : function(result){
				
				Swal.fire(
						result.MEM_ID,
						'회원님의 이메일로 등록된 아이디입니다.',
						'info'
					)
		        
		       $('#ID-form').hide();

		       
			}
		})
	}
  </script>
  



</body>
</html>