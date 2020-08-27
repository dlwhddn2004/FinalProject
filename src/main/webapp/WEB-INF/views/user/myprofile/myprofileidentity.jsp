<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function(){
	   
	   
	   $('form[name=memberForm]').submit(function(){
	      $(this).attr('action', '${pageContext.request.contextPath}/user/myprofile/updateMemberInfo2.do');
	   });
	   });
</script>
<html>
<style>
.card-profile {
	width : 100%;
 	height : 100%;
 
}
.card{
 display: table; margin-left: auto; margin-right: auto; display: inline-block;

}
 .card-body {
 display: table; margin-left: auto; margin-right: auto; display: inline-block;   
 
 width : 50%;
 	height : 50%;

} 
img{

  float : left;
}

</style>
<head>
<head>

  <!-- Favicon -->
  <link rel="icon" href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" type="image/png">
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <!-- Icons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/nucleo/css/nucleo.css" type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <!-- Argon CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">
</head>
<link rel="stylesheet" herf="${pageContext.request.contextPath}/assets/dropzone-4.3.0/dist/dropzone.css">
<title>Insert title here</title>
</head>
<body>
<form name="memberForm" method="post">
 <!-- Main content -->
  <div class="main-content" id="panel">
    <!-- Topnav -->

      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- Search form -->
          <form class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
           
             
    </nav>
    <!-- Header -->
    <!-- Header -->
    
    <!-- Page content -->
    
      <div class="row">
        <div class="col-xl-4 order-xl-2">
          <div class="card-profile">
            <img src="${pageContext.request.contextPath}/assets/img/theme/cha.jpg" alt="Image placeholder" class="card-img-top">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">
                <div class="card-profile-image">
                  <a href="#">
                    <img src="${pageContext.request.contextPath}/assets/img/theme/pp.jpg" class="rounded-circle">
                  </a>
                </div>
              </div>
            </div>
            <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
              <div class="d-flex justify-content-between">
             
              </div>
            </div>
            <div class="card-body pt-0">
              <div class="row">
                <div class="col">
                
                </div>
              </div>
              <div class="text-center">
                <h5 class="h3">
                 deokdeoks<span class="font-weight-light">, 27</span>
                </h5>
                <div class="h5 font-weight-300">
                  <i class="ni location_pin mr-2"></i>Bucharest, Romania
                </div>
                <div class="h5 mt-4">
                  <i class="ni business_briefcase-24 mr-2"></i>Solution Manager - Creative Tim Officer
                </div>
                <div>
                  <i class="ni education_hat mr-2"></i>University of Computer Science
                </div>
              </div>
            </div>
          </div>
          <!-- Progress track -->
          <div class="card">
            <!-- Card header -->
      
              <!-- Title -->
             
          </div>
        </div>

                <!-- Card body -->
           
            </div>
          </div>
          <div class="card">
            <div class="card-header">
              <div class="align-items-center">
                <div class="col-8">
                <h3>계좌관리</h3>
                  <h3 class="text-muted mb-0">프로젝트 대금을 지급받을 계좌 정보를 등록해주세요.</h3>
                </div>
             
              </div>
            </div>
            <div class="card-body">
          <img src="${pageContext.request.contextPath}/assets/img/theme/p2.png" >
        <!--   <h1>계좌 등록</h1> -->
              
                <div class="pl-lg-4">
                  <div class="cx">
                    <div class="col-lg-6">
                      <div class="form-group">
                <h6 class="heading-small text-muted mb-2">계좌 등록</h6>
                        <label class="form-control-label" for="input-username">은행명</label>
                         <select name="mem_tel1" class="form-control">
            <option value="은행선택">은행선택</option>
            <option value="한국산업은행">한국산업은행</option>                       
            <option value="기업은행">기업은행</option>                       
            <option value="국민은행">국민은행</option>                       
            <option value="우리은행">우리은행</option>                       
            <option value="신한은행">신한은행</option>                       
            <option value="하나은행">하나은행</option>                       
            <option value="농협">농협</option>                       
            <option value="단위농협">단위농협</option>                       
            <option value="SC은행">SC은행</option>                       
            <option value="외환은행">외환은행</option>                       
            <option value="한국씨티은행">한국씨티은행</option>                       
            <option value="우체국">우체국</option>                       
            <option value="경남은행">경남은행</option>                       
            <option value="광주은행">광주은행</option>                       
            <option value="대구은행">대구은행</option>                       
         </select> 
                      </div>
                    </div>
                   
                  
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">예금주</label>
                        <input type="hidden" name="mem_id" id="">
                        <input type="text" id="mem_bankname" class="form-control"   value='${memberInfo.mem_bankname }'  name="mem_bankname">
                      </div>
                    </div>
                  <div>
                  
                  
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">계좌 번호</label>
                        <input type="text" id="input-first-name" value="${memberInfo.mem_bankno}" name="mem_bankno" id="mem_bankno"class="form-control" placeholder="" value="Lucky">
                      <label class="form-control-label" for="input-username">'-'를 제외하고 입력하시오</label>
                      </div>
                    </div>
                    </form>
                   
               
                
   
                    </div>
                    <br>
                    </div>
    				    <button type="submit"  class="btn btn-primary btn-write" id="btn3" style="float:right";>등록</button>
                </div>
            </div>
        </li>
    </ul>
</div>
	
                  </div>
                         <div>
						</div>
                  
                  
                 
                  </div>
                </div>
               
              </form>
            </div>
          </div>
        </div>
      </div>
   </form>
  <!-- Argon Scripts -->
  <!-- Core -->
 
  <script src="${pageContext.request.contextPath}/assets/vendor/jquery/dist/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/js-cookie/js.cookie.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/vendor/dropzone/dist/min/dropzone.min.js"></script>
  <!-- Argon JS -->
  <script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
  <!-- Demo JS - remove this in your project -->
  <script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
</body>

</html>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

</script>


</html>