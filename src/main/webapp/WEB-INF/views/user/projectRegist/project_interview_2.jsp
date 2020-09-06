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
                <p class="font-weight-bold text-primary" style="font-size: small">2. 지원서 설정</p>
                <p class="text-muted" style="font-size: small">3. 공고문 설정</p>
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
              <h3 class="mb-0">지원서 설정</h3>
            </div>
            <!-- Card body -->
            <div class="card-body">
              <form name="interviewForm_2" method="post">
                <!-- Input groups with icon -->
                <div class="form-group">
                  <label class="col-form-label form-control-label">기본정보</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">기본 정보를 선택해 주세요.</p>
                  <div class="input-group input-group-merge">
                    <div class="row customizing-btn-group">
                      <button type="button" class="btn btn-primary" style="margin: 0px 10px 0px 15px;">이름 <text style="color: #ff6e6e;">*</text></button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">성별</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">생년월일</button>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">부가 정보</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">부가 정보를 선택해 주세요</p>
                  <div class="input-group input-group-merge">
                    <div class="row customizing-btn-group">
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 15px;">영문이름</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">희망연봉</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">직전연봉</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">희망역할</button>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">인적 사항</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">채용 구분을 선택해 주세요</p>
                  <div class="input-group input-group-merge">
                    <div class="row customizing-btn-group">
                      <button type="button" class="btn btn-primary" style="margin: 0px 10px 0px 15px">국적 <text style="color: #ff6e6e;">*</text></button>
                      <button type="button" class="btn btn-primary" style="margin: 0px 10px 0px 0px">기술 <text style="color: #ff6e6e;">*</text></button>
                      <button type="button" class="btn btn-primary" style="margin: 0px 10px 0px 0px">연락처 <text style="color: #ff6e6e;">*</text></button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">주소</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">종교</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">혈액형</button>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-merge">
                    <div class="row customizing-btn-group px-3">
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">취미</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">신장</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">체형</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">시력</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">신체 특이사항</button>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">학력 사항</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">채용 기술 분야를 선택해 주세요.</p>
                  <div class="input-group input-group-merge">
                    <div class="row customizing-btn-group">
                      <button type="button" class="btn btn-primary" style="margin: 0px 10px 0px 15px;">고등학교 <text style="color: #ff6e6e;">*</text></button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">대학교</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">대학원</button>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">어학/자격/기타</label>
                  <p class="text-muted" style="font-size: small">면접 채용 인원을 입력해 주세요.</p>
                  <div class="input-group input-group-merge">
                    <div class="row customizing-btn-group">
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 15px">해외경험</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">수상경력</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">교육이수사항</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">학내외활동</button>
                      <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">봉사활동</button>
                    </div>
                  </div>
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
<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="../../assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
<script>

$('#btnRegist').on('click', function() {
	const btn_selected = $('button[data-toggle=button]');
	
	let interview_customizing = '이름,국적,기술,연락처,고등학교,';
	$.each(btn_selected, function(index, item) {
	 if ($(item).hasClass('active')) {
	  interview_customizing += $(item).text() + ',';
	 }
	});
	interview_customizing = interview_customizing.substr(0, interview_customizing.length - 1); 
	
	const $interview_customizing_ipt = $('<input type="hidden" name="interview_customizing" value= "' + interview_customizing + '" >');
  	
  	$('form[name=interviewForm_2]').append($interview_customizing_ipt);
	
	$('form[name=interviewForm_2]').attr('action', '${pageContext.request.contextPath}/user/projectRegist/project_regist.do?project_no=${project_no}&interview_no=${interview_no}');
	$('form[name=interviewForm_2]').submit(); 

})
</script>
	