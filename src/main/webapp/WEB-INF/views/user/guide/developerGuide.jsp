<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Favicon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/assets/img/brand/favicon.png"
	type="image/png">
<!-- Fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Icons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/nucleo/css/nucleo.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	type="text/css">
<!-- Page plugins -->
<!-- Argon CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0"
	type="text/css">
<style>
.guide_img{
	width : 100%;
	height : 100%;
}
</style>

<div class="row">
        <div class="col">
          <div class="card">
            <!--                   카드헤더                     -->
            <div class="card-header">
              <h3 class="mb-0">가이드</h3>
              <p class="text-sm mb-0">커넥터의 이용을 도와드립니다.</p>
            </div>
            <div class="card-body"></div>
          </div>
        </div>
      </div>
      <!--                  카드 메뉴랑 폼 묶는 곳                -->
      <div class="row">
      <!--                  소메뉴                              -->
        <div class="col-lg-4">
          <div class="card">
            <!-- Card image -->
            <img class="card-img-top" src="../../assets/img/theme/guide.png" alt="Image placeholder">
            <!-- List group -->
            <ul class="list-group list-group-flush">
              <li class="list-group-item">서비스 소개</li>
              <li class="list-group-item">디벨로퍼 이용방법</li>
              <li class="list-group-item bg-gradient-success text-white">파트너스 이용방법</li>
              <li class="list-group-item">자주 묻는 질문</li>
            </ul>
          </div>
        </div>
<!--                              form                                              -->
        <div class="col-lg-8">
          <div class="card">
            <!-- Card header -->
            <div class="card-header">
              <h3 class="mb-0">디벨로퍼 이용방법</h3>
            </div>
            <!-- Card body -->
            <div class="card-body">
				<div class="form-group">
					<h2>
		              	<img src="${pageContext.request.contextPath}/assets/img/guide/number.png">
		              	포트폴리오 등록
              		</h2>
              		<p class="mx-2">포트폴리오를 등록하면,<br>수많은 회원들의 의견을 받아볼 수 있습니다.</p>
              		<img class="guide_img" alt="" src="${pageContext.request.contextPath}/assets/img/guide/g_guide_1.PNG">                  
              		<img class="guide_img" alt="" src="${pageContext.request.contextPath}/assets/img/guide/g_guide_2.PNG">                  
                </div>
				<div class="form-group">
					<h2>
		              	<img src="${pageContext.request.contextPath}/assets/img/guide/number_2.png">
		              	프로젝트 지원
              		</h2>
              		<p class="mx-2">프로젝트 찾기 페이지에서<br>원하는 프로젝트에 지원할 수 있습니다.</p>
              		<img class="guide_img" alt="" src="${pageContext.request.contextPath}/assets/img/guide/g_guide_3.PNG">                  
                </div>
            </div>
          </div>
        </div>
      </div>
      
<!-- Argon Scripts -->
<!-- Core -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js-cookie/js.cookie.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
<!-- Optional JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="../../assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>