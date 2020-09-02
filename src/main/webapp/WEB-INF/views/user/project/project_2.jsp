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
                <p class="font-weight-bold text-primary" style="font-size: small">2. 프로젝트 준비 상태</p>
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
<!--                              form                                              -->
        <div class="col-lg-8">
          <div class="card">
            <!-- Card header -->
            <div class="card-header">
              <h3 class="mb-0">프로젝트 준비 상태</h3>
            </div>
            <!-- Card body -->
            <div class="card-body">
              <form class="projectForm2" name="projectReady">
                <div class="form-group">
                  <label class="col-form-label form-control-label">기획상태</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">등록하려는 프로젝트의 현재 기획 상태를 선택해 주세요.</p>
                  <div class="nav-wrapper justify-content-around">
                    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
                      <li class="nav-item">
                        <a class="nav-link mb-sm-3 active readyCheck" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true" name="아이디어만 보유">
                          <i class="ni ni-cloud-upload-96 mr-2"></i>
                         	 아이디어만 보유
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link mb-sm-3 mb-md-0 readyCheck" id="tabs-icons-text-2-tab" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false" name="필요한 내용 간단히 정리">
                          <i class="ni ni-bell-55 mr-2"></i>
                          	필요한 내용들을 간단히 정리
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link mb-sm-3 mb-md-0 readyCheck" id="tabs-icons-text-3-tab" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false" name="상세한 기획문서 보유">
                          <i class="ni ni-calendar-grid-58 mr-2"></i>
                          	상세한 기획문서 보유
                        </a>
                      </li>
                    </ul>
                  </div>
                  <div class="card shadow">
                    <div class="card-body">
                      <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade checkDiv show active" id="tabs-icons-text-1" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
                        </div>
                        <div class="tab-pane fade checkDiv" id="tabs-icons-text-2" role="tabpanel" aria-labelledby="tabs-icons-text-2-tab">
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck1" value="요구사항 정의서">
                            <label class="custom-control-label" for="customCheck1">요구사항 정의서</label>
                          </div>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck2" value="제안요청서">
                            <label class="custom-control-label" for="customCheck2">제안요청서</label>
                          </div>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck3" value="메뉴구조도(IA)">
                            <label class="custom-control-label" for="customCheck3">메뉴구조도(IA)</label>
                          </div>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck4" value="화면설계서">
                            <label class="custom-control-label" for="customCheck4">화면설계서(스토리보드, 와이어프레임)</label>
                          </div>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck5" value="프로토타입">
                            <label class="custom-control-label" for="customCheck5">프로토타입(프로젝트 결과물의 샘플 버전)</label>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">프로젝트 관련 자료</label>
                  <p class="text-muted" style="font-size: small">프로젝트 관련 자료를 간략하게 적어주세요.</p>
                  <div class="">
                    <input class="form-control" type="search" name="reference">
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
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
<script>
      $('#tabs-icons-text-1-tab').on('click', function () {

	      $('.checkDiv input[type=checkbox]').prop('checked', false);

	  });
	  
	  <!-- 등록 버튼 -->
		$("#btnRegist").on("click", function() {
			readyStatus =  $('a[aria-selected=true]').attr('name');
			redayDetail = "";
		  	$('input[type=checkbox]:checked').each(function () {
		  		redayDetail += ($(this).val()) + ",";
			});
		  	redayDetail = redayDetail.substr(0, confirm.length-1);
			
			reference = $('input[name=reference]').val();
			
			const readyStatus_ipt = $('<input type="hidden" name="mem_id" value="${MEMBER_LOGININFO.mem_id }" >');
			const redayDetail_ipt = $('<input type="hidden" name="mem_id" value="${MEMBER_LOGININFO.mem_id }" >');
			
			$('form[name=projectReady]').append()
		  	
// 			$('form[name=projectReady]').attr('action', '${pageContext.request.contextPath}/user/project/project_3.do');
// 			$('form[name=projectReady]').submit();
			
		});
</script>
	