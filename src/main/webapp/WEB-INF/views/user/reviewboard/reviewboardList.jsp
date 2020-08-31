<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

.reviewboard-form {
	padding: 30px;
}
.form-button-area {
	padding: 30px 0px 10px 10px;
}
.starRev{
	display : block;
}
.starR{
	background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 15px;
	display: inline-block;
	text-indent: -9999px;
}
.starR.on{background-position:0 0;}

</style>

	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					<h3 class="mb-0">이용후기 게시판</h3>
					<p class="text-sm mb-0">커넥터를 이용한 파트너스가 직접남긴 후기입니다</p>
				</div>
	        	<div class="row card-wrapper" id="slider-example" style="padding: 15px;">
							<c:forEach items="${reviewboardList }" var="item" varStatus="status">
			            	<div class="col-lg-4">
			                	<!-- Contact card -->
				                <div class="card">
				                    	<!-- Card body -->
				                    	<div class="card-body">
				                        	<div class="row">
				                            	<div class="col-auto">
				                                	<!-- Avatar -->
				                                	<a href="#" class="avatar avatar-xl rounded-circle">
				                                    	<img alt="Image placeholder" src="/${item.PROFILE_SAVENAME }.${item.PROFILE_CONTENTTYPE }">
				                                	</a>
					                                <h4 class="mb-0 text-sm text-muted mb-0 text-center my-sm-2">
															${item.MEM_ID }
					                                </h4>
				                           		 </div>
				                            	<div class="col ml--2">
					                                <h4 class="mb-0 text-sm mb-0">${item.REVIEW_TITLE }</h4>
					                                <!-- <span class="text-success">●</span> -->
													<div class="form-group my-sm-2">
			                    						<div class="starRev">
			                   							  	 <c:forEach begin="1" end="${item.REVIEW_SCORE}" step="1" varStatus="status">
			                    							  	<span class="starR on">별</span>
			                    							 </c:forEach>
			                    							 <c:forEach begin="1" end="${5 - item.REVIEW_SCORE }" step="1">
			                    							    <span class="starR">별</span>
			                    							 </c:forEach>
								  						</div>
													</div>
					                                <small>${item.REVIEW_CONTENT }</small>
				                            	</div>
				                            	<c:if test="${MEMBER_LOGININFO.mem_id == item.MEM_ID }">
						                            <div class="col-auto">
						                            	<a class="table-action table-action-delete process-first" data-toggle="tooltip" data-original-title="게시글을 삭제합니다." onclick="deleteReview(this);">
												      		<input type="hidden" name="review_no" value="${item.REVIEW_NO }">
												        	<i class="fas fa-trash"></i>
												      	</a>
						                            </div>
					                           </c:if>
				                        </div>
				                    </div>
				                </div>
				            </div>
		            	</c:forEach>                		
                	</div>
	        	<div align="right" style="margin: 10px 15px 15px 0px;">
					<button type="button" class="btn btn-primary btn-write">등록</button>
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
	
	<!-- My JavaScript -->
<script type="text/javascript">
	$(function() {
		$('.btn-write').on('click', function() {
			//로그인 안했을 때 알림
			if(${empty MEMBER_LOGININFO}){
				Swal.fire(
					'Warning',
					'게시글 작성은 로그인 후 이용하실 수 있습니다.',
					'warning'
				)
				return;
			}
			
			//로그인 했다면! 폼으로 이동~!
			location.href = "${pageContext.request.contextPath}/user/reviewboard/reviewboardForm.do?mem_id=${MEMBER_LOGININFO.mem_id}";
		});
		
	});
	
	function deleteReview(e) {
		const review_no = $(e).find('input[name=review_no]').val();
		
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
			  location.href = '${pageContext.request.contextPath}/user/reviewboard/deleteReviewBoard.do?review_no=' + review_no;
		  }
		});
	}
	
</script>