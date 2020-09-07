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
$(function(){
/* $('#updateapply').click(function(){
	// /ddit/13/freeboard/freeboardform.jsp
	$(location).attr('href', '${pagecontext.request.contextpath}/user/projectsupport/applyupdate.do?project_no=" + project_no + "&mem_id=" + mem_id');
}); */

});




	 function viewBoardInfo(e) {
		const project_no = $(e).find('input[name=project_no]').val();
		const mem_id = $(e).find('input[name=mem_id]').val();
		
		location.href = "${pageContext.request.contextPath}/user/projectsupport/applyupdate.do?project_no=" + project_no + "&mem_id=" + mem_id ;
	}  
	
</script>
</head>
<body>
	<!-- Page content -->
	<!-- Table -->
	<form action=""></form>
	<div class="row">
		<div class="col">
			<div class="card">
				<!-- Card header -->
				<div class="card-header">
					<h3 class="mb-0">지원자 목록 조회</h3>
					<p class="text-sm mb-0">해당 프로젝트 지원한 지원자들 목록입니다.</p>
				</div>
				<div class="table-responsive py-4">
					<table class="table table-flush datatable-basic">
						<thead class="thead-light">
							<tr>														
								<th>지원자</th>
								<th>지원 날짜</th>
								<th>합격여부</th>
								<th></th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${applyList }" var="item">
								<tr class="table-row-data" onclick="javascript:viewBoardInfo(this)">
									<td>${item.mem_id }<input type="hidden" name="mem_id" value="${item.mem_id }"></td>
									<td>${item.apply_date }<input type="hidden" name="project_no" value="${item.project_no }"></td>
									<td>${item.apply_status }</td>
									<td><button type="button" class="btn btn-primary btn-write" >지원 합격</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
</body>
</html>