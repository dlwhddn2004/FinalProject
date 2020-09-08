<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Favicon -->
<link rel="icon" href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" type="image/png">
<!-- Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/nucleo/css/nucleo.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
<!-- Page plugins -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/datatables.net-select-bs4/css/select.bootstrap4.min.css">
<!-- Argon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">

<!-- 면접 RTC -->
<div class="row">
  <div class="col-md-10">
    <div class="card-header">
      <div>
        <h2>면접</h2>
        <small class="text-muted">화상 채팅을 통해서 면접을 진행하세요.</small>
      </div>
    </div>
    <iframe src="${pageContext.request.contextPath}/interviewPage/RTCMain.html" frameborder="0" style="width: 100%; height: 930px;"></iframe>
  </div>
  <div class="col-md-2">
    <div class="card">
      <div class="card-header">
        <div class="text-center">
          <h5 class="text-center">현재 면접자</h5>
        </div>
        <div class="text-center">
          <small class="text-muted">면접자를 실시간으로 평가하세요.</small>
        </div>
      </div>
      <!-- Card body -->
      <div class="card-body">
        <a href="#!">
          <img src="${pageContext.request.contextPath}/assets/img/theme/team-1.jpg" class="rounded-circle img-center img-fluid shadow shadow-lg--hover" style="width: 140px;">
        </a>
        <div class="pt-4 text-center">
          <h5 class="h3 title">
            <span class="d-block mb-1">김덕년</span>
            <small class="h4 font-weight-light text-muted">Web Developer</small>
          </h5>
          <div class="nav-wrapper">
          	<button type="button" class="btn btn-facebook btn-icon-only rounded-circle">
			    <span class="btn-inner--icon"><i class="fab fa-facebook"></i></span>
			</button>
			<button type="button" class="btn btn-twitter btn-icon-only rounded-circle">
			    <span class="btn-inner--icon"><i class="fab fa-twitter"></i></span>
			</button>
			<button type="button" class="btn btn-google-plus btn-icon-only rounded-circle">
			    <span class="btn-inner--icon"><i class="fab fa-google-plus-g"></i></span>
			</button>
          </div>
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
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-select/js/dataTables.select.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/nouislider/distribute/nouislider.min.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>