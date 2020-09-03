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
              <li class="list-group-item bg-gradient-primary text-white">프로젝트 정보 등록</li>
              <li class="list-group-item ml-2">
                <p class="text-muted" style="font-size: small">1. 프로젝트 기본 정보</p>
                <p class="text-muted" style="font-size: small">2. 프로젝트 준비 상태</p>
                <p class="font-weight-bold text-primary" style="font-size: small">3. 프로젝트 상세</p>
                <p class="text-muted" style="font-size: small">4. 예산 및 일정</p>
                <p class="text-muted" style="font-size: small">5. 미팅</p>
                <p class="text-muted" style="font-size: small">6. 모집 요건</p>
                <p class="text-muted" style="font-size: small">7. 추가 정보</p>
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
              <h3 class="mb-0">프로젝트 상세</h3>
            </div>
            <!-- Card body -->
            <div class="card-body">
              <form  class="projectForm3" name="projectDetail" method="post">
                <div class="form-group">
                  <label class="col-form-label form-control-label">상세 업무 내용</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">업무 내용을 상세하게 작성해주실수록, 더 적합한 디벨로퍼를 만날 수 있습니다.</p>
                  <!-- Create the editor container -->
                  <div id="editor" style="height: 400px"></div>

                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">관련기술</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">프로젝트에 사용할 관련 기술을 선택해 주세요.</p>
                  <ul class="nav nav-pills nav-pills-circle" id="tabs_2" role="tablist">
                    <li class="nav-item" data-toggle="tooltip" data-placement="bottom" title="Angular">
                      <a class="nav-link rounded-circle active" id="angular" data-toggle="tab" href="#tabs_2_1" role="tab" aria-controls="home" aria-selected="true">
                        <span class="nav-link-icon"><i class="fab fa-angular fa-3x"></i></span>
                        <input type="hidden" value="1">
                      </a>
                    </li>
                    <li class="nav-item"  data-toggle="tooltip" data-placement="bottom" title="Bootstrap">
                      <a class="nav-link" id="bootstrap" data-toggle="tab" href="#tabs_2_2" role="tab" aria-controls="profile" aria-selected="false">
                        <span class="nav-link-icon d-block"><i class="fab fa-bootstrap"></i></span>
                        <input type="hidden" value="2">
                      </a>
                    </li>
                    <li class="nav-item"  data-toggle="tooltip" data-placement="bottom" title="React">
                      <a class="nav-link" id="react" data-toggle="tab" href="#tabs_2_3" role="tab" aria-controls="contact" aria-selected="false">
                        <span class="nav-link-icon d-block"><i class="fab fa-react fa-3x"></i></span>
                        <input type="hidden" value="3">
                      </a>
                    </li>
                    <li class="nav-item"  data-toggle="tooltip" data-placement="bottom" title="Vue.js">
                      <a class="nav-link" id="vue" data-toggle="tab" href="#tabs_2_3" role="tab" aria-controls="contact" aria-selected="false">
                        <span class="nav-link-icon d-block"><i class="fab fa-vuejs fa-3x"></i></span>
                        <input type="hidden" value="4">
                      </a>
                    </li>
                  </ul>
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
	          '<참고사이트 / 유의사항>\n' +
	          '예시) 참고사이트, 기타 유의사항 등'
	});
	
	$(".projectForm3 #btnRegist").on("click", function() {
		content = quill.root.innerHTML;
		tech = $('a[aria-selected=true]').find('input').val();
		techInt = parseInt(tech);
		
		const $content_ipt = $('<input type="hidden" name="project_currentstatus" value= "' + content + '" >');
		const $tech_ipt = $('<input type="hidden" name="project_technologies" value= "' + techInt + '" >');
		
		$('form[name=projectDetail]').append($content_ipt);
		$('form[name=projectDetail]').append($tech_ipt);
		
		$('form[name=projectDetail]').attr('action', '${pageContext.request.contextPath}/user/project/project_4.do?project_no=${project_no}');
		$('form[name=projectDetail]').submit();
		
	});
</script>
	