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
<meta name="author" content="Creative Tim">
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
	href="${pageContext.request.contextPath}/assets/vendor/fullcalendar/dist/fullcalendar.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.css">
<!-- Argon CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0"
	type="text/css">
<!-- Quill -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">
<!-- Select2 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/select2/dist/css/select2.min.css">
<!-- Notify -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/animate.css/animate.min.css">

<!-- My CSS -->
<style>
.here {
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
			<div class="card here">
				<div class="form-group">

					<label for="example-text-input" class="form-control-label">제목</label>
					<input class="form-control" type="text" name="risk_title"
						id="example-text-input" readonly>
				</div>
				<div class="form-group">
					<label for="example-search-input" class="form-control-label">작성자</label>
					<input class="form-control" type="text" name="mem_id" disabled
						id="example-search-input" readonly>
				</div>
				<div class="form-group">
                    	<label for="example-select-input" class="form-control-label">오류 상태</label>
                    	<select class="form-control error-selector" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="Search ..." id="risk_errorstatus" name="risk_errorstatus"
                    			data-minimum-results-for-search="Infinity" disabled>
                    			<c:if test="${riskboardInfo.risk_errorstatus == '시스템 오류' }">
                    				<option selected value="시스템 오류">시스템 오류</option>
                    				<option value="기능 오류" disabled>기능 오류</option>
                    				<option value="치명적인 오류"disabled>치명적인 오류</option>
                    			</c:if>
                    			<c:if test="${riskboardInfo.risk_errorstatus == '기능 오류' }">
                    				<option value="시스템 오류" disabled>시스템 오류</option>
                    				<option selected value="기능 오류">기능 오류</option>
                    				<option value="치명적인 오류" disabled>치명적인 오류</option>
                    			</c:if>
                    			<c:if test="${riskboardInfo.risk_errorstatus == '치명적인 오류' }">
                    				<option value="시스템 오류" disabled>시스템 오류</option>
                    				<option value="기능 오류" disabled>기능 오류</option>
                    				<option selected value="치명적인 오류" >치명적인 오류</option>
                    			</c:if>
                    				<c:if test="${riskboardInfo.risk_errorstatus == '오류 해결' }">
                    				<option selected value="오류 해결" >오류 해결</option>
                    			</c:if>
                    			
   						</select>
                    </div>
				<div style="margin: 0px 0px 25px 0px">
					<label for="example-search-input" class="form-control-label">내용</label>
					<div id="editor"></div>
				</div>

				<!-- Create the editor container -->

				<div class="form-button-area" align="right">
					<c:if test="${MEMBER_LOGININFO.mem_id == riskboardInfo.mem_id }">
						<c:if test="${riskboardInfo.risk_errorstatus == '오류 해결' }">
							<button class="btn btn-primary btn-submit" type="submit">수정</button>
							<button class="btn btn-danger btn-delete" type="button">삭제</button>
						</c:if>
						<c:if test="${riskboardInfo.risk_errorstatus != '오류 해결' }">
						<button class="btn btn-primary btn-complete" type="button">오류 해결</button>
						<button class="btn btn-primary btn-submit" type="submit">수정</button>
						<button class="btn btn-danger btn-delete" type="button">삭제</button>
						</c:if>
					</c:if>
					<button class="btn btn-primary btn-back" type="button">뒤로가기</button>
				</div>
			</div>

			<!-- 댓글 -->
			<div class="card here">
				<!-- Card header -->
				<div class="card-header border-0">
					<div class="row">
						<div class="col-6">
							<h3 class="mb-0">댓글</h3>
						</div>
						<div class="col-6 text-right">
							<a
								class="btn btn-sm btn-neutral btn-round btn-icon btn-comment-write"
								data-toggle="tooltip" data-original-title="댓글을 등록합니다."> <span
								class="btn-inner--icon"><i class="fas fa-pen"></i></span> <span
								class="btn-inner--text">등록</span>
							</a>
						</div>
					</div>
				</div>
				<!-- Light table -->
				<div class="table-responsive">
					<table class="table align-items-center table-flush">
						<thead class="thead-light">
							<tr>
								<th>작성자</th>
								<th>내용</th>
								<th>등록일</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${commentList }" var="item">
								<tr>
									<td class="table-user"><img
										src="/${item.profile_savename }"
										class="avatar rounded-circle mr-3"> <b>${item.mem_id }</b>
									</td>
									<td class="td-comment_content"><span
										class="text-muted span-comment_content process-first">${item.comment_content }</span>
										<input type="text"
										class="form-control form-control-alternative process-second modi-ipt-comment-content"
										value="${item.comment_content }"></td>
									<td><span class="text-muted">${item.comment_regdate }</span>
									</td>

									<td class="table-actions"><c:if
											test="${MEMBER_LOGININFO.mem_id == item.mem_id }">
											<a class="table-action process-first" data-toggle="tooltip"
												data-original-title="댓글을 수정합니다."
												onclick="loadModifyView(this);"> <i
												class="fas fa-user-edit"></i>
											</a>
											<a class="table-action table-action-delete process-first"
												data-toggle="tooltip" data-original-title="댓글을 삭제합니다."
												onclick="deleteComment(this);"> <input type="hidden"
												name="comment_seq" value="${item.comment_seq }"> <i
												class="fas fa-trash"></i>
											</a>

											<a
												class="btn btn-sm btn-neutral btn-round btn-icon process-second"
												data-toggle="tooltip" data-original-title="댓글을 수정합니다."
												onclick="modifyComment(this);"> <span
												class="btn-inner--icon"><i class="fas fa-pen"></i></span> <span
												class="btn-inner--text">수정</span>
											</a>
											<a
												class="btn btn-sm btn-neutral btn-round btn-icon process-second"
												data-toggle="tooltip" data-original-title="댓글 수정을 취소합니다."
												onclick="unloadModifyView(this)"> <span
												class="btn-inner--icon"><i class="fas fa-pen"></i></span> <span
												class="btn-inner--text">취소</span>
											</a>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot class="comment-write-area">
							<tr>
								<td><img src="/${profileInfo.profile_savename }"
									class="avatar rounded-circle mr-3"> <b>${MEMBER_LOGININFO.mem_id }</b>
								</td>
								<td><input type="text"
									class="form-control form-control-alternative ipt-comment-area"
									placeholder="내용을 입력해주세요."></td>
								<td><a
									class="btn btn-sm btn-neutral btn-round btn-icon write-tooltip"
									data-toggle="tooltip" data-original-title="댓글을 작성합니다."
									onclick="inCommentWrite()"> <span class="btn-inner--icon"><i
											class="fas fa-pen"></i></span> <span
										class="btn-inner--text btn-comment-inwrite">등록</span>
								</a> <a
									class="btn btn-sm btn-neutral btn-round btn-icon cancel-tooltip"
									data-toggle="tooltip" data-original-title="댓글 작성을 취소합니다."
									onclick="inCommentCancel()"> <span class="btn-inner--icon"><i
											class="fas fa-ban"></i></span> <span
										class="btn-inner--text btn-comment-cancel">취소</span>
								</a></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Argon Scripts -->
	<!-- Core -->
	<script
		src="${pageContext.request.contextPath}/assets/vendor/jquery/dist/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/js-cookie/js.cookie.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
	<!-- Optional JS -->
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- Argon JS -->
	<script
		src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

	<!-- My JavaScript -->
	<script type="text/javascript">
	$('.process-second').hide();
	
	$('.comment-write-area').hide();
	
		$('input[name=risk_title]').val('${riskboardInfo.risk_title}');
		$('input[name=mem_id]').val('${riskboardInfo.mem_id}');
		$('select[name=risk_errorstatus]').select2('val');
		
		<!-- Quill Text Editor Initialize -->
		const quill = new Quill('#editor', {
			theme: 'snow'
		});
		quill.clipboard.dangerouslyPasteHTML('${riskboardInfo.risk_content}');
		quill.enable(false);
		
		<!-- 수정 버튼 -->
		$(".form-button-area .btn-submit").on("click", function() {
			const button_status = $('.btn-submit').text();
			
			if (button_status === "수정") {
				$('input[name=risk_title]').removeAttr('readonly');
				quill.enable(true);
				
				$('.btn-delete').hide();
				$('.btn-complete').hide();
				
				$('.btn-submit').text('완료');
				$('.btn-submit').removeClass('btn-primary');
				$('.btn-submit').addClass('btn-risk');
				$('.btn-back').text('취소');
				$('.btn-back').removeClass('btn-primary');
				$('.btn-back').addClass('btn-warning');
			} else if (button_status === "완료") {
				// 수정 기능 실행
				const risk_title = $('input[name=risk_title]').val();
				const risk_content = quill.root.innerHTML;
				
				const $ipt_risk_no = $("<input type='hidden' name='risk_no' value='${param.risk_no}'>");
				const $ipt_risk_title = $("<input type='hidden' name='risk_title' value='" + risk_title + "'>");
				const $ipt_risk_content = $("<input type='hidden' name='risk_content' value='" + risk_content + "'>");
				const $ipt_risk_errorstatus = $("<input type= 'hidden' name='risk_errorstatus' value ='" + risk_errorstatus +"'>");
				
				const $frm = $("<form action='${pageContext.request.contextPath}/user/riskboard/updateRiskboard.do?project_no=${param.project_no}' method='POST'> ");
				
				$('body').append($frm);
				$frm.append($ipt_risk_no);
				$frm.append($ipt_risk_title);
				$frm.append($ipt_risk_content);
				$frm.append($ipt_risk_errorstatus);
				
				$frm.submit();
			}
		});
		
		<!-- 뒤로 가기 버튼 -->
		$('.btn-back').on('click', function() {
			const button_status = $('.btn-back').text();
			
			if (button_status === "뒤로가기") {
				location.href = '${pageContext.request.contextPath}/user/riskboard/riskboardList.do?project_no=${param.project_no}';
			} else if (button_status === "취소") {
				$('input[name=risk_title]').val('${riskboardInfo.risk_title}');
				quill.clipboard.dangerouslyPasteHTML('${riskboardInfo.risk_content}');
				
				$('.btn-delete').show();
				
				$('input[name=risk_title]').attr('readonly', 'readonly');
				quill.enable(false);
				
				$('.btn-submit').text('수정');
				$('.btn-submit').removeClass('btn-risk');
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
				  location.href = '${pageContext.request.contextPath}/user/riskboard/deleteRiskboard.do?risk_no=${param.risk_no}&project_no=${param.project_no}';
			  }
			});
		});
		
		//해결완료 버튼
		 $('.btn-complete').on('click', function(){
// 			 const button_status = $('.btn-complete').text();
			 
// 			const risk_errorstatus = $('select[name=risk_errorstatus]').select2('val');
// 			const error_ok = $('.btn-complete').text();
			
// 			const $ipt_risk_errorstatus = $("<input type='hidden name='risk_errorstatus' value='" + risk_errorstatus + "'>");
// 			const $frm = $("<form action='${pageContext.request.contextPath}/user/riskboard/updateErrorStatus.do?project_no=${param.project_no}' method='POST'>");
			
// 			$('body').append($frm);
// 			$frm.append($ipt_risk_errorstatus);
			
// 			$frm.submit();
			location.href = '${pageContext.request.contextPath}/user/riskboard/updateErrorStatus.do?risk_no=${param.risk_no}&project_no=${param.project_no}';
		});  
		
		<!-- 댓글 등록 버튼 -->
		$('.btn-comment-write').on('click', function() {
			// 로그인 하지 않았다면 경고창으로 알리고 페이지 이동 막기
			if (${empty MEMBER_LOGININFO}) {
				Swal.fire(
				  'Warning',
				  '댓글 작성은 로그인 후 이용하실 수 있습니다.',
				  'warning'
				)
				
				return;
			}
			
			$('.btn-comment-write').hide();
			$('.comment-write-area').show();
		});
		
		<!-- 댓글 등록 버튼 클릭 후 (댓글 등록 버튼) -->
		function inCommentWrite() {
			const risk_no = '${param.risk_no}';
			const mem_id = '${MEMBER_LOGININFO.mem_id}';
			const comment_content = $('.ipt-comment-area').val();
			const project_no = '${param.project_no}'
			
			const $frm = $("<form action='${pageContext.request.contextPath}/user/riskboard/insertriskComment.do' method='POST'>");
			const $ipt_risk_no = $("<input type='hidden' name='risk_no' value='" + risk_no + "'>");
			const $ipt_mem_id = $("<input type='hidden' name='mem_id' value='" + mem_id + "'>");
			const $ipt_comment_content = $("<input type='hidden' name='comment_content' value='" + comment_content + "'>");
			const $ipt_project_no = $("<input type='hidden' name='project_no' value='" + project_no + "'>");
			
			$('body').append($frm);
			$frm.append($ipt_risk_no);
			$frm.append($ipt_mem_id);
			$frm.append($ipt_comment_content);
			$frm.append($ipt_project_no);
			
			$frm.submit();
		}
		
		<!-- 댓글 등록 버튼 클릭 후 (댓글 취소 버튼) -->
		function inCommentCancel() {
			$('.ipt-comment-area').val('');
			
			$('.btn-comment-write').show();
			$('.comment-write-area').hide();
		}
		
		<!-- 댓글 삭제 -->
		function deleteComment(e) {
			const comment_seq = $(e).find('input[name=comment_seq]').val();
			
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
				  location.href = '${pageContext.request.contextPath}/user/riskboard/deleteriskComment.do?risk_no=${param.risk_no}&comment_seq=' + comment_seq + "&mem_id=${MEMBER_LOGININFO.mem_id}" + "&project_no=${param.project_no}";
			  }
			});
		}
		
		let comment_content = "";
		
		<!-- 댓글 수정 준비 -->
		function loadModifyView(e) {
			comment_content = $(e).parent().parent().find('.modi-ipt-comment-content').val();
			
			$(e).parent().parent().find('.process-first').hide();
			$(e).parent().parent().find('.process-second').show();
		}
		
		<!-- 댓글 수정 준비 취소 -->
		function unloadModifyView(e) {
			$(e).parent().parent().find('.modi-ipt-comment-content').val(comment_content);
			
			$(e).parent().parent().parent().find('.process-first').show();
			$(e).parent().parent().find('.process-second').hide();
		}
		
		<!-- 댓글 수정 -->
		function modifyComment(e) {
			const comment_seq = $(e).parent().parent().find('input[name=comment_seq]').val();
			const comment_content = $(e).parent().parent().find('.modi-ipt-comment-content').val();
			
			location.href = '${pageContext.request.contextPath}/user/riskboard/updateriskComment.do?risk_no=${param.risk_no}&comment_seq=' + comment_seq + "&mem_id=${MEMBER_LOGININFO.mem_id}" + "&comment_content=" + comment_content + "&project_no=${param.project_no}";
		}
	</script>
</body>