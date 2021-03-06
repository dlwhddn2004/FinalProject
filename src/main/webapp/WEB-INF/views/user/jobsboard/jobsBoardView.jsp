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
        .cardview {
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
            <div class="card cardview">
<%--                 <form class="jobsBoard-form" action="${pageContext.request.contextPath }/user/jobsboard/updateJobsBoard.do" method="POST"> --%>
				<div class="jobsBoard-form">
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
					            <input required class="form-control" placeholder="Start date" type="text" name="jobs_startdate" id="jobs_startdate" >
					        </div>
					    </div>
					    <div class="col">
					        <div class="form-group">	
					            <label class="form-control-label">모집 종료일</label>
					            <input required class="form-control" placeholder="End date" type="text" name="jobs_enddate" id="jobs_enddate" >
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
                            <button type="button" class="btn btn-primary" id="btn-back">뒤로가기</button>
                    </div>                 
<!--                 </form> --></div>
		      
        </div>
        
                  <!-- 댓글 -->
            <div class="card cardview" style="margin: 15px 0px 0px 0px;">
		        <!-- Card header -->
		        <div class="card-header border-0">
		          <div class="row">
		            <div class="col-6">
		              <h3 class="mb-0">댓글</h3>
		            </div>
		            <div class="col-6 text-right">
		              <a class="btn btn-sm btn-neutral btn-round btn-icon btn-comment-write" data-toggle="tooltip" data-original-title="댓글을 등록합니다.">
		                <span class="btn-inner--icon"><i class="fas fa-pen"></i></span>
		                <span class="btn-inner--text">등록</span>
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
							    <td class="table-user">
							      <img src="/${item.profile_savename }" class="avatar rounded-circle mr-3">
							      <b>${item.mem_id }</b>
							    </td>
							    <td class="td-comment_content">
							      <span class="text-muted span-comment_content process-first">${item.comment_content }</span>
							      <input type="text" class="form-control form-control-alternative process-second modi-ipt-comment-content" value="${item.comment_content }">
							    </td>
							    <td>
							      <span class="text-muted">${item.comment_regdate }</span>
							    </td>
							    
							    <td class="table-actions">
							      <c:if test="${MEMBER_LOGININFO.mem_id == item.mem_id }">
								      <a class="table-action process-first" data-toggle="tooltip" data-original-title="댓글을 수정합니다." onclick="loadModifyView(this);">
								        <i class="fas fa-user-edit"></i>
								      </a>
								      <a class="table-action table-action-delete process-first" data-toggle="tooltip" data-original-title="댓글을 삭제합니다." onclick="deleteComment(this);">
								      	<input type="hidden" name="comment_seq" value="${item.comment_seq }">
								        <i class="fas fa-trash"></i>
								      </a>
								      
								      <a class="btn btn-sm btn-neutral btn-round btn-icon process-second" data-toggle="tooltip" data-original-title="댓글을 수정합니다." onclick="modifyComment(this);">
						                <span class="btn-inner--icon"><i class="fas fa-pen"></i></span>
						                <span class="btn-inner--text">수정</span>
						              </a>
						              <a class="btn btn-sm btn-neutral btn-round btn-icon process-second" data-toggle="tooltip" data-original-title="댓글 수정을 취소합니다." onclick="unloadModifyView(this);">
						                <span class="btn-inner--icon"><i class="fas fa-pen"></i></span>
						                <span class="btn-inner--text">취소</span>
						              </a>
							      </c:if>
							    </td>
							 </tr>
		            	</c:forEach>
		            </tbody>
		            <tfoot class="comment-write-area">
		            	<tr>
		            		<td>
		            			<img src="/${profileInfo.profile_savename }" class="avatar rounded-circle mr-3">
							    <b>${MEMBER_LOGININFO.mem_id }</b>
		            		</td>
		            		<td>
							    <input type="text" class="form-control form-control-alternative ipt-comment-area" placeholder="내용을 입력해주세요.">
						    </td>
						    <td>
							    <a class="btn btn-sm btn-neutral btn-round btn-icon write-tooltip" data-toggle="tooltip" data-original-title="댓글을 작성합니다." onclick="inCommentWrite()">
				                  <span class="btn-inner--icon"><i class="fas fa-pen"></i></span>
				                  <span class="btn-inner--text btn-comment-inwrite">등록</span>
				                </a>
				                <a class="btn btn-sm btn-neutral btn-round btn-icon cancel-tooltip" data-toggle="tooltip" data-original-title="댓글 작성을 취소합니다." onclick="inCommentCancel()">
				                  <span class="btn-inner--icon"><i class="fas fa-ban"></i></span>
				                  <span class="btn-inner--text btn-comment-cancel">취소</span>
				                </a>
						    </td>
		            	</tr>
		            </tfoot>
		          </table>
		        </div>
		      </div>
    </div>
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
	<!-- 달력 -->
	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<!-- Argon JS -->
	<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
	
	
	
	
	<!-- My JavaScript -->
	<script type="text/javascript">
		
	$('.process-second').hide();
	$('.comment-write-area').hide();
	
	
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
			
			const button_status = $('#btn-back').text();
			
			if(button_status ==='뒤로가기'){
				location.href = '${pageContext.request.contextPath}/user/jobsboard/jobsBoardList.do'; 
			}else if(button_status=== "취소"){
				$('input[name=jobs_title]').val('${jobsboardInfo.jobs_title}');
				quill.clipboard.dangerouslyPasteHTML('${jobsboardInfo.jobs_content}');
				
				$('#btn-delete').show();
				$('input[name=jobs_title]').attr('readonly','readonly');
				$('input[name=jobs_startdate]').attr('disabled',true);
				$('input[name=jobs_enddate]').attr('disabled',true);
				quill.enable(false);
				
				$('#btn-modefiy').text('수정');
				$('#btn-modefiy').removeClass('btn-success');
				$('#btn-modefiy').addClass('btn-primary');
				$('#btn-back').text('뒤로가기');
				$('#btn-back').removeClass('btn-warning');
				$('#btn-back').addClass('btn-primary');
			}
		});
		
		$('#btn-delete').on('click',function(){
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
					  location.href = '${pageContext.request.contextPath}/user/jobsboard/deleteJobsBoard.do?jobs_no=${jobsboardInfo.jobs_no}';
				  } 
				});
			
		});
		
		

		$('.btn-comment-write').on('click',function(){
			if(${empty MEMBER_LOGININFO}){
				Swal.fire(
						  'Warning',
						  '게시글 작성은 로그인 후 이용하실 수 있습니다.',
						  'warning'
						)
						
						return;
			}
			$('.btn-comment-write').hide();
			$('.comment-write-area').show();
		});
		
		<!-- 댓글 등록 버튼 클릭 후 (댓글 등록 버튼) -->

		function inCommentWrite() {
			const jobs_no = '${jobsboardInfo.jobs_no}';
			const mem_id= '${MEMBER_LOGININFO.mem_id}';
			const comment_content = $('.ipt-comment-area').val();
			
			const $frm= $("<form action='${pageContext.request.contextPath}/user/jobsboard/insertJobsComment.do' method='POST'>");
			const $ipt_jobs_no = $("<input type='hidden' name='jobs_no' value='" +jobs_no + "'>" );
			const $ipt_mem_id = $("<input type='hidden' name = 'mem_id' value = '" + mem_id + "'>");
			const $ipt_comment_content = $("<input type= 'hidden' name= 'comment_content' value = '" +comment_content + "'>");
			
			$('body').append($frm);
			$frm.append($ipt_jobs_no);
			$frm.append($ipt_mem_id);
			$frm.append($ipt_comment_content);
			
			$frm.submit();
		}
		
		<!-- 댓글 등록 버튼 클릭 후 (댓글 취소 버튼) -->
		function inCommentCancel(){
			$('.ipt-comment-area').val('');
			$('.btn-comment-write').show();
			$('.comment-write-area').hide();
		}

		
		
		
		<!-- 댓글 삭제-->
		function deleteComment(info){
			const comment_seq = $(info).find('input[name=comment_seq]').val();
			
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
						  location.href ="${pageContext.request.contextPath}/user/jobsboard/deleteJobsComment.do?jobs_no=${jobsboardInfo.jobs_no}&comment_seq=" + comment_seq + "&mem_id=${MEMBER_LOGININFO.mem_id}";  
					  }
				});
			}
		/* 댓글 수정 준비 */
		let comment_content = "";
		
		function loadModifyView(info){
			comment_content = $(info).parents().find('.modi-ipt-comment-content').val();
			
			$(info).parent().parent().find('.process-first').hide();
			$(info).parent().parent().find('.process-second').show();
		}
	
		function unloadModifyView(info){
			$(info).parent().parent().find('.modi-ipt-comment-content').val(comment_content);
			$(info).parent().parent().parent().find('.process-first').show();
			$(info).parent().parent().find('.process-second').hide();
			
		}
		
		function modifyComment(info){
			comment_content = $(info).parent().parent().find('.modi-ipt-comment-content').val();
			comment_seq = $(info).parent().parent().find('input[name=comment_seq]').val();
			location.href='${pageContext.request.contextPath}/user/jobsboard/modifyJobsComment.do?comment_seq=' +comment_seq + '&comment_content='+comment_content +"&jobs_no=${jobsboardInfo.jobs_no}&mem_id=${MEMBER_LOGININFO.mem_id}";
		}

	</script>
	

</body>
</html>