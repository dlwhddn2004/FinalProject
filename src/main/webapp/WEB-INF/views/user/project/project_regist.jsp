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
 <!-- Quill -->
 <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">


<div class="row">
      <div class="col">
        <div class="card">
          <!--                   카드헤더                     -->
          <div class="card-header">
            <h3 class="mb-0">프로젝트 등록</h3>
            <p class="text-sm mb-0">100만여 명의 디벨로퍼를 대상으로 프로젝트를 등록하고, 견적과 지원서를 무료로 받아보세요.</p>
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
          <img class="card-img-top" src="${pageContext.request.contextPath }/assets/img/theme/projectForm.jpg" alt="Image placeholder">
          <!-- List group -->
          <ul class="list-group list-group-flush">
            <li class="list-group-item">프로젝트 정보 등록</li>
            <li class="list-group-item bg-gradient-primary text-white">프로젝트 등록 완료</li>
          </ul>
        </div>
      </div>
      <!--                              form                                              -->
      <div class="col-lg-8">
        <div class="card">
          <!-- Card header -->
          <div class="card-header">
            <h3 class="mb-0">프로젝트 등록 완료</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <form>
              <div class="form-group">
                <h3>프로젝트</h3>
                <h2>프로젝트를 등록해주셔서 감사합니다.</h2>
                <button type="button" class="btn btn-outline-default">마이페이지</button>
                <button type="button" class="btn btn-default">다른 프로젝트 등록</button>
              </div>
            </form>
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
<script>

</script>
	