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
        .noticeboard-form {
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
                <form class="noticeboard-form" action="${pageContext.request.contextPath }/user/noticeboard/insertNoticeboardInfo.do" method="POST">
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
                        <!--  <input class="form-control" type="text" name="notice_content" disabled id="example-search-input">-->
                        <div id="editor"></div>
                    </div>
                   
                   
                    
<!--                     <div class="quill" data-toggle="quill" data-quill-placeholder="내용을 입력해주세요."></div> -->

					<!-- Create the editor container -->
					
                    <div class="form-button-area" align="right">
                    		<%--                     	<c:if test="${MEMBER_LOGININFO == noticeboardInfo.mem_id }"> --%>
                        	<button class="btn btn-primary btn-submit" type="button">수정</button>
                        	<button class="btn btn-danger btn-delete" type="button">삭제</button>
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
	//$('input[name=notice_content]').val('${noticeboardInfo.notice_content}');
	
	const quill = new Quill('#editor',{
		theme: 'snow'
	});
	quill.clipboard.dangerouslyPasteHTML('${noticeboardInfo.notice_content}');
	quill.enable(false);
	
	$(".form-button-area .btn-submit").on("click", function() {
		const button_status = $('.btn-submit').text();
		
		if (button_status === "수정") {
			$('input[name=notice_title]').removeAttr('readonly');
			quill.enable(true);
			
			$('.btn-delete').hide();
			
			$('.btn-submit').text('완료');
			$('.btn-submit').removeClass('btn-primary');
			$('.btn-submit').addClass('btn-success');
			$('.btn-back').text('취소');
			$('.btn-back').removeClass('btn-primary');
			$('.btn-back').addClass('btn-warning');
		} else if (button_status === "완료") {
			// 수정 기능 실행
			const notice_title = $('input[name=notice_title]').val();
			const notice_content = quill.root.innerHTML;
			
			const $ipt_notice_no = $("<input type='hidden' name='notice_no' value='${param.notice_no}'>");
			const $ipt_notice_title = $("<input type='hidden' name='notice_title' value='" + notice_title + "'>");
			const $ipt_notice_content = $("<input type='hidden' name='notice_content' value='" + notice_content + "'>");
			
			const $frm = $("<form action='${pageContext.request.contextPath}/user/noticeboard/updateNoticeboardInfo.do' method='POST'> ");
			
			$('body').append($frm);
			$frm.append($ipt_notice_no);
			$frm.append($ipt_notice_title);
			$frm.append($ipt_notice_content);
			
			$frm.submit();
		}
	});
	
	<!-- 뒤로 가기 버튼 -->
	$('.btn-back').on('click', function() {
		const button_status = $('.btn-back').text();
		
		if (button_status === "뒤로가기") {
			location.href = '${pageContext.request.contextPath}/user/noticeboard/noticeboardList.do';
		} else if (button_status === "취소") {
			$('input[name=notice_title]').val('${noticeboardInfo.notice_title}');
			quill.clipboard.dangerouslyPasteHTML('${noticeboardInfo.notice_content}');
			
			$('.btn-delete').show();
			
			$('input[name=notice_title]').attr('readonly', 'readonly');
			quill.enable(false);
			
			$('.btn-submit').text('수정');
			$('.btn-submit').removeClass('btn-success');
			$('.btn-submit').addClass('btn-primary');
			$('.btn-back').text('뒤로가기');
			$('.btn-back').removeClass('btn-warning');
			$('.btn-back').addClass('btn-primary');
		}
	});
	
	<!-- 삭제 버튼 -->
	$('.btn-delete').on('click', function() {
		Swal.fire({
		  title: '정말 삭제하시겠습니까?',
		  text: "삭제를 클릭하면 되돌릴 수 없습니다.",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
			  location.href = '${pageContext.request.contextPath}/user/noticeboard/deleteNoticeboardInfo.do?notice_no=${param.notice_no}';
		  }
		});
	});
		 
		
		
	
	
	</script>
</body>
</html>