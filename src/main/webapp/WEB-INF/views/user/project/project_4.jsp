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
              <p class="font-weight-bold text-primary" style="font-size: small">4. 예산 및 일정</p>
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
            <h3 class="mb-0">예산 및 일정</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <form class="projectForm4" name="projectBudget" method="post">
              <div class="form-group">
                <label class="col-form-label form-control-label">지출 가능 예산</label>
                <label style="color: tomato">*</label>
                <p class="text-muted" style="font-size: small">프로젝트에 지출 가능한 예산을 입력해 주세요.</p>
                <div class="form-group col-xl-3 px-0">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1"><i class="fas fa-won-sign"></i></span>
                    </div>
                    <input name="budget" type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                </div>

              </div>
              <div class="form-group">
                <label class="col-form-label form-control-label">예상 시작일</label>
                <label style="color: tomato">*</label>
                <p class="text-muted" style="font-size: small">프로젝트가 착수되는 날짜입니다.</p>
                <p class="text-muted" style="font-size: small">해당 날자에 프로젝트 시작이 가능한 디벨로퍼들이 지원하게 됩니다.</p>
                <div class="form-group col-xl-3 px-0">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                    </div>
                    <input class="form-control datepicker" placeholder="Select date" type="text" id="today" name="startDate">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-form-label form-control-label">예상 기간</label>
                <label style="color: tomato">*</label>
                <p class="text-muted" style="font-size: small">프로젝트 진행 기간을 입력해 주세요.</p>
			    <div class="input-group input-group-merge col-xl-3 px-0">
			      <input name="term" type="text" class="form-control" placeholder="50" aria-label="Recipient's username" aria-describedby="basic-addon2">
			      <div class="input-group-append">
			        <span class="input-group-text" id="basic-addon2">일</span>
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
	
	$(".projectForm4 #btnRegist").on("click", function() {
		budget = $('input[name=budget]').val();
		datePick = $('input[name=startDate]').val();
	    dateSplit = datePick.split("/");
	    dateYear = dateSplit[2];
	    dateMonth = dateSplit[0];
	    dateDate = dateSplit[1];
	    startDate = dateYear+"-"+dateMonth+"-"+dateDate;
	    term = $('input[name=term]').val();
	    
	    const $budget_ipt = $('<input type="hidden" name="project_budget" value= "' + budget + '" >');
		const $startDate_ipt = $('<input type="hidden" name="project_startdate" value= "' + startDate + '" >');
		const $term_ipt = $('<input type="hidden" name="project_duration" value= "' + term + '" >');
		//enddate도 계산해서 넣기
		
		$('form[name=projectBudget]').append($budget_ipt);
		$('form[name=projectBudget]').append($startDate_ipt);
		$('form[name=projectBudget]').append($term_ipt);
		

		$('form[name=projectBudget]').attr('action', '${pageContext.request.contextPath}/user/project/project_5.do?project_no=${project_no}');
		$('form[name=projectBudget]').submit(); 
		
	});
</script>
	