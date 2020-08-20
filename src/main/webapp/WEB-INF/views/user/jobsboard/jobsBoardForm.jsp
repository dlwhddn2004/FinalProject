<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
    <meta name="author" content="Creative Tim">
    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" type="image/png">
    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <!-- Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/nucleo/css/nucleo.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
    <!-- Page plugins -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fullcalendar/dist/fullcalendar.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.css">
    <!-- Argon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">
    <!-- Quill -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <!-- Select2 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/select2/dist/css/select2.min.css">
    <!-- Notify -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css/animate.min.css">

    <!-- My CSS -->
    <style>
        .jobsBoard-form {
            padding: 30px;
        }
        .form-button-area {
            padding: 30px 0px 10px 10px;
        }
    </style>
</head>
<body>
	<div class="row">
        <div class="col">
            <div class="card">
                <form class="jobsBoard-form" action="${pageContext.request.contextPath }/user/jobsboard/insertJobsBoard.do" method="POST">
                    <div class="form-group">
                        <label for="example-text-input" class="form-control-label">제목</label>
                        <input class="form-control" type="text" name="jobs_title" id="example-text-input">
                    </div>
                    <div class="form-group">
                        <label for="example-search-input" class="form-control-label">작성자</label>
                        <input name="mem_id" type="hidden" value="${MEMBER_LOGININFO.mem_id }" >
                        <input class="form-control" type="text" value="${MEMBER_LOGININFO.mem_id }" disabled id="example-search-input">
                    </div>
                    
					<div class="row input-daterange datepicker align-items-center">
					    <div class="col">
					        <div class="form-group">
					            <label class="form-control-label">모집 시작일</label>
					            <input class="form-control" placeholder="Start date" type="text" name="jobs_startdate">
					        </div>
					    </div>
					    <div class="col">
					        <div class="form-group">	
					            <label class="form-control-label">모집 종료일</label>
					            <input class="form-control" placeholder="End date" type="text" name="jobs_enddate">
					        </div>
					    </div>
					</div>  

					<!-- Create the editor container -->
					<div id="editor"></div>

                    <div class="form-button-area" align="right">
                        <button type="button" class="btn btn-outline-success" id="btnInsert">등록</button>
                        <button type="button" class="btn btn-outline-primary" id="btn-back">목록</button>
                    </div>
                </form>
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
	<!-- 달력 -->
	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<!-- Argon JS -->
	<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
	
	
	
	
	<!-- My JavaScript -->
	<script type="text/javascript">
		
		<!-- Quill Text Editor Initialize -->
		const quill = new Quill('#editor', {
			theme: 'snow'
		});
		
		<!-- 등록 버튼 -->
		$("#btnInsert").on("click", function() {
			// 제목을 입력하지 않았을 때!
			const jobs_title = $('input[name=jobs_title]').val();
			const jobs_startdate=$('input[name=jobs_startdate]').val();
			const jobs_enddate=$('input[name=jobs_enddate]').val();
			if (jobs_title == "") {
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
			
			// 내용을 입력하지 않았을 때!
			const jobs_content = quill.root.innerHTML;
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
			
			
			// 데이터 넘겨서 Insert 작업하기
			location.href = '${pageContext.request.contextPath}/user/jobsboard/insertJobsBoard.do?jobs_title=' + jobs_title + "&jobs_content=" + jobs_content + "&jobs_startdate=" + jobs_startdate +"&jobs_enddate=" + jobs_enddate+ "&mem_id=${MEMBER_LOGININFO.mem_id}";
		});
		
		<!-- 뒤로 가기 버튼 -->
		$('#btn-back').on('click', function() {
			location.href = '${pageContext.request.contextPath}/user/jobsboard/jobsBoardList.do'; 
		});
	</script>
	
<%-- 	 <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/assets/vendor/moment.min.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datetimepicker.js"></script> --%>
<%--  	<script src="${pageContext.request.contextPath}/assets/vendor/nouislider/distribute/nouislider.min.js"></script> --%>
</body>
</html>