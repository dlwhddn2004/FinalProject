<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" type="image/png">
<!-- Fonts -->
<link rel="stylesheet" 	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/nucleo/css/nucleo.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
<!-- Argon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

<style>
	#image-image-Form .avatar-wrapper{
		position: relative;
		height: 200px;
		width: 200px;
		margin: 50px auto;
		border-radius: 50%;
		overflow: hidden;
		box-shadow: 1px 1px 15px -5px black;
		transition: all .3s ease;
	}
	#image-image-Form .avatar-wrapper:hover{
		transform: scale(1.05);
		cursor: pointer;
	}
	#image-image-Form .avatar-wrapper:hover .profile-pic{
		opacity: .5;
	}
	#image-image-Form .profile-pic {
	    height: 100%;
		width: 100%;
		transition: all .3s ease;
	}
	#image-image-Form .profile-pic:after{
		font-family: "Font Awesome 5 Free";
		content: "\f007";
		top: 0; left: 0;
		width: 100%;
		height: 100%;
		position: absolute;
		font-size: 120px;
		background: #ecf0f1;
		color: #34495e;
		text-align: center;
		cursor: pointer;
	}
	#image-image-Form .upload-button {
		position: absolute;
		top: 0; left: 0;
		height: 100%;
		width: 100%;
	}
	#image-image-Form .upload-button .fa-arrow-circle-up{
		position: absolute;
		font-size: 234px;
		top: -17px;
		left: -17px;
		text-align: center;
		opacity: 0;
		transition: all .3s ease;
		color: #34495e;
	}
	#image-image-Form .upload-button:hover .fa-arrow-circle-up{
		opacity: .9;
	}
	
	

</style>
</head>
<body>

	
	
	
	
	   <div class="row">
            <div class="col-md-12">
                <!-- Image-Text card -->
                <div class="card mainDiv" style="height: 600px;">
                    <div class="row">
                        <div class="col-md-12"">
                        	<img class="img-center img-fluid testtesttesttest" alt="" src="" style="width: 1620px; height: 610px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
	
	<form action="${pageContext.request.contextPath }/user/portfolio/insertportfolio.do" name="portFolioForm" method="POST" 
	enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-8">
				<div class="card">
					<!-- title -->
					<div class="card-header">
						<h2 class="mb-0">포트폴리오 기본 정보 등록</h2>
						<small class="text-muted">(*)표시가 있는 항목은 필수 항목입니다.</small>
						<input type="hidden" name="mem_id" value="${MEMBER_LOGININFO.mem_id }">
					</div>
					<div class="card-body">
						<div class="form-group">
							<label class="col-form-label form-control-label">포트폴리오 제목</label>
							<label style="color: tomato">*</label>
							<p class="text-muted" style="font-size: small">포트폴리오 제목을 30자
								이내로 적어주세요.</p>
							<div class="">
								<input class="form-control" type="search" name="portfolio_name"
									placeholder="ex) PortFolio Title" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-form-label form-control-label">사용 기술 정보</label>
							<label style="color: tomato">*</label>
							<p class="text-muted" style="font-size: small">포트폴리오에 사용한 기술을
								선택해 주세요</p>
							<div>
								<img
									src="${pageContext.request.contextPath}/assets/img/theme/angular.jpg"
									style="width: 48px; height: 48px;">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="portfolio_technologies1"
										name="portfolio_technologies_ipt" class="custom-control-input"
										value="1" checked="checked"> <label
										class="custom-control-label" for="portfolio_technologies1">angular</label>
								</div>
								<img
									src="${pageContext.request.contextPath}/assets/img/theme/bootstrap.jpg"
									style="width: 48px; height: 48px;">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="portfolio_technologies2"
										name="portfolio_technologies_ipt" class="custom-control-input"
										value="2"> <label class="custom-control-label"
										for="portfolio_technologies2">bootstrap</label>
								</div>
								<img
									src="${pageContext.request.contextPath}/assets/img/theme/react.jpg"
									style="width: 48px; height: 48px;">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="portfolio_technologies3"
										name="portfolio_technologies_ipt" class="custom-control-input"
										value="3"> <label class="custom-control-label"
										for="portfolio_technologies3">react</label>
								</div>
								<img
									src="${pageContext.request.contextPath}/assets/img/theme/vue.jpg"
									style="width: 48px; height: 48px;">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="portfolio_technologies4"
										name="portfolio_technologies_ipt" class="custom-control-input"
										value="4"> <label class="custom-control-label"
										for="portfolio_technologies4">vue</label>

								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="progress-wrapper">
								<div class="progress-info">
									<div class="progress-label">
										<span class="badge-lg badge-default">참여율</span>
									</div>
								</div>
								<div class="input-slider-container">
									<div id="input-slider" class="input-slider"
										data-range-value-min="0" data-range-value-max="100"></div>
									<div class="row mt-3">
										<div class="col-6">
											<span id="input-slider-value" class="range-slider-value portfolio_participationrate"
												data-range-value-low="0"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-form-label form-control-label">포트폴리오 작업
								일자</label> <label style="color: tomato">*</label>
							<p class="text-muted" style="font-size: small">포트폴리오 시작 일과 마감
								일을 선택해 주세요.</p>
							<div class="row input-daterange datepicker align-items-center">
								<div class="col">
									<div class="form-group">
										<label class="form-control-label">시작 날짜</label> <input
											class="form-control" placeholder="Start date" type="text"
											 name="portfolio_startdate" required>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label class="form-control-label">마감 날짜</label> <input
											class="form-control" placeholder="End date" type="text"
											 name="portfolio_enddate" required>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-form-label form-control-label">URL 링크</label> <label
								style="color: tomato">*</label>
							<p class="text-muted" style="font-size: small">포트폴리오에 등록된
								URL링크를 작성해주세요.</p>
							<div class="input-group mb-4">
								<div class="input-group-prepend">
									<button class="btn btn-primary" type="button"
										id="button-addon1">Url</button>
								</div>
								<input type="text" class="form-control"
									placeholder="http://Url.link"
									aria-label="Example text with button addon"
									aria-describedby="button-addon1" name="portfolio_url"  required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-form-label form-control-label">포트 폴리오
								설명</label> <label style="color: tomato">*</label>
							<p class="text-muted" style="font-size: small">간단한 포트폴리오에 대한
								설명을 작성해주세요.</p>
						</div>
						<div id="editor" style="height: 250px;"
							name="portfolio_description"></div>

						<div class="form-group"
							style="display: flex; justify-content: flex-end; margin: 10px 0px 0px 0px;">
							<button class="btn btn-icon btn-primary insertBtn" type="button">
								<span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
								<span class="btn-inner--text">등록</span>
							</button>
							<button class="btn btn-icon btn-primary listBtn" type="button">
								<span class="btn-inner--icon"><i class="fas fa-list"></i></span>
								<span class="btn-inner--text">목록</span>
							</button>
						</div>

					</div>
				</div>
			</div>

			<div class="col-md-4">
