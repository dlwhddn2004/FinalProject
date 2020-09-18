<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Favicon -->
<link rel="icon" href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" type="image/png">
<!-- Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/nucleo/css/nucleo.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
<!-- Page plugins -->
<!-- Argon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">

<div class="row project-view">
  <div class="col-xl-12">
    <div class="card">
      <div class="card-header">
        <div class="row align-items-center">
          <div class="col">
            <div class="justify-content-between" style="display: flex;">
              <div>
                <h6 class="text-uppercase text-muted ls-1 mb-1">프로젝트명</h6>
              </div>
              <div>
                <a href="${pageContext.request.contextPath }/user/project/projectView.do?project_no=${param.project_no}&mem_id=${MEMBER_LOGININFO.mem_id}" class="btn btn-sm btn-primary btn-round btn-icon" data-toggle="tooltip" data-original-title="Edit product">
                  <span class="btn-inner--icon"><i class="fas fa-home"></i></span>
                  <span class="btn-inner--text">HOME</span>
                </a>
                <c:if test="${projectInfo.PARTNERS_ID == MEMBER_LOGININFO.mem_id }">
                	<button type="button" class="btn btn-outline-primary btn-sm btn-project-end">프로젝트 종료</button>
                </c:if>
                <c:if test="${projectInfo.PL_ID == MEMBER_LOGININFO.mem_id }">
                	<button type="button" class="btn btn-outline-primary btn-sm btn-project-end">프로젝트 종료</button>
                </c:if>
              </div>
            </div>
            <h2 class="h2 mb-0">${projectInfo.PROJECT_TITLE }</h2>
          </div>
        </div>
      </div>
      <div class="card-body">
        <ul class="nav nav-pills nav-fill flex-column flex-sm-row" id="tabs-text" role="tablist">
          <li class="nav-item">
            <button type="button" class="btn btn-secondary btn-lg" style="width: 450px;"  onclick="javascript:location.href='${pageContext.request.contextPath}/user/riskboard/riskboardList.do?project_no=${param.project_no }'">위험 관리 게시판</button>
          </li>
          <li class="nav-item">
            <button type="button" class="btn btn-secondary btn-lg" style="width: 450px;"  onclick="javascript:location.href='${pageContext.request.contextPath}/user/issueboard/issueboardList.do?project_no=${param.project_no }'">이슈 게시판</button>
          </li>
          <li class="nav-item">
            <button type="button" class="btn btn-secondary btn-lg" style="width: 450px;"  onclick="javascript:location.href='${pageContext.request.contextPath}/user/reportboard/reportboardList.do?project_no=${param.project_no }&mem_id=${MEMBER_LOGININFO.mem_id }'">보고서 게시판</button>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-xl-8">
    <div class="card" style="height: 520px;">
      <!-- Card header -->
      <div class="card-header">
        <!-- Title -->
        <h5 class="h3 mb-0">팀원별 진행 상황</h5>
      </div>
      <!-- Card body -->
      <div class="card-body">
        <!-- List group -->
        <ul class="list-group list-group-flush list my--3">
          <c:if test="${!empty projectInfo.PL }">
	          <li class="list-group-item px-0">
	            <div class="row align-items-center">
	              <div class="col-auto">
	                <!-- Avatar -->
	                <a href="#" class="avatar rounded-circle">
	                  <img alt="Image placeholder" src="/${projectInfo.PL_PIC_SAVENAME }">
	                </a>
	              </div>
	              <div class="col">
	                <h5>${projectInfo.PL_NAME } (PL)</h5>
	                <c:if test="${projectInfo.PL_AVG != '100' }">
	                	<div class="progress progress-xs mb-0">
		                  <div class="progress-bar bg-orange" role="progressbar" aria-valuenow="${projectInfo.PL_AVG }" aria-valuemin="0" aria-valuemax="100" style="width: ${projectInfo.PL_AVG }%;"></div>
		                </div>
	                </c:if>
	                <c:if test="${projectInfo.PL_AVG == '100' }">
	                	<div class="progress progress-xs mb-0">
		                  <div class="progress-bar bg-success" role="progressbar" aria-valuenow="${projectInfo.PL_AVG }" aria-valuemin="0" aria-valuemax="100" style="width: ${projectInfo.PL_AVG }%;"></div>
		                </div>
	                </c:if>
	              </div>
	            </div>
	          </li>
          </c:if>
          <c:if test="${!empty projectInfo.TA }">
	          <li class="list-group-item px-0">
	            <div class="row align-items-center">
	              <div class="col-auto">
	                <!-- Avatar -->
	                <a href="#" class="avatar rounded-circle">
	                  <img alt="Image placeholder" src="/${projectInfo.TA_PIC_SAVENAME }">
	                </a>
	              </div>
	              <div class="col">
	                <h5>${projectInfo.TA_NAME } (TA)</h5>
	                <c:if test="${projectInfo.TA_AVG != '100' }">
	                	<div class="progress progress-xs mb-0">
		                  <div class="progress-bar bg-orange" role="progressbar" aria-valuenow="${projectInfo.TA_AVG }" aria-valuemin="0" aria-valuemax="100" style="width: ${projectInfo.TA_AVG }%;"></div>
		                </div>
	                </c:if>
	                <c:if test="${projectInfo.TA_AVG == '100' }">
	                	<div class="progress progress-xs mb-0">
		                  <div class="progress-bar bg-success" role="progressbar" aria-valuenow="${projectInfo.TA_AVG }" aria-valuemin="0" aria-valuemax="100" style="width: ${projectInfo.TA_AVG }%;"></div>
		                </div>
	                </c:if>
	              </div>
	            </div>
	          </li>
          </c:if>
          <c:if test="${!empty projectInfo.DA }">
	          <li class="list-group-item px-0">
	            <div class="row align-items-center">
	              <div class="col-auto">
	                <!-- Avatar -->
	                <a href="#" class="avatar rounded-circle">
	                  <img alt="Image placeholder" src="/${projectInfo.DA_PIC_SAVENAME }">
	                </a>
	              </div>
	              <div class="col">
	                <h5>${projectInfo.DA_NAME } (DA)</h5>
	                <c:if test="${projectInfo.DA_AVG != '100' }">
	                	<div class="progress progress-xs mb-0">
		                  <div class="progress-bar bg-orange" role="progressbar" aria-valuenow="${projectInfo.DA_AVG }" aria-valuemin="0" aria-valuemax="100" style="width: ${projectInfo.DA_AVG }%;"></div>
		                </div>
	                </c:if>
	                <c:if test="${projectInfo.DA_AVG == '100' }">
	                	<div class="progress progress-xs mb-0">
		                  <div class="progress-bar bg-success" role="progressbar" aria-valuenow="${projectInfo.DA_AVG }" aria-valuemin="0" aria-valuemax="100" style="width: ${projectInfo.DA_AVG }%;"></div>
		                </div>
	                </c:if>
	              </div>
	            </div>
	          </li>
          </c:if>
          <c:if test="${!empty projectInfo.UA }">
	          <li class="list-group-item px-0">
	            <div class="row align-items-center">
	              <div class="col-auto">
	                <!-- Avatar -->
	                <a href="#" class="avatar rounded-circle">
	                  <img alt="Image placeholder" src="/${projectInfo.UA_PIC_SAVENAME }">
	                </a>
	              </div>
	              <div class="col">
	                <h5>${projectInfo.UA_NAME } (UA)</h5>
	                <c:if test="${projectInfo.UA_AVG != '100' }">
	                	<div class="progress progress-xs mb-0">
		                  <div class="progress-bar bg-orange" role="progressbar" aria-valuenow="${projectInfo.UA_AVG }" aria-valuemin="0" aria-valuemax="100" style="width: ${projectInfo.UA_AVG }%;"></div>
		                </div>
	                </c:if>
	                <c:if test="${projectInfo.UA_AVG == '100' }">
	                	<div class="progress progress-xs mb-0">
		                  <div class="progress-bar bg-success" role="progressbar" aria-valuenow="${projectInfo.UA_AVG }" aria-valuemin="0" aria-valuemax="100" style="width: ${projectInfo.UA_AVG }%;"></div>
		                </div>
	                </c:if>
	              </div>
	            </div>
	          </li>
          </c:if>
          <c:if test="${!empty projectInfo.AA }">
	          <li class="list-group-item px-0">
	            <div class="row align-items-center">
	              <div class="col-auto">
	                <!-- Avatar -->
	                <a href="#" class="avatar rounded-circle">
	                  <img alt="Image placeholder" src="/${projectInfo.AA_PIC_SAVENAME }">
	                </a>
	              </div>
	              <div class="col">
	                <h5>${projectInfo.AA_NAME } (AA)</h5>
	                <c:if test="${projectInfo.AA_AVG != '100' }">
	                	<div class="progress progress-xs mb-0">
		                  <div class="progress-bar bg-orange" role="progressbar" aria-valuenow="${projectInfo.AA_AVG }" aria-valuemin="0" aria-valuemax="100" style="width: ${projectInfo.AA_AVG }%;"></div>
		                </div>
	                </c:if>
	                <c:if test="${projectInfo.AA_AVG == '100' }">
	                	<div class="progress progress-xs mb-0">
		                  <div class="progress-bar bg-success" role="progressbar" aria-valuenow="${projectInfo.AA_AVG }" aria-valuemin="0" aria-valuemax="100" style="width: ${projectInfo.AA_AVG }%;"></div>
		                </div>
	                </c:if>
	              </div>
	            </div>
	          </li>
          </c:if>
        </ul>
      </div>
    </div>
  </div>
  <div class="col-xl-4">
    <!-- Members list group card -->
    <div class="card" style="height: 520px;">
      <!-- Card header -->
      <div class="card-header" style="display: flex; justify-content: space-between;">
        <!-- Title -->
        <div>
        	<h5 class="h3 mb-0">팀원</h5>
        </div>
        <div>
        	<c:if test="${MEMBER_LOGININFO.mem_id == projectInfo.MEM_ID}">
        		<button onClick="shareKakaotalk();"class="btn btn-sm btn-neutral" style="height: 25px;">카카오톡</button>
        		<a href="${pageContext.request.contextPath }/user/interview/partnersMain.do?mem_id=${MEMBER_LOGININFO.mem_id}&project_no=${projectInfo.PROJECT_NO}" class="btn btn-sm btn-neutral" style="height: 25px;">채용 관리</a>
        	</c:if>
        </div>
      </div>
      <!-- Card body -->
      <div class="card-body">
        <!-- List group -->
        <ul class="list-group list-group-flush list my--3">
          <c:if test="${!empty projectInfo.PL }">
	          <li class="list-group-item px-0">
	            <div class="row align-items-center">
	              <div class="col-auto">
	                <!-- Avatar -->
	                <a href="#" class="avatar rounded-circle">
	                  <img alt="Image placeholder" src="/${projectInfo.PL_PIC_SAVENAME }">
	                </a>
	              </div>
	              <div class="col ml--2">
	                <h4 class="mb-0">
	                  <a href="#!">${projectInfo.PL_NAME } (PL)</a>
	                </h4>
	                <c:if test="${projectInfo.PL_WORKSTATUS == 'Y' }">
		                <span class="text-success">●</span>
		                <small>근무 중</small>
	                </c:if>
	                <c:if test="${projectInfo.PL_WORKSTATUS == 'N' }">
	                	<span class="text-warning">●</span>
	                	<small>퇴근</small>
	                </c:if>
	              </div>
	              <div class="col-auto">
	              	<c:if test="${projectInfo.PL_WORKSTATUS == 'Y' }">
	                	<button type="button" class="btn btn-sm btn-primary">CHAT</button>
	                </c:if>
	              </div>
	            </div>
	          </li>
          </c:if>
          <c:if test="${!empty projectInfo.TA }">
	          <li class="list-group-item px-0">
	            <div class="row align-items-center">
	              <div class="col-auto">
	                <!-- Avatar -->
	                <a href="#" class="avatar rounded-circle">
	                  <img alt="Image placeholder" src="/${projectInfo.TA_PIC_SAVENAME }">
	                </a>
	              </div>
	              <div class="col ml--2">
	                <h4 class="mb-0">
	                  <a href="#!">${projectInfo.TA_NAME } (TA)</a>
	                </h4>
	                <c:if test="${projectInfo.TA_WORKSTATUS == 'Y' }">
		                <span class="text-success">●</span>
		                <small>근무 중</small>
	                </c:if>
	                <c:if test="${projectInfo.TA_WORKSTATUS == 'N' }">
	                	<span class="text-warning">●</span>
	                	<small>퇴근</small>
	                </c:if>
	              </div>
	              <div class="col-auto">
	              	<c:if test="${projectInfo.TA_WORKSTATUS == 'Y' }">
	                	<button type="button" class="btn btn-sm btn-primary">CHAT</button>
	                </c:if>
	              </div>
	            </div>
	          </li>
          </c:if>
          <c:if test="${!empty projectInfo.DA }">
	          <li class="list-group-item px-0">
	            <div class="row align-items-center">
	              <div class="col-auto">
	                <!-- Avatar -->
	                <a href="#" class="avatar rounded-circle">
	                  <img alt="Image placeholder" src="/${projectInfo.DA_PIC_SAVENAME }">
	                </a>
	              </div>
	              <div class="col ml--2">
	                <h4 class="mb-0">
	                  <a href="#!">${projectInfo.DA_NAME } (DA)</a>
	                </h4>
	                <c:if test="${projectInfo.DA_WORKSTATUS == 'Y' }">
		                <span class="text-success">●</span>
		                <small>근무 중</small>
	                </c:if>
	                <c:if test="${projectInfo.DA_WORKSTATUS == 'N' }">
	                	<span class="text-warning">●</span>
	                	<small>퇴근</small>
	                </c:if>
	              </div>
	              <div class="col-auto">
	              	<c:if test="${projectInfo.DA_WORKSTATUS == 'Y' }">
	                	<button type="button" class="btn btn-sm btn-primary">CHAT</button>
	                </c:if>
	              </div>
	            </div>
	          </li>
          </c:if>
          <c:if test="${!empty projectInfo.UA }">
	          <li class="list-group-item px-0">
	            <div class="row align-items-center">
	              <div class="col-auto">
	                <!-- Avatar -->
	                <a href="#" class="avatar rounded-circle">
	                  <img alt="Image placeholder" src="/${projectInfo.UA_PIC_SAVENAME }">
	                </a>
	              </div>
	              <div class="col ml--2">
	                <h4 class="mb-0">
	                  <a href="#!">${projectInfo.UA_NAME } (UA)</a>
	                </h4>
	                <c:if test="${projectInfo.UA_WORKSTATUS == 'Y' }">
		                <span class="text-success">●</span>
		                <small>근무 중</small>
	                </c:if>
	                <c:if test="${projectInfo.UA_WORKSTATUS == 'N' }">
	                	<span class="text-warning">●</span>
	                	<small>퇴근</small>
	                </c:if>
	              </div>
	              <div class="col-auto">
	              	<c:if test="${projectInfo.UA_WORKSTATUS == 'Y' }">
	                	<button type="button" class="btn btn-sm btn-primary">CHAT</button>
	                </c:if>
	              </div>
	            </div>
	          </li>
          </c:if>
          <c:if test="${!empty projectInfo.AA }">
	          <li class="list-group-item px-0">
	            <div class="row align-items-center">
	              <div class="col-auto">
	                <!-- Avatar -->
	                <a href="#" class="avatar rounded-circle">
	                  <img alt="Image placeholder" src="/${projectInfo.AA_PIC_SAVENAME }">
	                </a>
	              </div>
	              <div class="col ml--2">
	                <h4 class="mb-0">
	                  <a href="#!">${projectInfo.AA_NAME } (AA)</a>
	                </h4>
	                <c:if test="${projectInfo.AA_WORKSTATUS == 'Y' }">
		                <span class="text-success">●</span>
		                <small>근무 중</small>
	                </c:if>
	                <c:if test="${projectInfo.AA_WORKSTATUS == 'N' }">
	                	<span class="text-warning">●</span>
	                	<small>퇴근</small>
	                </c:if>
	              </div>
	              <div class="col-auto">
	              	<c:if test="${projectInfo.AA_WORKSTATUS == 'Y' }">
	                	<button type="button" class="btn btn-sm btn-primary">CHAT</button>
	                </c:if>
	              </div>
	            </div>
	          </li>
          </c:if>
        </ul>
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
<script src="${pageContext.request.contextPath}/assets/vendor/chart.js/dist/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/chart.js/dist/Chart.extension.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	function shareKakaotalk() {
	    Kakao.init("020511f2c122d132ca189cef2b47456f");      // 사용할 앱의 JavaScript 키를 설정
	    Kakao.Link.sendDefault({
	          objectType:"feed"
	        , content : {
	              title:"커넥터 프로젝트 확인"   // 콘텐츠의 타이틀
	            , description:"신나라씨 확인하고 수정해주세요."   // 콘텐츠 상세설명
	            , imageUrl:"http://dn.api1.kage.kakao.co.kr/14/dn/btqa9B90G1b/GESkkYjKCwJdYOkLvIBKZ0/o.jpg"   // 썸네일 이미지
	            , link : {
	                  mobileWebUrl:"http://localhost:80/"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
	                , webUrl:"http://localhost:80/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
	            }
	        }
	        , social : {
	              likeCount:0       // LIKE 개수
	            , commentCount:0    // 댓글 개수
	            , sharedCount:0     // 공유 회수
	        }
	        , buttons : [
	            {
	                  title:"게시글 확인"    // 버튼 제목
	                , link : {
	                    mobileWebUrl:"http://localhost:80/"  // 모바일 카카오톡에서 사용하는 웹 링크 URL
	                  , webUrl:"http://localhost:80/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
	                }
	            }
	        ]
	    });
	}   
	
	$('.btn-project-end').on('click', function() {
		Swal.fire({
			  icon: 'info',
			  title: '프로젝트 마감',
			  text: '프로젝트를 마감하시겠습니까?',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '마감',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
				  location.href = '${pageContext.request.contextPath }/user/project/projectEnd.do?project_no=${param.project_no }&mem_id=${MEMBER_LOGININFO.mem_id}';
			  }
		});
	});
</script>