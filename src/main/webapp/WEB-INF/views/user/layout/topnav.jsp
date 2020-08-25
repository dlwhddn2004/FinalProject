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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.css">
  <!-- Argon CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">
<style type="text/css">
   .btn-login:hover {
      color: #5e72e4 !important;
   }
   
    .card-header{
      height: 80px;
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
                  <div class="media align-items-center">
                     <span class="avatar avatar-sm rounded-circle"> <img
                        alt="Image placeholder" src="${pageContext.request.contextPath }/assets/img/theme/team-4.jpg">
                     </span>
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
                  </a> <a href="#!" class="dropdown-item"> <i
                     class="ni ni-settings-gear-65"></i> <span>Settings</span>
                  </a> <a href="#!" class="dropdown-item"> <i
                     class="ni ni-calendar-grid-58"></i> <span>Activity</span>
                  </a> <a href="#!" class="dropdown-item"> <i
                     class="ni ni-support-16"></i> <span>Support</span>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#!" class="dropdown-item" id="btnLogout"> <i class="ni ni-user-run"></i>
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
			              <form role="form" action="${pageContext.request.contextPath}/user/member/loginCheck.do" method="post">
			                <div class="form-group mb-3">
			                  <div class="input-group input-group-merge input-group-alternative">
			                    <div class="input-group-prepend">
			                      <span class="input-group-text"><i class="fas fa-id-card-alt"></i></span>
			                    </div>
			                    <input id="validationCustom01" class="form-control" placeholder="아이디" type="text" name="mem_id">
			                  </div>
			                </div>
			                <div class="form-group">
			                  <div class="input-group input-group-merge input-group-alternative">
			                    <div class="input-group-prepend">
			                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
			                    </div>
			                    <input class="form-control" placeholder="비밀번호" type="password" name="mem_pass">
			                  </div>
			                </div>
			                <div class="search">
			                  <span><a href="#"><small>아이디 찾기</small></a></span>
			                  <span><a href="#"><small>비밀번호 찾기</small></a></span>
			                </div>
			                <!-- 로그인 상태 유지 체크 박스!!-->
			
							<!--<div class="custom-control custom-checkbox">
			                  <input type="checkbox" class="custom-control-input" id="customCheck1">
			                  <label class="custom-control-label" for="customCheck1">로그인 상태 유지</label>
			                </div>-->
			                <div class="text-center">
			                  <button type="submit" class="btn btn-primary my-4 loginBtn">로그인</button>
			                </div>
			              </form>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
   
   
   
				<!-- 회원가입 모달 -->
                <div class="modal fade" id="signIn-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
			    <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
			      <div class="modal-content">
			        <div class="modal-body p-0">
			          <div class="card bg-secondary border-0 mb-0">
			            <div class="card-body">
			              <div class="card-header bg-transparent pb-5">
			
			              <div class="text-muted text-center mt-2 mb-3"><h3>회원가입</h3></div>
			              <div class="text-muted text-center mt-2 mb-3"><h5>이용목적</h5></div>
			
			              <div class="btn-wrapper text-center">
			               <!-- <a href="#" class="btn btn-neutral btn-icon" id="btn-developer">
			                  <span class="btn-inner&#45;&#45;text">디벨로퍼</span>
			                </a>
			                <a href="#" class="btn btn-neutral btn-icon">
			                  <span class="btn-inner&#45;&#45;text">파트너스</span>
			                </a>-->
			                <div class="custom-control custom-radio">
			                  <input type="radio" id="customRadioInline1" name="category" class="custom-control-input" value=2>
			                  <label class="custom-control-label" for="customRadioInline1">디벨로퍼</label>
			                  <div class="text-muted text-center mt-2 mb-3"><small>포트폴리오를 등록하고 프로젝트를 수주하고자 하는 개발자</small></div>
			                </div>
			                <div class="custom-control custom-radio">
			                  <input type="radio" id="customRadioInline2" name="category" class="custom-control-input" value=1>
			                  <label class="custom-control-label" for="customRadioInline2">파트너스</label>
			                  <div class="text-muted text-center mt-2 mb-3"><small>프로젝트를 의뢰하고자 하는 기업, 개발자</small></div>
			                </div>
			              </div>
			            </div>
   						<form name="regist" class="needs-validation" novalidate action="${pageContext.request.contextPath}/user/member/insertMember.do" method="post">
			                <div class="form-group mb-3">
			                  <div class="input-group input-group-merge input-group-alternative">
			                    <div class="input-group-prepend">
			                      <span class="input-group-text"><i class="fas fa-id-card-alt"></i></span>
			                    </div>
			                    <input class="form-control" placeholder="아이디" type="text" name="mem_id" required pattern="^[a-z0-9]{4,12}$">
			                    <div class="valid-feedback">
			                    	success
			                    </div>
			                    <div class="invalid-feedback">
			                    	아이디는 영 소문자와 숫자 4~12자리로 입력해주세요.
			                    </div>
			                  </div>
			                </div>
			                <div class="form-group mb-3">
			                  <div class="input-group input-group-merge input-group-alternative">
			                    <div class="input-group-prepend">
			                      <span class="input-group-text"><i class="ni ni-email-83"></i></span>
			                    </div>
			                    <input class="form-control" placeholder="이메일" type="email" name="mem_mail" required pattern="^[a-z0-9]+@[a-z]+(\.[a-z]+){1,2}$">
<!-- 			                    <button type="button" class="btn btn-outline-primary">인증</button> -->
			                    <div class="valid-feedback">
			                    	success
			                    </div>
			                    <div class="invalid-feedback">
			                    	aaa@naver.com
			                    </div>
			                  </div>
			                </div>
<!-- 			                <div class="form-group"> -->
<!-- 			                  <div class="input-group input-group-merge input-group-alternative"> -->
<!-- 			                    <div class="input-group-prepend"> -->
<!-- 			                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span> -->
<!-- 			                    </div> -->
<!--  			                    <input class="form-control" placeholder="이메일 인증번호" type="text" required> -->
<!-- 			                    <input class="form-control" placeholder="이메일 인증번호" type="text"> -->
<!--  			                    <div class="valid-feedback"> -->
<!-- 			                    	success -->
<!-- 			                    </div> -->
<!-- 			                    <div class="invalid-feedback"> -->
<!-- 			                    	이메일 인증번호를 입력해주세요. -->
<!-- 			                    </div> -->
<!-- 			                  </div> -->
<!-- 			                </div> -->
			                <div class="form-group">
			                  <div class="input-group input-group-merge input-group-alternative">
			                    <div class="input-group-prepend">
			                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
			                    </div>
			                    <input class="form-control" placeholder="비밀번호" type="password" name="mem_pass" required pattern="^[A-Za-z0-90-9]{4,12}$">
			              		<div class="valid-feedback">
			                    	success
			                  	</div>
			                  	<div class="invalid-feedback">
			                    	비밀번호는 영어 소문자,대문자, 숫자 4~12자리로 입력해주세요
			                  	</div>
			                  </div>
			                </div>
<!-- 			                <div class="form-group"> -->
<!-- 			                  <div class="input-group input-group-merge input-group-alternative"> -->
<!-- 			                    <div class="input-group-prepend"> -->
<!-- 			                      <span class="input-group-text"><i class="fas fa-check"></i></span> -->
<!-- 			                    </div> -->
<!-- 			                    <input class="form-control" placeholder="비밀번호 확인" type="password" required> -->
<!-- 			                  </div> -->
<!-- 			                </div> -->
<!-- 			               <div id="capcha"> -->
<!-- 			                  <img class="capchaImg"> -->
<!-- 			                    <i class="fas fa-redo"></i> -->
<!-- 			                  </img> -->
<!-- 			                </div> -->
<!-- 			                <div class="form-group"> -->
<!-- 			                  <div class="input-group input-group-merge input-group-alternative"> -->
<!-- 			                    <div class="input-group-prepend"> -->
<!-- 			                      <span class="input-group-text"><i class="fas fa-check"></i></span> -->
<!-- 			                    </div> -->
<!-- 			                    <input class="form-control" placeholder="자동입력방지 문자" type="text"> -->
<!-- 			                  </div> -->
<!-- 			                </div> -->
			                <div class="text-center">
			                  <button type="submit" class="btn btn-primary my-4" id="btnRegistMember">회원가입</button>
			                </div>
			              </form>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
   <!-- Argon Scripts -->
	<!-- Core -->
	<script src="${pageContext.request.contextPath}/assets/vendor/jquery/dist/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/validation.js"></script>
	
		
	<script type="text/javascript">
/* 		function change(){
			var element = document.getElementByID("sign_id");
			element.style.color = "red";
		} */
		(function() {
		      'use strict';
		      window.addEventListener('load', function() {
		        // Fetch all the forms we want to apply custom Bootstrap validation styles to
		        var forms = document.getElementsByClassName('needs-validation');
		        // Loop over them and prevent submission
		        var validation = Array.prototype.filter.call(forms, function(form) {
		          form.addEventListener('submit', function(event) {
		            if (form.checkValidity() === false) {
		              event.preventDefault();
		              event.stopPropagation();
		            }
		            form.classList.add('was-validated');
		          }, false);
		        });
		      }, false);
		    })();
		
		$(function() {
            /* $('.loginBtn').on('submit', function(){
            	
               var mem_id = $('input[name = mem_id]').val();
               var mem_pass = $('input[name = mem_pass]').val();
                              
               var $frm = $('<form action="${pageContext.request.contextPath}/user/member/loginCheck.do" method="post"></form>');
               var $inputID = $('<input type="hidden" value="' +mem_id+ '" name="mem_id" />');
               var $inputPWD = $('<input type="hidden" value="' +mem_pass+ '" name="mem_pass" />');
               $frm.append($inputID);
               $frm.append($inputPWD);
               $(document.body).append($frm);
               $frm.submit();
            }); */
            
            $('#btnRegistMember').on('click', function() {
            	var category = $('input[name=category]:checked').val();
            	
				var $inputCAT = $('<input type ="hidden" value="' + category + '" name="category_no" />');
				$('form[name=regist]').append($inputCAT);
			});
            
            $('#btnLogout').on('click', function() {
				$(location).attr('href', '${pageContext.request.contextPath}/user/member/logout.do');
			});
            
            
            
            
		});
	</script>


</body>
</html>