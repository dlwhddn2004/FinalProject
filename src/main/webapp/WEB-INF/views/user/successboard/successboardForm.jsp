<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <input class="form-control" type="text" name="success_title" id="example-text-input">
                    </div>
                    <div class="form-group">
                        <label for="example-search-input" class="form-control-label">작성자</label>
                        <input class="form-control" name="mem_id" type="text" disabled id="example-search-input">
                    </div>
                    <div style="margin: 25px 0px 25px 0px">
                        <label for="example-search-input" class="form-control-label">프로젝트</label>
                        <select class="form-control project-selector" data-toggle="select" title="Simple select" data-placeholder="완료한 프로젝트가 없습니다.">
                        	<c:forEach items="${attendProjectList }" var="item" varStatus="status">
								<option>번호 : ${item.project_no } 이름 : ${item.project_title }</option>
							</c:forEach>
                        </select>
                    </div>
                    
					<!-- Create the editor container -->
					<div id="editor"></div>

                    <div class="form-button-area" align="right">
                        <button class="btn btn-primary btn-submit" type="button">등록</button>
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
		$('input[name=mem_id]').val('${MEMBER_LOGININFO.mem_id}');
	
		<!-- Quill Text Editor Initialize -->
		const quill = new Quill('#editor', {
			theme: 'snow'
		});
		
		<!-- 등록 버튼 -->
		$(".form-button-area .btn-submit").on("click", function() {
			// 제목을 입력하지 않았을 때!
			const success_title = $('input[name=success_title]').val();
			
			if (success_title == "") {
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
			
			// 프로젝트를 고르지 않았을 때!
			const project_select_txt = $('.project-selector').select2('val');
			if (project_select_txt == null) {
				$.notify({
					// options
					message: '프로젝트를 선택해주세요.' 
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
			
			const project_no = project_select_txt.substring(project_select_txt.indexOf(" ") + 3, project_select_txt.indexOf("이") - 1);
			
			// 내용을 입력하지 않았을 때!
			const success_content = quill.root.innerHTML;
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
			location.href = '${pageContext.request.contextPath}/user/successboard/insertSuccessBoard.do?success_title=' + success_title + "&success_content=" + success_content + "&project_no=" + project_no + "&mem_id=${MEMBER_LOGININFO.mem_id}";
		});
		
		<!-- 뒤로 가기 버튼 -->
		$('.btn-back').on('click', function() {
			location.href = '${pageContext.request.contextPath}/user/successboard/successboardList.do'; 
		});
	</script>
</body>
</html>