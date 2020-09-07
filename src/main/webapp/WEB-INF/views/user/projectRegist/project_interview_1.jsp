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
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/select2/dist/css/select2.min.css">


    <!--                  카드 메뉴랑 폼 묶는 곳                -->
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
                <p class="font-weight-bold text-primary" style="font-size: small">1. 면접 기본 설정</p>
                <p class="text-muted" style="font-size: small">2. 지원서 설정</p>
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
              <h3 class="mb-0">면접 기본 설정</h3>
            </div>
            <!-- Card body -->
            <div class="card-body">
              <form name="interviewForm_1" method="post">
                <!-- Input groups with icon -->
                <div class="form-group">
                  <label class="col-form-label form-control-label">공고명</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">면접 공고명을 적어주세요.</p>
                  <div class="form-group px-0">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1"><i class="fas fa-heading"></i></span>
                      </div>
                      <input type="search" class="form-control interview-title" aria-label="Username" aria-describedby="basic-addon1" placeholder="프로젝트 면접 공고">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">채용 형태</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">채용 형태를 선택해 주세요</p>
                  <div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="interviewForm1" name="interviewForm" class="custom-control-input" value="일반 채용" checked>
                      <label class="custom-control-label" for="interviewForm1">일반 채용</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="interviewForm2" name="interviewForm" class="custom-control-input" value="상시 채용">
                      <label class="custom-control-label" for="interviewForm2">상시 채용</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="interviewForm3" name="interviewForm" class="custom-control-input" value="추천 채용">
                      <label class="custom-control-label" for="interviewForm3">추천 채용</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="interviewForm4" name="interviewForm" class="custom-control-input" value="비공개 채용">
                      <label class="custom-control-label" for="interviewForm4">비공개 채용</label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">채용 구분</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">채용 구분을 선택해 주세요</p>
                  <div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="interviewDivision1" name="interviewDivision" class="custom-control-input" value="공채" checked>
                      <label class="custom-control-label" for="interviewDivision1">공채</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="interviewDivision2" name="interviewDivision" class="custom-control-input" value="수시">
                      <label class="custom-control-label" for="interviewDivision2">수시</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="interviewDivision3" name="interviewDivision" class="custom-control-input" value="상시">
                      <label class="custom-control-label" for="interviewDivision3">상시</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="interviewDivision4" name="interviewDivision" class="custom-control-input" value="특별 채용">
                      <label class="custom-control-label" for="interviewDivision4">특별 채용</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="interviewDivision5" name="interviewDivision" class="custom-control-input" value="추천 채용">
                      <label class="custom-control-label" for="interviewDivision5">추천 채용</label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">채용 기술 분야</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">채용 기술 분야를 선택해 주세요.</p>
                  <div class="input-group input-group-merge">
                    <select class="form-control interview-tech" data-toggle="select" multiple data-placeholder="기술 선택">
                      <option value="1">ANGULAR</option>
                      <option value="2">BOOTSTRAP</option>
                      <option value="3">REACT</option>
                      <option value="4">VUE</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">채용 인원</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">면접 채용 인원을 입력해 주세요.</p>
                  <div class="input-group input-group-merge col-xl-3 px-0">
                    <input class="form-control interview-peoplenum" type="number" value="1" id="example-number-input">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">면접 방식</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">면접 방식을 선택해 주세요.</p>
                  <div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="interview-method1" name="interview-method" class="custom-control-input" checked value="온라인">
                      <label class="custom-control-label" for="interview-method1">온라인</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="interview-method2" name="interview-method" class="custom-control-input" value="오프라인">
                      <label class="custom-control-label" for="interview-method2">오프라인</label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-form-label form-control-label">본인 인증</label>
                  <label style="color: tomato">*</label>
                  <p class="text-muted" style="font-size: small">본인인증 방식을 선택해 주세요.</p>
                  <div class="input-group input-group-merge interview-authentication">
                    <label class="custom-toggle authToggleBtn">
                      <input type="checkbox" value="on">
                      <span class="custom-toggle-slider rounded-circle" data-label-off="No" data-label-on="Yes"></span>
                    </label>
                    <div class="custom-control custom-checkbox" style="margin: 0px 2px 0px 4px;">
                      <input type="checkbox" class="custom-control-input" id="authMethod1" value="이메일 인증" disabled>
                      <label class="custom-control-label" for="authMethod1">이메일 인증</label>
                    </div>
                    <div class="custom-control custom-checkbox" style="margin: 0px 2px 0px 4px;">
                      <input type="checkbox" class="custom-control-input" id="authMethod2" value="SMS 인증" disabled>
                      <label class="custom-control-label" for="authMethod2">SMS 인증</label>
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
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="assets/vendor/select2/dist/js/select2.min.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
<script>

	$('.interview-authentication .authToggleBtn input[type=checkbox]').on('change', function() {
		const currentStatus = $('.interview-authentication .authToggleBtn input[type=checkbox]:checked').val();
		
		if (currentStatus === 'on') {
	 		$('#authMethod1').prop('disabled', false);
	 		$('#authMethod2').prop('disabled', false);
		} else {
	 		$('#authMethod1').prop('disabled', true);
	 		$('#authMethod2').prop('disabled', true);
		}
	});


	$('#btnRegist').on('click', function() {
		 const project_no = '${project_no}';
		 const interview_title = $('.interview-title').val();
		 const interview_hire_shape = $('input[name=interviewForm]:checked').val();
		 const interview_division = $('input[name=interviewDivision]:checked').val();
		 let interview_tech = $('.interview-tech').select2('val');
		 const interview_peoplenum = $('.interview-peoplenum').val();
		 const interview_method = $('input[name=interview-method]:checked').val();
		 const status_auth = $('.interview-authentication .authToggleBtn input[type=checkbox]:checked').val();
		 const email_auth = $('#authMethod1:checked').val();
		 const SMS_auth = $('#authMethod2:checked').val();
		 
		 if (interview_title == '') {
			 $.notify({
					// options
					message: '공고명을 입력해주세요!' 
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

		 if (status_auth == 'on' && email_auth == undefined && SMS_auth == undefined) {
			 $.notify({
					// options
					message: '본인 인증 방식을 선택해주세요.' 
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
		 
		 let interview_authentication = '';
		 if (status_auth == undefined) {
			 interview_authentication == '없음';
		 } else {
			 if (email_auth != undefined && SMS_auth == undefined) {
				 interview_authentication = email_auth;
			 } else if (email_auth == undefined && SMS_auth != undefined) {
				 interview_authentication = SMS_auth;
			 } else if (email_auth != undefined && SMS_auth != undefined) {
				 interview_authentication = email_auth + ',' + SMS_auth;
			 }
		 }
		 
		 let interview_tech_txt = '';
		 $.each(interview_tech, function(index, item) {
			 interview_tech_txt += item + ',';
		 });
		 interview_tech_txt = interview_tech_txt.substr(0, interview_tech_txt.length - 1);
		 
	 	const $interview_title_ipt = $('<input type="hidden" name="interview_title" value= "' + interview_title + '" >');
		const $interview_hire_shape_ipt = $('<input type="hidden" name="interview_hire_shape" value= "' + interview_hire_shape + '" >');
		const $interview_division_ipt = $('<input type="hidden" name="interview_division" value= "' + interview_division + '" >');
		const $interview_tech_txt_ipt = $('<input type="hidden" name="interview_tech" value= "' + interview_tech_txt + '" >');
		const $interview_peoplenum_ipt = $('<input type="hidden" name="interview_peoplenum" value= "' + interview_peoplenum + '" >');
		const $interview_method_ipt = $('<input type="hidden" name="interview_method" value= "' + interview_method + '" >');
		const $interview_authentication_ipt = $('<input type="hidden" name="interview_authentication" value= "' + interview_authentication + '" >');
	  	
	  	$('form[name=interviewForm_1]').append($interview_title_ipt);
	  	$('form[name=interviewForm_1]').append($interview_hire_shape_ipt);
	  	$('form[name=interviewForm_1]').append($interview_division_ipt);
	  	$('form[name=interviewForm_1]').append($interview_tech_txt_ipt);
	  	$('form[name=interviewForm_1]').append($interview_peoplenum_ipt);
	  	$('form[name=interviewForm_1]').append($interview_method_ipt);
	  	$('form[name=interviewForm_1]').append($interview_authentication_ipt);
	  	
		
		$('form[name=interviewForm_1]').attr('action', '${pageContext.request.contextPath}/user/projectRegist/project_interview_2.do?project_no=${project_no}');
		$('form[name=interviewForm_1]').submit(); 
	
	})
</script>
	