<!-- 			작업 중! -->
				<div class="row">
					<div class="col-md-12">
						<div class="card" style="height: 435px;">
							<div class="card-header">
								<h2 class="mb-0">1. 대표 포트폴리오 사진 등록</h2>
								<label class="col-form-label form-control-label">대표
									포트폴리오 등록</label> <label style="color: tomato">*</label>
								<p class="text-muted" style="font-size: small">대표 포트폴리오는 반드시
									첫번째로 등록해주세요</p>
							</div>
							
							<div id="image-image-Form">
								<div class="avatar-wrapper">
									<img class="profile-pic main-profile" src="" />
									<div class="upload-button main-profile-upload-button">
										<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
									</div>
									<input class="file-upload file-upload-input1" type="file" accept="image/*" name="files"/>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card" style="height: 435px;">
							<div class="card-header">
								<h2 class="mb-0">2. 포트폴리오 사진 등록</h2>
								<label class="col-form-label form-control-label">포트폴리오
									등록</label>
								<p class="text-muted" style="font-size: small">포트폴리오를 등록해주세요</p>
							</div>
							<div id="image-image-Form">
								<div class="avatar-wrapper">
									<img class="profile-pic sub-profile1" src="" />
									<div class="upload-button sub-profile-upload-button1">
										<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
									</div>
									<input class="file-upload file-upload-input2" type="file" accept="image/*" name="files"/>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card" style="height: 435px;">
							<div class="card-header">
								<h2 class="mb-0">3. 포트폴리오 사진 등록</h2>
								<label class="col-form-label form-control-label">포트폴리오
									등록</label>
								<p class="text-muted" style="font-size: small">포트폴리오를 등록해주세요</p>
							</div>
							<div id="image-image-Form">
								<div class="avatar-wrapper">
									<img class="profile-pic sub-profile2" src="" />
									<div class="upload-button sub-profile-upload-button2">
										<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
									</div>
									<input class="file-upload file-upload-input3" type="file" accept="image/*" name="files"/>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</form>

	<script
		src="${pageContext.request.contextPath}/assets/vendor/jquery/dist/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/js-cookie/js.cookie.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
	<!-- Optional JS -->
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datetimepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/nouislider/distribute/nouislider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/dropzone/dist/min/dropzone.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
	
	<script type="text/javascript">
	$('.testtesttesttest').hide();
		
		$(function() {
			$('#datetimepicker1').datetimepicker({
				icons : {
					time : "fa fa-clock",
					date : "fa fa-calendar-day",
					up : "fa fa-chevron-up",
					down : "fa fa-chevron-down",
					previous : 'fa fa-chevron-left',
					next : 'fa fa-chevron-right',
					today : 'fa fa-screenshot',
					clear : 'fa fa-trash',
					close : 'fa fa-remove'
				}
			});
			
			// Quill Text Editor Initialize 
			const quill = new Quill('#editor', {
				theme : 'snow',
				placeholder : '<포트폴리오>\n' + '예시) 포트폴리오 사이트의 목적, 간단한 소개 등\n'
			});
			
		//등록 버튼
			$('.insertBtn').on('click',function(){
				//포트폴리오 이름
				const portfolio_name = $('input[name=portfolio_name]').val();
				// 포트폴리오 시작일
				const portfolio_startdate=$('input[name=portfolio_startdate]').val();
				//포트폴리오 마감일
				const portfolio_enddate=$('input[name=portfolio_enddate]').val();
				//참여율 값
				const input_slider_value_ipt = $('.portfolio_participationrate').text();
				// 사용한 기술 채크 값
				const portfolio_technologies_ipt = $('input[name="portfolio_technologies_ipt"]:checked').val();
				//url 링크
				const portfolio_url_ipt = $('input[name="portfolio_url"]').val();
				// editor
				const portfolio_description_ipt = quill.root.innerHTML;
				
				
				
				if (portfolio_name == "") {
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
				//  시작 및 마감 날짜!
				if (portfolio_startdate == "" || portfolio_enddate == "" ) {
					$.notify({
						// options
						message: '시작날짜 및 마감날짜를 입력해주세요!' 
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
				
				
				if(portfolio_url_ipt == ""){
					$.notify({
						// options
						message: '포트폴리오 URL을 입력해주세요!' 
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
				
				// 내용을 입력하지 않았을 때!
				const text = quill.getText();
				
				if (text.length == 1) {
					$.notify({
						// options
						message: '내용을 입력해주세요!' 
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
				//작업중
				// 포트폴리오 내용
				const $portfolio_description = '<input type="hidden" name="portfolio_description" value="' +portfolio_description_ipt +'">';
				// 포트폴리오 참여율
				const $portfolio_participationrate =  '<input type="hidden" name="portfolio_participationrate" value="' + input_slider_value_ipt + '">';
				// 포트폴리오 사용한 기술 체크 값
				const $portfolio_technologies = '<input type="hidden" name="portfolio_technologies" value="' + portfolio_technologies_ipt + '">';
				
				$('form[name=portFolioForm]').append($portfolio_description);
				$('form[name=portFolioForm]').append($portfolio_participationrate);
				$('form[name=portFolioForm]').append($portfolio_technologies);
				
				$('form[name=portFolioForm]').submit();
			});
			
		//목록 버튼
			$('.listBtn').on('click', function(){
				location.href= '${pageContext.request.contextPath}/user/portfolio/portfolioList.do';
			});
		
		
		});
		

		$(document).ready(
				function() {

					var readURL = function(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();

							reader.onload = function(e) {

								$('#image-image-Form .main-profile').attr('src',e.target.result);
								$('.testtesttesttest').show();
								$('.testtesttesttest').attr('src',e.target.result);
							}

							reader.readAsDataURL(input.files[0]);
						}
					}
					
					var readURL2 = function(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();

							reader.onload = function(e) {

								$('#image-image-Form .sub-profile1').attr('src',e.target.result);
							}

							reader.readAsDataURL(input.files[0]);
						}
					}
					
					var readURL3 = function(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();

							reader.onload = function(e) {

								$('#image-image-Form .sub-profile2').attr('src',e.target.result);
							}

							reader.readAsDataURL(input.files[0]);
						}
					}

					
					
					$(".file-upload-input1").on('change', function() {
						readURL(this);
					});
					
					$(".file-upload-input2").on('change', function() {
						readURL2(this);
					});
					
					$(".file-upload-input3").on('change', function() {
						readURL3(this);
					});
					

					// 메인 사진 등록 버튼 이벤트
					$(".main-profile-upload-button").on('click', function() {
						$(".file-upload-input1").click();
					});
					// 서브사진 등록 1
					$(".sub-profile-upload-button1").on('click', function() {
						$(".file-upload-input2").click();
					});
					// 서즈 사진 등록 2
					$(".sub-profile-upload-button2").on('click', function() {
						$(".file-upload-input3").click();
					});
				});
		
		
		
		
	</script>


	<!-- Argon JS -->
	<script
		src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
</body>
</html>