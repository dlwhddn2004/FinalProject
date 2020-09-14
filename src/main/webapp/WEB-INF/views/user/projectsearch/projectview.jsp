<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<div class="row">
	<div class="col-md-8">
		<div class="card-wrapper">
			<!-- Custom form validation -->
			<div class="card">
				<!-- Card header -->
				<div class="card-header">
					<h3 class="mb-0">프로젝트 상세보기</h3>
				</div>
				<!-- Card body -->
				<div class="card-body">
					<div class="row">
						<div>
							<div style="margin: 0px 20px 10px 0px;">
								<span class="badge badge-lg badge-success">모집 중</span> 
								<span class="badge badge-lg badge-default">NEW</span>
							</div>
							<div style="margin: 0px 20px 10px 0px;">
								<h3 class="mb-0" style="font-size: 2em;">${projectInfo.project_title}</h3>
							</div>
							<div>
								<span class="badge badge-md badge-info">${projectInfo.project_processstatus }</span>
							</div>
						</div>
					</div>
					<hr />
					<form class="needs-validation" novalidate>
						<div class="form-row" style="display: flex; justify-content: space-around;">
							<div class="col-md-5 mb-2" align="center"
								style="margin: 15px 25px 15px 0px; padding: 20px; border: 1.5px solid #CEE3F6; border-radius: 1em;">
								<i class="fas fa-won-sign"></i> <span style="margin: 0px 40px 0px 0px;">예상 금액</span><span
									class="mb-0"
									style="font-weight: bolder; font-size: 1.2em; ">${projectInfo.project_budget }원</span>
							</div>
							<div class="col-md-3 mb-2" align="center"
								style="margin: 15px 25px 15px 0px; padding: 20px; border: 1.5px solid #CEE3F6; border-radius: 1em;">
								<i class="far fa-clock"></i> <span style="margin: 0px 40px 0px 0px;">예상 기간</span> <span
									class="mb-0"
									style="font-weight: bolder; font-size: 1.2em;">${projectInfo.project_duration }일
								</span>
							</div>
							<div class="col-md-3 mb-2" align="center"
								style="margin: 15px 25px 15px 0px; padding: 20px; border: 1.5px solid #CEE3F6; border-radius: 1em;">
								<i class="fas fa-user"></i> <span style="margin: 0px 40px 0px 0px;">지원자 수</span> <span
									class="mb-0"
									style="font-weight: bolder; font-size: 1.2em;">${projectInfo4 }명
								</span>
							</div>
							<span class="col-md-11 mb-6"
								style="text-align: center; background-color: #EFF5FB; border: 1.5px solid #EFF5FB;">
								<i class="fas fa-exclamation-circle">&nbsp;&nbsp;</i>금액 및 기간 조율이
								가능한 프로젝트입니다.
							</span>
						</div>					
						<div>
							<div class="row">
								<div class="col-md-12"  style="display:flex; font-size : 1.2em;">
									<div style="width: 18px; height: 18px; margin: 0px 10px 0px 0px;">
										<i class="far fa-clock"></i>
									</div>
									<div style="margin: 0px 20px 0px 0px;">
										<span>모집 마감일</span> 
									</div>
									<div>
										<span class="mb-0" style="font-weight: bolder; ">${projectInfo.project_enddate }일</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12" style="display:flex; font-size : 1.2em;">
									<div style="width: 18px; height: 18px; margin: 0px 10px 0px 0px;">
										<i class="far fa-calendar"></i>
									</div>
									<div style="margin: 0px 20px 0px 0px;">
										<span>예상 시작일</span> 
									</div>
									<div>
										<span class="mb-0" style="font-weight: bolder;">${projectInfo.project_startdate }일</span>
									</div>
								</div>
							</div>							
							<div class="row">
								<div class="col-md-12" style="display:flex; font-size : 1.2em;">
									<div style="width: 18px; height: 18px; margin: 0px 10px 0px 0px;">
									<i class="fas fa-backspace"></i>
									</div>
									<div style="margin: 0px 34px 0px 0px;">
									<span>진행 분류</span>  
								</div>
								<div>
									<span class="mb-0" style="font-weight: bolder;">${projectInfo.project_processcategory }</span>
								</div>
							</div>
							</div>							
							<div class="row">
								<div class="col-md-12" style="display:flex; font-size : 1.2em;">
									<div style="width: 18px; height: 18px; margin: 0px 10px 0px 0px;">
									<i class="far fa-file"></i>
									</div>
									<div style="margin: 0px 34px 0px 0px;">
									<span>기획 상태</span>  
								</div>
								<div>
									<span class="mb-0" style="font-weight: bolder;">${projectInfo.project_readystatus }</span>
								</div>
							</div>
							</div>							
							<div class="row">
								<div class="col-md-12" style="display:flex; font-size : 1.2em;">
									<div style="width: 18px; height: 18px; margin: 0px 10px 0px 0px;">
									<i class="fas fa-cog"></i>
									</div>
									<div style="margin: 0px 16px 0px 0px;">
									<span>매니징 경험</span>  
								</div>
								<div>
									<span class="mb-0" style="font-weight: bolder; ">${projectInfo.project_managementexperience }</span>
								</div>
							</div>
							</div>
							<div class="row">
								<div class="col-md-12" style="display:flex; font-size : 1.2em;">
									<div style="width: 18px; height: 18px; margin: 0px 10px 0px 0px;">
									<i class="far fa-building"></i>
									</div>
									<div style="margin: 0px 34px 0px 0px;">
									<span>인력 상황</span>  
								</div>
								<div>
									<span class="mb-0" style="font-weight: bolder;">${projectInfo.project_manpower }</span>
								</div>
							</div>
							</div>
						</div>
						<hr />
						<div>
							<h3 class="mb-0" style="font-size: 1.2em;">업무 내용</h3>
							<br>
							<lable>프로젝트 우선순위:</lable>
							<br> <span>- ${projectInfo.project_priority }</span><br>
							<br>
							<br>
							<lable>현재 준비 상황:</lable>
							<br> <span>- ${projectInfo.project_currentstatus }</span><br>
							<br>
							<br>
							<lable>기타 참고 사항 /유의 사항:</lable>
							<br> <span>- ${projectInfo.project_reference }</span><br>
							<br>
							<br>
							<lable>관련 기술:</lable>
							<span class="badge badge-primary">
								${projectInfo.tech_name }</span><br>
						</div>
						<hr/>
						<h3 class="mb-0" style="font-size: 1.2em;">미팅</h3>
						<br>
						<lable>지원자 필수 조건</lable>
						<span style="font-weight: bolder; margin-left: 30px;">
						${projectInfo.project_essentialrequirements }</span><br>
						<hr>			
						<h3 class="mb-0" style="font-size: 1.2em;">미팅</h3>
						<br>
						<lable>사전 미팅 방식</lable>
						<span style="font-weight: bolder; margin-left: 47px;">
							${projectInfo.project_premeeting }</span><br>
						<br>
						<lable>진행 중 미팅</lable>
						<span style="font-weight: bolder; margin-left: 63px;">
							${projectInfo.project_proceedingmeeting }</span><br>
						<br>
						<lable>클라이언트 위치</lable>
						<span style="font-weight: bolder; margin-left: 35px;">
							${projectInfo.project_clientlocation }</span><br>
						<br>
						<button style="float:right;" class="btn btn-primary btn-submit" id="support" type="button">지원 신청</button>
				</div>
				<div class="form-row">
					<div class="col-md-6 mb-3"></div>
					<div class="col-md-3 mb-3"></div>
					<div class="col-md-3 mb-3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="card card-profile">
			<img src="../../assets/img/theme/img-1-1000x600.jpg"
				alt="Image placeholder" class="card-img-top">
			<div class="row justify-content-center">
				<div class="col-lg-3 order-lg-2">
					<div class="card-profile-image">
						<a href="#"> <img class="rounded-circle"
							src="/${profileInfo.profile_savename}">

						</a>
					</div>
				</div>
			</div>
			<div
				class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
				<div class="d-flex justify-content-between"></div>
			</div>
			<div class="card-body pt-0">
				<div class="row">
					<div class="col">
						<div class="text-center">
							<br>
							<br>
							<h5 class="h3">
								<span class="font-weight-light"> <span
									class="badge-md badge-pill badge-primary">파트너스</span></span><br>
								<br> ${projectInfo.mem_id }
							</h5>
						</div>
						<div class="card-profile-stats d-flex justify-content-center">

							<div>
								<span class="heading">${projectInfo3}</span> <span
									class="description">프로젝트 등록</span>
							</div>
							<div>

								<span class="heading">${projectInfo1}</span> <span
									class="description">진행 중인 프로젝트</span>
							</div>
							<div>
								<span class="heading">${projectInfo2}</span> <span
									class="description">완료한 프로젝트</span>
							</div>
						</div>
					</div>
				</div>

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

<!-- Argon JS -->
<script
	src="${pageContext.request.contextPath }/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath }/assets/js/demo.min.js"></script>

<script>
	$('#support').on('click', function() {
		if (${empty MEMBER_LOGININFO}) {
			Swal.fire(
			  'WARNING',
			  '해당 기능은 로그인 후 이용할 수 있습니다.',
			  'warning'
			)
			
			return;
		}
		
		if (${MEMBER_LOGININFO.category_no != '2'}) {
			Swal.fire(
			  'WARNING',
			  '해당 기능은 디벨로퍼만 이용 가능합니다.',
			  'warning'
			)
			
			return;
		}
		
		$.ajax({
			url: '/CONNECTOR/user/projectApply/chkDuplicate.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	project_no: '${param.project_no }',
		    	mem_id: '${MEMBER_LOGININFO.mem_id }'
		    },
		    success: function (data) {
		    	if (!data) {
					Swal.fire(
					  'WARNING',
					  '이미 신청한 프로젝트입니다.',
					  'warning'
					)
		    	} else {
		    		location.href='${pageContext.request.contextPath}/user/interview/projectApplyForm.do?project_no=${param.project_no}&mem_id=${MEMBER_LOGININFO.mem_id}';
		    	}
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
		});
	});
</script>