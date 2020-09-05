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


<div class="projectForm">
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
      <!--소메뉴 -->
        <div class="col-lg-4">
          <div class="card">
            <!-- Card image -->
            <img class="card-img-top" src="${pageContext.request.contextPath }/assets/img/theme/projectForm.jpg" alt="Image placeholder">
            <!-- List group -->
            <ul class="list-group list-group-flush">
              <li class="list-group-item bg-gradient-primary text-white">프로젝트 정보 등록</li>
              <li class="list-group-item ml-2">
                <p class="font-weight-bold text-primary" style="font-size: small">1. 프로젝트 기본 정보</p>
                <p class="text-muted" style="font-size: small">2. 프로젝트 준비 상태</p>
                <p class="text-muted" style="font-size: small">3. 프로젝트 상세</p>
                <p class="text-muted" style="font-size: small">4. 예산 및 일정</p>
                <p class="text-muted" style="font-size: small">5. 미팅</p>
                <p class="text-muted" style="font-size: small">6. 모집 요건</p>
                <p class="text-muted" style="font-size: small">7. 추가 정보</p>
              </li>
              <li class="list-group-item">프로젝트 등록 완료</li>
            </ul>
          </div>
        </div>
<!-- form -->
        <div class="col-lg-8">
          <div class="card">
            <!-- Card header -->
            <div class="card-header">
              <h3 class="mb-0">프로젝트 기본 정보 등록</h3>
            </div>
            <!-- Card body -->
            <div class="card-body">
              <form name="projectInfo" method="post">
                <div class="form-group">
                  <label class="col-form-label form-control-label">파트너스 정보</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">파트너스 정보를 선택해 주세요</p>
                  <div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="project_clientinformation1" name="partnerInfo" class="custom-control-input" value="개인">
                      <label class="custom-control-label" for="project_clientinformation1">개인</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="project_clientinformation2" name="partnerInfo" class="custom-control-input" value="팀">
                      <label class="custom-control-label" for="project_clientinformation2">팀</label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">파트너스 소개</label>
                  <p class="text-muted" style="font-size: small">소개를 간략히 입력해주세요.</p>
                  <div class="">
                    <input class="form-control" type="search" name="partnerIntro">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">프로젝트 진행 방식</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">프로젝트에 적합한 작업자를 모집하기 위해 프로젝트 진행 방식을 선택해주세요</p>
                  <div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="project_processstatus1" name="processWay" class="custom-control-input" value="외주">
                      <label class="custom-control-label" for="project_processstatus1">외주</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="project_processstatus2" name="processWay" class="custom-control-input" value="상주">
                      <label class="custom-control-label" for="project_processstatus2">상주</label>
                    </div>
                  </div>
                </div>
                <div class="form-group flex-column">
                  <label class="col-form-label form-control-label">프로젝트 진행 분류</label>
                  <label style="color: tomato">*</label>
                  <div class="custom-control custom-radio mb-3">
                    <input type="radio" id="project_processcategory1" name="processCategory" class="custom-control-input" value="신규 프로젝트">
                    <label class="custom-control-label" for="project_processcategory1">신규 프로젝트</label>
                  </div>
                  <div class="custom-control custom-radio">
                    <input type="radio" id="project_processcategory2" name="processCategory" class="custom-control-input" value="운영 중인 서비스 리뉴얼/유지보수">
                    <label class="custom-control-label" for="project_processcategory2">운영 중인 서비스의 리뉴얼 or 유지보수</label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">프로젝트 제목</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">프로젝트 제목을 30자 이내로 적어주세요.</p>
                  <div class="">
                    <input class="form-control" type="search" name="projectTitle" placeholder="ex) 솔루션 기반 자동차 경매 웹 사이트 구축">
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

<script type="text/javascript">

	<!-- 등록 버튼 -->
	$("#btnRegist").on("click", function() {
		if ($('input[name=partnerInfo]').is(':checked') == false) {
			$.notify({
				// options
				message: '파트너스 정보를 선택해주세요!' 
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
		if ($('input[name=processWay]').is(':checked') == false) {
			$.notify({
				// options
				message: '프로젝트 진행 방식을 선택해주세요!' 
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
		if ($('input[name=processCategory]').is(':checked') == false) {
			$.notify({
				// options
				message: '프로젝트 진행 분류를 선택해주세요!' 
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
		
		if ($('input[name=projectTitle]').val() == "") {
			$.notify({
				// options
				message: '제목을 입력해주세요!' 
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
		
		partnerInfo = $('input[name=partnerInfo]:checked').val();
		partnerIntro = $('input[name=partnerIntro]').val();
		processWay = $('input[name=processWay]:checked').val();
		processCategory = $('input[name=processCategory]:checked').val();
		projectTitle = $('input[name=projectTitle]').val();
		
		const $member_ipt = $('<input type="hidden" name="mem_id" value="${MEMBER_LOGININFO.mem_id }" >');
		const $partnerInfo_ipt = $('<input type="hidden" name="project_clientinformation" value= "' + partnerInfo +  '" >');
		const $partnerIntro_ipt = $('<input type="hidden" name="project_clientintroduce" value= "' + partnerIntro +  '" >');
		const $processWay_ipt = $('<input type="hidden" name="project_processstatus" value= "' + processWay +  '" >');
		const $processCategory_ipt = $('<input type="hidden" name="project_processcategory" value= "' + processCategory +  '" >');
		const $projectTitle_ipt = $('<input type="hidden" name="project_title" value= "' + projectTitle +  '" >');
		
		
		$('form[name=projectInfo]').append($member_ipt);
		$('form[name=projectInfo]').append($partnerInfo_ipt);
		$('form[name=projectInfo]').append($partnerIntro_ipt);
		$('form[name=projectInfo]').append($processWay_ipt);
		$('form[name=projectInfo]').append($processCategory_ipt);
		$('form[name=projectInfo]').append($projectTitle_ipt);
		
		$('form[name=projectInfo]').attr('action', '${pageContext.request.contextPath}/user/projectRegist/project_2.do');
		$('form[name=projectInfo]').submit();
	});
	
</script>
