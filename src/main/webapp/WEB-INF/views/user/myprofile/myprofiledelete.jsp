<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	// 취소

	$("#submit").on("click", function(){
		if($("#mem_pass").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#mem_pass").focus();
			return false;
		}	
	});
	
		
	
})
/* $(function(){
$('.btn-primary').click(function(){
	$(location).attr('href', '${pageContext.request.contextPath}/user/myprofile/myprofile.do');
});
}); */
</script>
</head>
<body>
<!-- Main content -->
  <div class="main-content">
    <!-- Header -->
    
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-6 col-md-8 px-5">
              <h1 class="text-white"></h1>
              <p class="text-lead text-white"></p>
            </div>
          </div>
        </div>
      </div>
      <div class="separator separator-bottom separator-skew zindex-100">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
         
        </svg>
      </div>
    </div>
    <!-- Page content -->
    <div class="container mt--8 pb-5">
      <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
          <div class="card card-profile bg-secondary mt-5">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">
                <div class="card-profile-image">
    
                </div>
              </div>
            </div>
            <div class="card-body pt-7 px-5">
              <div class="text-center mb-4">
                <h3>비밀번호를 입력해주세요.</h3>
              </div>
              <form action="${pageContext.request.contextPath}/user/myprofile/memberdelete.do" method="post" role="form">
          <div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="mem_id" name="mem_id" value="${MEMBER_LOGININFO.mem_id}" readonly="readonly"/>
				</div>
                                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" name="mem_pass" id="mem_pass" placeholder="Password" type="password">
                  </div>
                </div>
                  <button type="submit" id="submit" value='탈퇴' class="btn btn-primary mt-2" style="float:right">확인</button>
                <div class="text-center">
                </div>
                </div>
                </div>
              </form>
             
            </div>
          </div>
         
        </div>
      </div>
    </div>
  </div>
  <c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
  <!-- Footer -->

 
  <!-- Argon Scripts -->
  <!-- Core -->
  <script src="../../assets/vendor/jquery/dist/jquery.min.js"></script>
  <script src="../../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../../assets/vendor/js-cookie/js.cookie.js"></script>
  <script src="../../assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
  <script src="../../assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
  <!-- Argon JS -->
  <script src="../../assets/js/argon.js?v=1.2.0"></script>
  <!-- Demo JS - remove this in your project -->
  <script src="../../assets/js/demo.min.js"></script>
</body>
</body>
</html>