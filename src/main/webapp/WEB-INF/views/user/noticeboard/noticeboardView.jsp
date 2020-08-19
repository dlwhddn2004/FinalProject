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
        .successboard-form {
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
                <form class="successboard-form" action="${pageContext.request.contextPath }/user/successboard/insertSuccessBoard.do" method="POST">
                    <div class="form-group">
                        <label for="example-text-input" class="form-control-label">제목</label>
                        <input class="form-control" type="text" name="notice_title" id="example-text-input">
                    </div>
                    <div class="form-group">
                        <label for="example-search-input" class="form-control-label">작성자</label>
                        <input class="form-control" type="text" name="mem_id" disabled id="example-search-input">
                    </div>
                    <div class="form-group">
                        <label for="example-search-input" class="form-control-label">내용</label>
                        <input class="form-control" type="text" name="notice_content" disabled id="example-search-input">
                    </div>
                   
                   
                    
<!--                     <div class="quill" data-toggle="quill" data-quill-placeholder="내용을 입력해주세요."></div> -->

					<!-- Create the editor container -->
				
                    <div class="form-button-area" align="right">
                    		<%--                     	<c:if test="${MEMBER_LOGININFO == noticeboardInfo.mem_id }"> --%>
                        	<button class="btn btn-primary btn-submit" type="button">수정</button>
<%--                         </c:if> --%>
                        <button class="btn btn-primary btn-back" type="button">뒤로가기</button>
                    </div>
                </form>
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
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
	<!-- Argon JS -->
	<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
	
	<!-- My JavaScript -->
	<script type="text/javascript">
	$('input[name=notice_title]').val('${noticeboardInfo.notice_title}');
	$('input[name=mem_id]').val('${noticeboardInfo.mem_id}');
	$('input[name=notice_content]').val('${noticeboardInfo.notice_content}');
	
	/* const quill = new Quill('#editor',{
		theme: 'snow'
	});
	quill.clipboard.dangerouslyPasteHTML('${noticeboardInfo.notice_content}');
	quill.enable(false);
		 */
		
		
	
	
	</script>
</body>
</html>