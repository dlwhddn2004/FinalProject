<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<!-- Favicon -->

<!-- Sweet Alerts -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.css">
<style>
</style>
</head>
<body>
		<!-- Main content -->
		<div class="row">
			<div class="col-md-9">
				<div class="card">
					<div class="card-header">
							<h3 class="mb-0">계좌 등록</h3>
					</div>
					<div class="card-body" >
					<form name=memberForm>
						<h6 class="heading-small text-muted mb-4">* 프로젝트 대금을 지급받을 계좌 정보를 등록해주세요.</h6>
						<div class="pl-lg-4">
							<div class="row">
								<div class="col-lg-4" style="width: 100px;  margin: 0 auto;">
								   <img src="${pageContext.request.contextPath}/assets/img/theme/p2.png" >
									<div class="col-lg-6">
									<div class="form-group">
										<h6 class="heading-small text-muted mb-2">계좌 등록</h6>
										<label class="form-control-label" for="input-username">은행명</label>

										<select name="mem_bank" class="form-control">
											<option value="은행선택">은행선택</option>
											<option value="한국산업은행">한국산업은행</option>
											<option value="기업은행">기업은행</option>
											<option value="국민은행">국민은행</option>
											<option value="우리은행">우리은행</option>
											<option value="신한은행">신한은행</option>
											<option value="하나은행">하나은행</option>
											<option value="농협">농협</option>
											<option value="단위농협">단위농협</option>
											<option value="SC은행">SC은행</option>
											<option value="외환은행">외환은행</option>
											<option value="한국씨티은행">한국씨티은행</option>
											<option value="우체국">우체국</option>
											<option value="경남은행">경남은행</option>
											<option value="광주은행">광주은행</option>
											<option value="대구은행">대구은행</option>
										</select>
									</div>
								</div>

				<div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">예금주</label>
                   <input type="hidden" name="mem_id" class="form-control" value="${memberInfo.mem_id}" placeholder="Username"> 
                   
                       
                        <input type="text" id="mem_bankname" class="form-control"   value="${memberInfo.mem_bankname}"  name="mem_bankname">
                      </div>
                    </div>
						<div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">계좌 번호</label>
                        <input type="text" id="input-first-name" value="${memberInfo.mem_bankno}" name="mem_bankno" id="mem_bankno2"class="form-control" placeholder="" value="Lucky">
                      <label class="form-control-label" for="input-username">'-'를 제외하고 입력하시오</label>
                      </div>                     
                    </div>
							</div>
							
															
							</div>
							<button type="submit" class="btn btn-primary btn-write"
										id="btn3" style="float: right";>변경</button>
						</div>	
						</form>
						<div class="form-row">
							<div class="col-md-6 mb-3"></div>
							<div class="col-md-3 mb-3"></div>
							<div class="col-md-3 mb-3"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card card-profile">					
					<br>
					<h3 style="margin : 0px 0px 0px 20px;">파트너스</h3>
						<hr/>
						<div class="card-profile-image" style="margin : 50px 0px 0px 0px">
						<img class="rounded-circle" 
							src="/${profileInfo.profile_savename}">				
					</div>
					<div
				class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
				<div class="d-flex justify-content-between"></div>
			</div>
					<div class="text-center">
							<br>
							<br>
							<h5 class="h3">
								<span class="font-weight-light"> <span
									class="badge-md badge-pill badge-primary">파트너스</span></span><br>
								<br> ${memberInfo.mem_id }
								<br> ${memberInfo.mem_mail }
							</h5>
						</div>
					<div class="card-body pt-0">
						<div class="row">
							<div class="col">
								<div class="text-center">
									<br> <br>
									<h5 class="h3"></h5>
								</div>
								<div class="card-profile-stats d-flex justify-content-center">


								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="col-md-13">
					<div class="card card-profile">											
						<div class="card-body pt-0">
								<div style="margin : 10px 0px 10px 0px;">
										<li style="list-style-type: none;  display: block; color: #000;  padding: 20px 16px; color: white;"><a href="${pageContext.request.contextPath}/user/myprofile/myprofile.do?mem_id=${MEMBER_LOGININFO.mem_id}">기본정보수정</a></li>
									<li style="list-style-type: none;  display: block; color: #000;  padding: 20px 16px; color: white; "><a style=" padding: 20px 16px; background-color: #819FF7; color: white; display: block; " class="active" href="${pageContext.request.contextPath}/user/myprofile/myprofilebank.do">계좌 관리</a></li>
										<li style="list-style-type: none;  display: block; color: #000;  padding: 20px 16px; color: white;"><a href="${pageContext.request.contextPath}/user/myprofile/myprofiledelete.do">회원 탈퇴</a></li>
								
									</div>
						</div>


					</div>
				</div>
			</div>


		</div>

	<!-- Argon Scripts -->
	<!-- Core -->
	<script
		src="${pageContext.request.contextPath }/assets/vendor/jquery/dist/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/vendor/js-cookie/js.cookie.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
	<!-- Optional JS -->
	<script
		src="${pageContext.request.contextPath }/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/vendor/datatables.net-select/js/dataTables.select.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<!-- Argon JS -->
	<script
		src="${pageContext.request.contextPath }/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath }/assets/js/demo.min.js"></script>
	<script>
	$(function() {
		
		$('form[name=memberForm]')
				.submit(
						function() {
							$(this)
									.attr('action',
											'${pageContext.request.contextPath}/user/myprofile/updateMemberInfo.do');
						});
	
	});

	
</script>
