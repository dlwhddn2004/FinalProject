<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%--                 <form class="jobsBoard-form" action="${pageContext.request.contextPath }/user/jobsboard/updateJobsBoard.do" method="POST"> --%>
                    <div class="form-group">
                        <label for="example-text-input" class="form-control-label">제목</label>
                        <input class="form-control" type="text" name="jobs_title" id="example-text-input" readonly>
                    </div>
                    <div class="form-group">
                        <label for="example-search-input" class="form-control-label">작성자</label>
                        <input class="form-control" type="text" name="mem_id"  id="example-search-input" readonly>
                    </div>
                    
					<div class="row input-daterange datepicker align-items-center">
					    <div class="col">
					        <div class="form-group">
					            <label class="form-control-label">모집 시작일</label>
					            <input class="form-control" placeholder="Start date" type="text" name="jobs_startdate" id="jobs_startdate" >
					        </div>
					    </div>
					    <div class="col">
					        <div class="form-group">	
					            <label class="form-control-label">모집 종료일</label>
					            <input class="form-control" placeholder="End date" type="text" name="jobs_enddate" id="jobs_enddate" >
					        </div>
					    </div>
					</div>  

					<!-- Create the editor container -->
					<div id="editor"></div>
					
                    <div class="form-button-area" align="right">
                   		<c:if test="${MEMBER_LOGININFO.mem_id == jobsboardInfo.mem_id }">
                   			<button type="submit" class="btn btn-primary" id="btn-modefiy">수정</button>
                   			<button type="button" class="btn btn-danger" id="btn-delete">삭제</button>
                   		</c:if> 	
                            <button type="button" class="btn btn-primary" id="btn-back">목록</button>
                    </div>                 
<!--                 </form> -->
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
		
		

		$('input[name=jobs_title]').val('${jobsboardInfo.jobs_title}');
		$('input[name=mem_id]').val('${jobsboardInfo.mem_id}');
		$('#jobs_startdate').val('${jobsboardInfo.jobs_startdate}');
		$('#jobs_enddate').val('${jobsboardInfo.jobs_enddate}');
		quill.clipboard.dangerouslyPasteHTML('${jobsboardInfo.jobs_content}');
		
		quill.enable(false);
		
			
		$('input[name=jobs_startdate]').attr('disabled',true);
		$('input[name=jobs_enddate]').attr('disabled',true);
		
		
		$('#btn-modefiy').on('click',function(){
			const button_status = $('#btn-modefiy').text();
			if(button_status === '수정'){
				$('input[name=jobs_title]').removeAttr('readonly');
				$('input[name=jobs_startdate]').attr('disabled',false);
				$('input[name=jobs_enddate]').attr('disabled',false);

				quill.enable(true);
				
				$('#btn-delete').hide();
				
				$('#btn-modefiy').text('완료');
				$('#btn-modefiy').removeClass('btn-primary');
				$('#btn-modefiy').addClass('btn-success');
				$('#btn-back').text('취소');
				$('#btn-back').removeClass('btn-primary');
				$('#btn-back').addClass('btn-warning');
			}else if(button_status === "완료"){
				
				const mem_id = $('input[name=mem_id]').val();
				const jobs_title =$('input[name=jobs_title]').val();
				const jobs_content = quill.root.innerHTML;
				const jobs_startdate = $('#jobs_startdate').val(); 
				const jobs_enddate = $('#jobs_enddate').val();
				
				
				const $ipt_jobs_no= $("<input type='hidden' name='jobs_no' value='${jobsboardInfo.jobs_no}' >");
				const $ipt_jobs_title= $("<input type='hidden' name='jobs_title' value='" +jobs_title +"'> " );
				const $ipt_jobs_startdate= $("<input type='hidden' name='jobs_startdate' value='" +jobs_startdate+"'> " );
				const $ipt_jobs_enddate= $("<input type='hidden' name='jobs_enddate' value='" +jobs_enddate +"'> " );
				const $ipt_jobs_content = $("<input type='hidden' name='jobs_content' value='" + jobs_content + "'>");
				
				
				const $frm = $("<form action='${pageContext.request.contextPath}/user/jobsboard/updateJobsBoard.do' method='POST'> ");
				
				$('body').append($frm);
				$frm.append($ipt_jobs_no);
				$frm.append($ipt_jobs_title);
				$frm.append($ipt_jobs_startdate);
				$frm.append($ipt_jobs_enddate);
				$frm.append($ipt_jobs_content);
				
				$frm.submit();
			}
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