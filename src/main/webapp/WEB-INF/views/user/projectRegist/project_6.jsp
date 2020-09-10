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
              <p class="text-muted" style="font-size: small">3. 프로젝트 상세</p>
              <p class="text-muted" style="font-size: small">4. 예산 및 일정</p>
              <p class="text-muted" style="font-size: small">5. 미팅</p>
              <p class="font-weight-bold text-primary" style="font-size: small">6. 모집 요건</p>
              <p class="text-muted" style="font-size: small">7. 추가 정보</p>
            </li>
            <li class="list-group-item">면접 정보 설정</li>
            <li class="list-group-item">프로젝트 등록 완료</li>
          </ul>
        </div>
      </div>
      <!--                              form                                              -->
      <div class="col-lg-8">
        <div class="card">
          <!-- Card header -->
          <div class="card-header">
            <h3 class="mb-0">모집요건</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <form name="projectMozip" method="post">
              <div class="form-group">
                <label class="col-form-label form-control-label">모집 마감일</label>
                <label style="color: tomato">*</label>
                <p class="text-muted" style="font-size: small">지원자 모집 마감일을 선택해 주세요.</p>
                <div class="input-group col-xl-3 px-0">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                  </div>
                  <input class="form-control datepicker" placeholder="Select date" type="text" id="today" name="deadline">
                </div>
              </div>
              <div class="form-group">
                <label class="col-form-label form-control-label">지원 사업 여부</label>
                <label style="color: tomato">*</label>
                <div class="custom-control custom-radio mb-3">
                  <input type="radio" id="project_supportstatus1" name="supportstatus" class="custom-control-input" value="정부지원 사업입니다." checked>
                  <label class="custom-control-label" for="project_supportstatus1">정부지원 사업입니다.</label>
                </div>
                <div class="custom-control custom-radio">
                  <input type="radio" id="project_supportstatus2" name="supportstatus" class="custom-control-input" value="정부지원 사입이 아닙니다.">
                  <label class="custom-control-label" for="project_supportstatus2">아닙니다.</label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-form-label form-control-label">지원자 필수 요건</label>
                <label style="color: tomato">*</label>
                <p class="text-muted" style="font-size: small">조건에 맞는 디벨로퍼를 지원자로 받습니다</p>
                <div class="col-md-3">
                  <div class="custom-control custom-checkbox mb-3">
                    <input class="custom-control-input" id="customCheck1" type="checkbox" value="개인 또는 팀 가능">
                    <label class="custom-control-label" for="customCheck1">개인 또는 팀 가능</label>
                  </div>
                  <div class="custom-control custom-checkbox mb-3">
                    <input class="custom-control-input" id="customCheck2" type="checkbox" value="개인사업자">
                    <label class="custom-control-label" for="customCheck2">개인사업자</label>
                  </div>
                  <div class="custom-control custom-checkbox mb-3">
                    <input class="custom-control-input" id="customCheck3" type="checkbox" value="법인사업자">
                    <label class="custom-control-label" for="customCheck3">법인사업자</label>
                  </div>
                  <div class="custom-control custom-checkbox mb-3">
                    <input class="custom-control-input" id="customCheck4" type="checkbox" value="업력 1년 이상">
                    <label class="custom-control-label" for="customCheck4">업력 1년 이상</label>
                  </div>
                  <div class="custom-control custom-checkbox mb-3">
                    <input class="custom-control-input" id="customCheck5" type="checkbox" value="자사 협력업체 등록 가능">
                    <label class="custom-control-label" for="customCheck5">자사 협력업체 등록 가능</label>
                  </div>
                  <div class="custom-control custom-checkbox mb-3">
                    <input class="custom-control-input" id="customCheck6" type="checkbox" value="보증보험 발급 가능">
                    <label class="custom-control-label" for="customCheck6">보증보험 발급 가능</label>
                  </div>
                  <div class="custom-control custom-checkbox mb-3">
                    <input class="custom-control-input" id="customCheck7" type="checkbox" value="프로젝트 제안 발표 가능">
                    <label class="custom-control-label" for="customCheck7">프로젝트 제안 발표 가능</label>
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

$(".datepicker").datepicker().datepicker("setDate", new Date());

$("#btnRegist").on("click", function() {

	if ($('input[type=checkbox]').is(':checked') == false) {
		$.notify({
			// options
			message: '지원자 필수 요건을 선택해주세요!' 
		},{
			// settings
			placement: {
				from: "top",
				align: "center"
			},
			type: 'info'
		});
		
		return;
	}
	
	datePick = $('input[name=deadline]').val();
    dateSplit = datePick.split("/");
    dateYear = dateSplit[2];
    dateMonth = dateSplit[0];
    dateDate = dateSplit[1];
    deadline = dateYear+"-"+dateMonth+"-"+dateDate;
    
    supportstatus = $('input[name=supportstatus]:checked').val();
    
    requirements = "";
  	$('input[type=checkbox]:checked').each(function () {
  		requirements += ($(this).val()) + ", ";
	});
  	requirements = requirements.substr(0, requirements.length-2);
  	
  	const $deadline_ipt = $('<input type="hidden" name="project_applicationdeadline" value= "' + deadline + '" >');
  	const $supportstatus_ipt = $('<input type="hidden" name="project_supportstatus" value= "' + supportstatus + '" >');
  	const $requirements_ipt = $('<input type="hidden" name="project_essentialrequirements" value= "' + requirements + '" >');
  	
  	$('form[name=projectMozip]').append($deadline_ipt);
  	$('form[name=projectMozip]').append($supportstatus_ipt);
  	$('form[name=projectMozip]').append($requirements_ipt);

	$('form[name=projectMozip]').attr('action', '${pageContext.request.contextPath}/user/projectRegist/project_7.do?project_no=${project_no}');
	$('form[name=projectMozip]').submit(); 
	
});
</script>
	