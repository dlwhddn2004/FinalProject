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
              <p class="font-weight-bold text-primary" style="font-size: small">5. 미팅</p>
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
            <h3 class="mb-0">미팅</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <form class="projectForm4" name="projectMeeting" method="post">
              <div class="form-group">
                <label class="col-form-label form-control-label">사전 미팅 방식</label>
                <label style="color: tomato">*</label>
                <p class="text-muted" style="font-size: small">사전 미팅 방식을 선택해 주세요</p>
                <div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="project_premeeting1" name="premeeting" class="custom-control-input" value="온라인(카카오톡, 화상미팅 등)">
                    <label class="custom-control-label" for="project_premeeting1">온라인(카카오톡, 화상미팅 등)</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="project_premeeting2" name="premeeting" class="custom-control-input" value="오프라인">
                    <label class="custom-control-label" for="project_premeeting2">오프라인</label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-form-label form-control-label">진행 중 미팅</label><label style="color: tomato">*</label><br>
                <span style="font-size: small">미팅 방식</span><label style="color: tomato">*</label>
                <div class="pt-3 pb-3">
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="project_porceedmeeting1" name="porceedmeeting" class="custom-control-input" value="온라인(카카오톡, 화상미팅 등)">
                    <label class="custom-control-label" for="project_porceedmeeting1">온라인(카카오톡, 화상미팅 등)</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="project_porceedmeeting2" name="porceedmeeting" class="custom-control-input" value="오프라인">
                    <label class="custom-control-label" for="project_porceedmeeting2">오프라인</label>
                  </div>
                </div>
                <span style="font-size: small">미팅 주기</span><label style="color: tomato">*</label>
                <div class="pt-3 pb-3">
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="meeting_cycle1" name="meeting_cycle" class="custom-control-input" value="2">
                    <label class="custom-control-label" for="meeting_cycle1">주 2회</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="meeting_cycle2" name="meeting_cycle" class="custom-control-input" value="1">
                    <label class="custom-control-label" for="meeting_cycle2">주 1회</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="meeting_cycle3" name="meeting_cycle" class="custom-control-input" value="0">
                    <label class="custom-control-label" for="meeting_cycle3">필요시 요청</label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-form-label form-control-label">파트너스 위치</label>
                <label style="color: tomato">*</label>
                <p class="text-muted" style="font-size: small">디벨로퍼가 미팅 위치 선정시 파트너스의 위치를 참고합니다.</p>
                <div class="row px-3">
                  <select class="form-control col-xl-3" id="clientLocation">
                    <option>시/도</option>
                    <option>서울특별시</option>
                    <option>부산광역시</option>
                    <option>대구광역시</option>
                    <option>인천광역시</option>
                    <option>광주광역시</option>
                    <option>대전광역시</option>
                    <option>울산광역시</option>
                    <option>세종특별자치시</option>
                    <option>경기도</option>
                    <option>강원도</option>
                    <option>충청북도</option>
                    <option>충청남도</option>
                    <option>전라북도</option>
                    <option>전라남도</option>
                    <option>경상북도</option>
                    <option>경상남도</option>
                    <option>제주특별자치도</option>
                  </select>
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
	if ($('input[name=premeeting]').is(':checked') == false) {
		$.notify({
			// options
			message: '사전 미팅 방식을 선택해주세요!' 
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
	if ($('input[name=porceedmeeting]').is(':checked') == false) {
		$.notify({
			// options
			message: '진행중 미팅 방식을 선택해주세요!' 
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
	if ($('input[name=meeting_cycle]').is(':checked') == false) {
		$.notify({
			// options
			message: '미팅 주기를 선택해주세요!' 
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
	
	if ($("#clientLocation option:selected").val() == "시/도") {
		$.notify({
			// options
			message: '클라이언트 위치를 선택해주세요!' 
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
	
	premeeting = $('input[name=premeeting]:checked').val();
	proceedmeeting = $('input[name=porceedmeeting]:checked').val();
	meeting_cycle = $('input[name=meeting_cycle]:checked').val();
	clientLocation = $("#clientLocation option:selected").val();
	
	const $premeeting_ipt = $('<input type="hidden" name="project_premeeting" value= "' + premeeting + '" >');
	const $proceedmeeting_ipt = $('<input type="hidden" name="project_proceedingmeeting" value= "' + proceedmeeting + '" >');
	const $meeting_cycle_ipt = $('<input type="hidden" name="project_meetingcycle" value= "' + meeting_cycle + '" >');
	const $location_ipt = $('<input type="hidden" name="project_clientlocation" value= "' + clientLocation + '" >');
	
	$('form[name=projectMeeting]').append($premeeting_ipt);
	$('form[name=projectMeeting]').append($proceedmeeting_ipt);
	$('form[name=projectMeeting]').append($meeting_cycle_ipt);
	$('form[name=projectMeeting]').append($location_ipt);

	$('form[name=projectMeeting]').attr('action', '${pageContext.request.contextPath}/user/projectRegist/project_6.do?project_no=${project_no}');
	$('form[name=projectMeeting]').submit(); 
	
});
</script>
	