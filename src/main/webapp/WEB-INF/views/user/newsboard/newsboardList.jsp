<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
<meta name="author" content="CONNECTOR">
<title>Insert title here</title>

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

<!-- My Script -->
<script type="text/javascript">
	$(function() {
/* 		$('#btn1').on('click', function() {
			location.href = '${pageContext.request.contextPath}/user/newsboard/newsboardForm.do'; 
	}); */
	});
	
</script>
</head>
<body>

	<!-- Page content -->
	<div class="container-fluid mt--6">
		<!-- Table -->
		<div class="row">
			<div class="col">
				<div class="card">
					<!-- Card header -->
					<div class="card-header">
						<h3 class="mb-0">소식 게시판</h3>
						<p class="text-sm mb-0">채용 공고 게시판입니다.</p>
					</div>
					<div class="table-responsive py-4">
						<table class="table table-flush" id="datatable-buttons">
							<thead class="thead-light">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<!-- <tfoot>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회수</th>
								</tr>
							</tfoot> -->
							<tbody>
								<c:forEach items="${newsboardList}" var="item">
									<tr class="table-row-data">
										<td>${item.r }<input type="hidden" value="${item.news_no }" name="news_no"></td>
										<td>${item.news_title }</td>
										<td>${item.mem_id }</td>
										<td>${item.news_regdate }</td>
										<td>${item.news_hit }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
							<div align="right" style="padding: 15px 15px 0px 0px;">
						<button type="button" id="btn1" class="btn btn-primary btn-write">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Argon Scripts -->
	<!-- Core -->
	<script src="${pageContext.request.contextPath }/assets/vendor/jquery/dist/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/js-cookie/js.cookie.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
	<!-- Optional JS -->
	<script src="${pageContext.request.contextPath }/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/vendor/datatables.net-select/js/dataTables.select.min.js"></script>
	
	<!-- Argon JS -->
	<script src="${pageContext.request.contextPath }/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
		<!-- My JavaScript -->
	<script type="text/javascript">
		// 게시글 상세 보기
		$('.table-row-data').on('click', function() {
			const news_no = $(this).find('input[name=news_no]').val();
			
			location.href = "${pageContext.request.contextPath}/user/newsboard/newsboardView.do?news_no=" + news_no;
		});
	
		// 등록 버튼(게시글 작성)
		$('#btn1').on('click', function() {
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
			location.href = "${pageContext.request.contextPath}/user/newsboard/newsboardForm.do";
		
		});
	</script>
	</div>
</body>
</html>