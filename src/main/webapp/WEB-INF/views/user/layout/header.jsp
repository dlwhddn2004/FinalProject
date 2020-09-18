<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
=========================================================
* Argon Dashboard PRO - v1.2.0
=========================================================
* Product Page: https://www.creative-tim.com/product/argon-dashboard-pro
* Copyright  Creative Tim (http://www.creative-tim.com)
* Coded by www.creative-tim.com
=========================================================
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!-- <!DOCTYPE html> -->
<!-- <html> -->

<!-- <head> -->
<!-- 	<meta charset="utf-8"> -->
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<!-- 	<meta name="description" content="Start your development with a Dashboard for Bootstrap 4."> -->
<!-- 	<meta name="author" content="Creative Tim"> -->
<!-- 	<title>CONNECTOR</title> -->
	<!-- Favicon -->
	<link rel="icon" href="${pageContext.request.contextPath }/assets/img/brand/favicon.png" type="image/png">
	<!-- Fonts -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
	<!-- Icons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/vendor/nucleo/css/nucleo.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
	<!-- Page plugins -->
    <!-- Notify -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css/animate.min.css">
    <!-- Sweet Alerts -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.css">
	<!-- Argon CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/argon.css?v=1.2.0" type="text/css">
<!-- </head> -->

<!-- <body> -->
	<!-- Header -->
    <!-- Header -->
    <div class="header bg-primary pb-6">
      <div class="container-fluid">
        <div class="header-body">
          <div class="row align-items-center py-4">
            <div class="col-lg-6 col-7">
              <h6 class="h2 text-white d-inline-block mb-0">${breadcrumb_title }</h6>
              <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                  <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                  <c:if test="${!empty breadcrumb_first }">
                  	<li class="breadcrumb-item"><a href="${breadcrumb_first_url }">${breadcrumb_first }</a></li>
                  </c:if>
                  <c:if test="${!empty breadcrumb_second }">
                  	<li class="breadcrumb-item active" aria-current="page">${breadcrumb_second }</li>
               	  </c:if>
                </ol>
              </nav>
            </div>
            <div class="col-lg-6 col-5 text-right">
              <a href="#" class="btn btn-sm btn-neutral">New</a>
              <a href="#" class="btn btn-sm btn-neutral">Filters</a>
            </div>
          </div>
          <!-- Card stats -->
          <div class="row">
            <div class="col-xl-2 col-md-4">
              <div class="card card-stats">
                <!-- Card body -->
                <div class="card-body card-professional">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">전문성</h5>
                      <span class="h2 font-weight-bold mb-0"></span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-red text-white rounded-circle shadow">
                        <i class="ni ni-active-40"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-sm">
                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i></span>
                    <span class="text-nowrap">Since last score</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-4">
              <div class="card card-stats">
                <!-- Card body -->
                <div class="card-body card-communication">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">의사 소통</h5>
                      <span class="h2 font-weight-bold mb-0"></span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                        <i class="ni ni-chart-pie-35"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-sm">
                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i></span>
                    <span class="text-nowrap">Since last score</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-2 col-md-4">
              <div class="card card-stats">
                <!-- Card body -->
                <div class="card-body card-positiveness">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">긍정도</h5>
                      <span class="h2 font-weight-bold mb-0"></span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-green text-white rounded-circle shadow">
                        <i class="ni ni-money-coins"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-sm">
                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i></span>
                    <span class="text-nowrap">Since last score</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-4">
              <div class="card card-stats">
                <!-- Card body -->
                <div class="card-body card-satisfaction">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">만족도</h5>
                      <span class="h2 font-weight-bold mb-0"></span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-info text-white rounded-circle shadow">
                        <i class="ni ni-chart-bar-32"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-sm">
                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i></span>
                    <span class="text-nowrap">Since last score</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-2 col-md-4">
              <div class="card card-stats">
                <!-- Card body -->
                <div class="card-body card-compliance">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">협동심</h5>
                      <span class="h2 font-weight-bold mb-0"></span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-info text-white rounded-circle shadow">
                        <i class="ni ni-chart-bar-32"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-sm">
                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i></span>
                    <span class="text-nowrap">Since last score</span>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Argon Scripts -->
	<!-- Core -->
	<script src="${pageContext.request.contextPath }/assets/vendor/jquery/dist/jquery.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
	<!-- My JavaScript -->
	<script type="text/javascript">
		if (${!empty param.message}) {
			Swal.fire(
			  '${param.taskResult}',
			  '${param.message}',
			  '${param.taskResult}'
			)
		}
		if (${!empty message}) {
			Swal.fire(
			  '${taskResult}',
			  '${message}',
			  '${taskResult}'
			)
		}
		
		loadRate();
		
// 		playAlert = setInterval(function() {
// 			loadRate();
// 		}, 30000);
		
		function loadRate() {
			$.ajax({
				type: 'POST'
				,url: '${pageContext.request.contextPath}/user/memrate/getMemRate.do'
				,dataType: 'json'
				,data: {mem_id: '${MEMBER_LOGININFO.mem_id}'}
				,success: function(result) {
					if (result.memberRateInfo == null) {
						$('.card-professional').hide();
						$('.card-communication').hide();
						$('.card-positiveness').hide();
						$('.card-satisfaction').hide();
						$('.card-compliance').hide();
					} else {
						let professional_rate = ((result.memberRateInfo.professional - result.memberRateInfo.professional_bef) / result.memberRateInfo.professional_bef) * 100;
						professional_rate = professional_rate.toFixed(2);
						$('.card-professional').find('span:eq(0)').text(result.memberRateInfo.professional + ' POINT');
						
						if (professional_rate == "NaN") {
							professional_rate = 0;
						}
						
						$('.card-professional').find('span:eq(1)').html('<i class="fa fa-arrow-up"></i> ' + professional_rate + '%');
						
						let communication_rate = ((result.memberRateInfo.communication - result.memberRateInfo.communication_bef) / result.memberRateInfo.communication_bef) * 100;
						communication_rate = communication_rate.toFixed(2);
						
						if (communication_rate == "NaN") {
							communication_rate = 0;
						}
						
						$('.card-communication').find('span:eq(0)').text(result.memberRateInfo.communication + ' POINT');
						$('.card-communication').find('span:eq(1)').html('<i class="fa fa-arrow-up"></i> ' + communication_rate + '%');
						
						let positiveness_rate = ((result.memberRateInfo.positiveness - result.memberRateInfo.positiveness_bef) / result.memberRateInfo.positiveness_bef) * 100;
						positiveness_rate = positiveness_rate.toFixed(2);
						
						if (positiveness_rate == "NaN") {
							positiveness_rate = 0;
						}
						
						$('.card-positiveness').find('span:eq(0)').text(result.memberRateInfo.positiveness + ' POINT');
						$('.card-positiveness').find('span:eq(1)').html('<i class="fa fa-arrow-up"></i> ' + positiveness_rate + '%');
						
						let satisfaction_rate = ((result.memberRateInfo.satisfaction - result.memberRateInfo.satisfaction_bef) / result.memberRateInfo.satisfaction_bef) * 100;
						satisfaction_rate = satisfaction_rate.toFixed(2);
						
						if (satisfaction_rate == "NaN") {
							satisfaction_rate = 0;
						}
						
						$('.card-satisfaction').find('span:eq(0)').text(result.memberRateInfo.satisfaction + ' POINT');
						$('.card-satisfaction').find('span:eq(1)').html('<i class="fa fa-arrow-up"></i> ' + satisfaction_rate + '%');
						
						let compliance_rate = ((result.memberRateInfo.compliance - result.memberRateInfo.compliance_bef) / result.memberRateInfo.compliance_bef) * 100;
						compliance_rate = compliance_rate.toFixed(2);
						
						if (compliance_rate == "NaN") {
							compliance_rate = 0;
						}
						
						$('.card-compliance').find('span:eq(0)').text(result.memberRateInfo.compliance + ' POINT');
						$('.card-compliance').find('span:eq(1)').html('<i class="fa fa-arrow-up"></i> ' + compliance_rate + '%');
					}
				}
	    		,error: function (xhr, err) {
			        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
			        alert("responseText: " + xhr.responseText);
			    }
			});
		}
		
		let interviewAlarmChk = false;
		chkInterviewTime = setInterval(function() {
			console.log('${interviewAttendStatus}');
			if (${interviewAttendStatus != 'Y'} && interviewAlarmChk == false) {
				interviewTimeChk();
			}
		}, 1000);

		// 면접 시간을 확인
		function interviewTimeChk() {
			if (${!empty MEMBER_LOGININFO}) {
				$.ajax({
					type: 'POST'
					,url: '${pageContext.request.contextPath}/user/interview/selectInterviewTimeChk.do'
					,dataType: 'json'
					,async: false
					,data: {
						mem_id: '${MEMBER_LOGININFO.mem_id}',
						category_no: '${MEMBER_LOGININFO.category_no}'
					}
					,success: function(data) {
						if (data.PROJECT_NO != null) {
							setSession('interviewAttendStatus', 'Y');
							interviewAlarmChk = true;
							
							Swal.fire({
								  icon: 'info',
								  title: '면접 안내',
								  text: '참여해야 할 면접이 있습니다.',
								  showCancelButton: true,
								  confirmButtonColor: '#3085d6',
								  cancelButtonColor: '#d33',
								  confirmButtonText: '참여',
								  cancelButtonText: '취소'
								}).then((result) => {
								  if (result.value == true) {
									  if (${MEMBER_LOGININFO.category_no == '1'}) {
										  location.href = '${pageContext.request.contextPath}/user/interview/interviewRTC.do?mem_id=${MEMBER_LOGININFO.mem_id}&project_no=' + data.PROJECT_NO + '&description=' + data.DESCRIPTION + '&id=' + data.ID;
									  } else {
										  location.href = '${pageContext.request.contextPath}/user/interview/interviewRTCRoom.do?mem_id=${MEMBER_LOGININFO.mem_id}&project_no=' + data.PROJECT_NO + '&description=' + data.DESCRIPTION + '&id=' + data.ID;
									  }
								  }
							});
						}
					}
		    		,error: function (xhr, err) {
		    			console.log('${pageContext.request.contextPath}/user/interview/selectInterviewTimeChk.do ERR 발생!');
				        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
				        alert("responseText: " + xhr.responseText);
				    }
				});
			}
		}
		
		function setSession(key, value) {
			$.ajax({
				type: 'POST'
				,url: '${pageContext.request.contextPath}/user/all/setSession.do'
				,dataType: 'json'
				,data: {
					key: key,
					value: value
				}
				,success: function(data) {
					console.log('setSession 성공!');
				}
	    		,error: function (xhr, err) {
	    			console.log('${pageContext.request.contextPath}/user/all/setSession.do ERR 발생!');
			        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
			        alert("responseText: " + xhr.responseText);
			    }
			});
		}
		<!-- 마이페이지 기술 숙련도-->
		alermMypage();
		function alermMypage(){
			const mem_id = "${MEMBER_LOGININFO.mem_id}";
			if(mem_id == "" && "${MEMBER_LOGININFO.category_no}" == "1" ){
				return;
			}else{
				$.ajax({
					url : "${pageContext.request.contextPath}/user/mypage/mypageTechnologiesCheck.do",
					type : "POST",
					data : {mem_id : "${MEMBER_LOGININFO.mem_id}"},
					dataType : "json",
					error : function(err){
						alert('마이페이지 기술 체크 에러');
					},
					success : function(result){
						if(result.TechnologiesCheckInfo.MYPAGE_TECHNOLOGIES == null && '${MEMBER_LOGININFO.category_no}' == '2' && '${SKILLCHECK}' =='0'){
							
							Swal.fire({
								  title: '보유하신 기술이 없습니다.',
								  text: "마이페이지에서 기술을 등록해주세요.",
								  icon: 'warning',
								  showCancelButton: true,
								  confirmButtonColor: '#3085d6',
								  cancelButtonColor: '#d33',
								  confirmButtonText: '등록',
								  cancelButtonText: '취소'
								}).then((result) => {
									  if (result.value) {
										  	const SKILLCHECK =1;
										  $.ajax({
												url : "${pageContext.request.contextPath}/user/mypage/mypageTechnologiesCheck.do",
												type : "POST",
												data : {SKILLCHECK : SKILLCHECK},
												dataType : "json",
												error : function(err){
													alert('마이페이지 기술 체크 에러');
												},
												success : function(result){
												  location.href = '${pageContext.request.contextPath}/user/portfolio/portfolioView.do?mem_id=${MEMBER_LOGININFO.mem_id}';
												}
										  })
									  } 
								});
							
						}
					}
				});
			}
		}
		
	</script>
<!-- </body> -->
<!-- </html> -->