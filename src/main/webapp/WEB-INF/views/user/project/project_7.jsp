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
              <p class="text-muted" style="font-size: small">6. 모집 요건</p>
              <p class="font-weight-bold text-primary" style="font-size: small">7. 추가 정보</p>
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
            <h3 class="mb-0">추가 정보</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <form name="projectAdd" method="post">
              <div class="form-group">
                <label class="col-form-label form-control-label">프로젝트 인력 상황</label>
                <label style="color: tomato">*</label>
                <div class="custom-control custom-radio mb-3">
                  <input type="radio" id="project_manpower1" name="manpower" class="custom-control-input" value="IT 프로젝트 경험이 있는 인력이 있습니다.">
                  <label class="custom-control-label" for="project_manpower1">IT 프로젝트 경험이 있는 인력이 있습니다.</label>
                </div>
                <div class="custom-control custom-radio">
                  <input type="radio" id="project_manpower2" name="manpower" class="custom-control-input" value="IT 프로젝트 경험이 있는 인력이 없습니다.">
                  <label class="custom-control-label" for="project_manpower2">IT프로젝트 경험이 있는 인력이 없습니다.</label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-form-label form-control-label">매니징 경험</label>
                <label style="color: tomato">*</label>
                <div class="custom-control custom-radio mb-3">
                  <input type="radio" id="project_managementexperience1" name="managementexperience" class="custom-control-input" value="프로젝트 매니징 경험이 있습니다.">
                  <label class="custom-control-label" for="project_managementexperience1">프로젝트 매니징 경험이 있습니다.</label>
                </div>
                <div class="custom-control custom-radio">
                  <input type="radio" id="project_managementexperience2" name="managementexperience" class="custom-control-input" value="프로젝트 매니징 경험이 없습니다.">
                  <label class="custom-control-label" for="project_managementexperience2">없습니다.</label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-form-label form-control-label">향후 계획</label>
                <label style="color: tomato">*</label>
                <div class="col-md-10">
                  <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" id="customCheck1" type="checkbox" value="향후 유지보수를 위한 아웃소싱 계획이 있습니다.">
                    <label class="custom-control-label" for="customCheck1">향후 유지보수를 위한 아웃소싱 계획이 있습니다.</label>
                  </div>
                  <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" id="customCheck2" type="checkbox" value="향후 고도화를 위한 아웃소싱 계획이 있습니다.">
                    <label class="custom-control-label" for="customCheck2">향후 고도화를 위한 아웃소싱 계획이 있습니다.</label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-form-label form-control-label">프로젝트 우선순위</label>
                <label style="color: tomato">*</label>
                <div class="custom-control custom-radio">
                  <input type="radio" id="project_supportstatus1" name="priority" class="custom-control-input" value="완성도 높은 산출물을 받아 보는 것이 중요">
                  <label class="custom-control-label" for="project_supportstatus1">완성도 높은 산출물을 받아 보는 것이 중요</label>
                </div>
                <div class="custom-control custom-radio">
                  <input type="radio" id="project_supportstatus2" name="priority" class="custom-control-input" value="최대한 낮은 금액으로 제안받는 것이 중요">
                  <label class="custom-control-label" for="project_supportstatus2">최대한 낮은 금액으로 제안받는 것이 중요</label>
                </div>
                <div class="custom-control custom-radio">
                  <input type="radio" id="project_supportstatus3" name="priority" class="custom-control-input" value="프로젝트 기간 준수가 가장 중요">
                  <label class="custom-control-label" for="project_supportstatus3">프로젝트 기간 준수가 가장 중요</label>
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

$("#btnRegist").on("click", function() {
	manpower = $('input[name=manpower]:checked').val();
	managementexperience = $('input[name=managementexperience]:checked').val();
	
    plan = "";
  	$('input[type=checkbox]:checked').each(function () {
  		plan += ($(this).val()) + "<br>";
	});
  	
  	priority = $('input[name=priority]:checked').val();
  	
	const $manpower_ipt = $('<input type="hidden" name="project_manpower" value= "' + manpower + '" >');
	const $managementexperience = $('<input type="hidden" name="project_managementexperience" value= "' + managementexperience + '" >');
	const $plan_ipt = $('<input type="hidden" name="project_futureplans" value= "' + plan + '" >');
	const $priority_ipt = $('<input type="hidden" name="project_priority" value= "' + priority + '" >');
  	
  	$('form[name=projectAdd]').append($manpower_ipt);
  	$('form[name=projectAdd]').append($managementexperience);
  	$('form[name=projectAdd]').append($plan_ipt);
  	$('form[name=projectAdd]').append($priority_ipt);
	
	$('form[name=projectAdd]').attr('action', '${pageContext.request.contextPath}/user/project/project_regist.do?project_no=${project_no}');
	$('form[name=projectAdd]').submit(); 
	
});
</script>
	