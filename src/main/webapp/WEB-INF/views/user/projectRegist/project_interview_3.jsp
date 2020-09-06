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
              <li class="list-group-item bg-gradient-primary text-white">면접 정보 설정</li>
              <li class="list-group-item ml-2">
                <p class="text-muted" style="font-size: small">1. 면접 기본 설정</p>
                <p class="text-muted" style="font-size: small">2. 지원서 설정</p>
                <p class="font-weight-bold text-primary" style="font-size: small">3. 공고문 설정</p>
              </li>
              <li class="list-group-item">프로젝트 등록 완료</li>
            </ul>
          </div>
        </div>
        <!--                              form                                              -->
        <div class="col-lg-8">
          <div class="card">
            <!-- Card header -->
            <div class="card-header">
              <h3 class="mb-0">공고문 설정</h3>
            </div>
            <!-- Card body -->
            <div class="card-body">
              <form>
                <!-- Input groups with icon -->
                <div class="form-group">
                  <label class="col-form-label form-control-label">항목 명칭</label>
                  <label style="color: tomato">*</label>
                  <input class="form-control" type="text" id="agreeName">
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">항목 타입</label>
                  <label style="color: tomato">*</label>
                  <div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="agreeRadio1" name="agreeRadio" class="custom-control-input" checked>
                      <label class="custom-control-label" for="agreeRadio1">필수 동의</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="agreeRadio2" name="agreeRadio" class="custom-control-input">
                      <label class="custom-control-label" for="agreeRadio2">선택 동의</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="agreeRadio3" name="agreeRadio" class="custom-control-input">
                      <label class="custom-control-label" for="agreeRadio3">안내</label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">내용 설정</label>
                  <label style="color: tomato">*</label>
                  <div id="editor" style="height: 400px;"></div>
                </div>
                <div align="right" style="padding: 15px 15px 0px 0px;">
                  <button id="btnRegist" type="button" class="btn btn-primary btn-write">등록</button>
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
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="../../assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
<script>
	<!-- Quill Text Editor Initialize -->
	const quill = new Quill('#editor', {
	  theme: 'snow',
	  placeholder : '<프로젝트의 현재 상황>\n' +
	          '예시) 프로젝트의 목적, 현재 준비 상황, 진행 계획 등\n' +
	          '\n' +
	          '<상세한 업무 내용>\n' +
	          '예시) 사이트의 용도, 주요 기능 List, 작업 분량, 필요한 조건 등\n' +
	          '\n' +
	          '<참고자료 / 유의사항>\n' +
	          '예시) 참고사이트, 기타 유의사항 등'
	});
	
	$('#btnRegist').on('click', function() {
		const agreeName = $('input[name=agreeName]').val();
		const agreeRadio = $('input[name=agreeRadio]:checked').val();
		const content = quill.root.innerHTML;

	})
</script>
	