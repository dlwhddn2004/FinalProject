<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Start your development with a Dashboard for Bootstrap 4.">
<meta name="author" content="CONNECTOR">
<title>Insert title here</title>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/datatables.net-select-bs4/css/select.bootstrap4.min.css">
<!-- Argon CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0"
	type="text/css">
<!-- Sweet Alerts -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.css">

<!-- My CSS -->
<style type="text/css">
.table-row-data:hover {
	background-color: #5e72e4;
	color: white;
	cursor: pointer;
	transition: 0.5s;
}
</style>

<!-- My JavaScript -->
<script type="text/javascript">
	$(function() {
		// 등록 버튼(게시글 작성)
		$('.btn-write').on('click', function() {
			// 로그인 하지 않았다면 경고창으로 알리고 페이지 이동 막기
			if (${empty MEMBER_LOGININFO}) {
				Swal.fire(
				  'Warning',
				  '게시글 작성은 로그인 후 이용하실 수 있습니다.',
				  'warning'
				)
				
				return;
			}
			
			// 로그인 한 상태!
			location.href = "${pageContext.request.contextPath}/user/reportboard/reportboardForm.do?mem_id=${MEMBER_LOGININFO.mem_id}&project_no=${projectInfo.PROJECT_NO}";
		});
	});
	
	function reportBoardInfo(e) {
		
		const report_no = $(e).find('input[name=report_no]').val();
		const mem_id = $(e).find('input[name=mem_id]').val();
		const project_no = $(e).find('input[name=project_no]').val();
		
		if(${projectInfo.PL == MEMBER_LOGININFO.mem_id} || ${projectInfo.MEM_ID == MEMBER_LOGININFO.mem_id}){
			location.href = "${pageContext.request.contextPath}/user/reportboard/reportboardView.do?report_no=" + report_no + "&mem_id=${MEMBER_LOGININFO.mem_id}" + "&project_no=" + project_no;
		}

	}
</script>
</head>
<body>
	<!-- Page content -->
	
	
	
	<div class="row">
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
            <button type="button" class="btn btn-primary btn-lg" style="width: 450px;"  onclick="javascript:location.href='${pageContext.request.contextPath}/user/reportboard/reportboardList.do?project_no=${param.project_no }'">보고서 게시판</button>
          </li>
        </ul>
      </div>
    </div>
  </div>
  </div>
	
	
	<!-- Table -->
	<div class="row">
		<div class="col">
			<div class="card">
				<!-- Card header -->
				<div class="card-header">
					<h3 class="mb-0">보고서 게시판</h3>
				</div>
				<div class="table-responsive py-4">
					<table class="table table-flush datatable-basic">
						<thead class="thead-light">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>상태</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>상태</th>
								<th>등록일</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach items="${reportboardList }" var="item">
								<tr class="table-row-data" onclick="javascript:reportBoardInfo(this)">
									<td>${item.R }<input type="hidden" name="report_no" value="${item.REPORT_NO }"></td>
									<td>${item.REPORT_TITLE }</td>
									<td>${item.MEM_ID }<input type="hidden" name="mem_id" value="${item.MEM_ID }"></td>
									<c:if test="${empty item.REPORT_STATUS}"><td style="color : #5e72e4">결재대기</td></c:if>
									<c:if test="${item.REPORT_STATUS == 'N'}"><td style="color : #f5365c">반려</td></c:if>
									<c:if test="${item.REPORT_STATUS == 'Y'}"><td style="color : #2dce89">결재완료</td></c:if>
									<td>${item.REPORT_REGDATE }</td>
									<input type="hidden" name="project_no" value="${item.PROJECT_NO }">
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${projectInfo.PL == MEMBER_LOGININFO.mem_id}">
						<div align="right" style="padding: 15px 15px 0px 0px;">
							<button type="button" class="btn btn-primary btn-write">등록</button>
						</div>
					</c:if>
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
	<!-- Argon JS -->
	<script
		src="${pageContext.request.contextPath }/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath }/assets/js/demo.min.js"></script>
	<script>
	
	</script>
</body>
</html>