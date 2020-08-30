<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Start your development with a Dashboard for Bootstrap 4.">
<meta name="author" content="Creative Tim">
<title>Argon Dashboard PRO - Premium Bootstrap 4 Admin Template</title>
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
<!-- DROPDOWN -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/select2/dist/css/select2.min.css">
	
<style>
	.task-modal .modal-dialog {
		transform: translate(-162px, 0px) !important;
	}
	
	.task-modal .icon-area .fas:hover {
		cursor: pointer;
	} 
</style>
	
</head>
<body>
	<div class="row task">
		<div class="col">
			<div class="card">
				<!-- Card header -->
				<div class="card-header border-0" style="margin: 0px 0px 0px 0px;">
					<h1 class="mb-0">일감</h1>
					<div
						style="display: flex; margin: 0px 0px 0px 0px; justify-content: space-between;">
						<div style="display: flex; width: 500px;">
							<div style="margin: 10px 10px 10px 0px; width: 300px;">
								<h5>프로젝트</h5>
								<select class="form-control select-project" data-toggle="select"
									title="Simple select" data-live-search="true"
									data-live-search-placeholder="데이터가 없습니다.">
								</select>
							</div>
							<div class="select-manager-area"
								style="margin: 10px; width: 250px;">
								<h5>담당자</h5>
								<select class="form-control select-manager" data-toggle="select"
									title="Simple select" data-live-search="true"
									data-live-search-placeholder="담당자">
								</select>
							</div>
						</div>
						<div>
							<button type="button" class="btn btn-block btn-default btn-open-taskadd-modal"
									data-toggle="modal" data-target="#modal-form">일감 등록</button>
						</div>
					</div>
				</div>
				<!-- Light table -->
				<div class="table-responsive" data-toggle="list"
					data-list-values='["name", "status"]' style="padding: 15px;">
					<table class="table-area table align-items-center table-flush">
						<thead class="thead-light">
							<tr>
								<th scope="col" class="sort" data-sort="name">상태</th>
								<th scope="col" class="sort" data-sort="status">우선순위</th>
								<th scope="col">제목</th>
								<th scope="col">담당자</th>
								<th scope="col">변경</th>
							</tr>
						</thead>
						<tbody class="list tasklist-area">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

<!-- 일감 등록 모달 -->
	<div class="row task-modal">
		<div class="col-md-4">
			<div class="modal fade" id="modal-form" tabindex="-1" role="dialog"
				aria-labelledby="modal-form" aria-hidden="true">
				<div class="modal-dialog modal- modal-dialog-centered modal-sm"
					role="document">
					<div class="modal-content">
						<div class="modal-body p-0" style="width: 650px;">
							<div class="card bg-secondary border-0 mb-0">
								<div class="card-header bg-transparent pb-5">
								
									<div class="icon-area" style="display: flex; justify-content: space-between;">
										<div>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							                    <span aria-hidden="true"><i class="fas fa-times fa-2x modal-event-cancel" style="color: red;"></i></span>
							                </button>
										</div>
									
										<div class="text-muted text-center mt-2 mb-3">
											<small class="modal-little-title"></small>
											<h2 class="display-4 font-weight-bold modal-title"></h2>
										</div>
										
										<div>
											<i class="fas fa-check fa-2x modal-event-add" style="color: #5e72e4;"></i>
										</div>
									</div>
									
								    <img src="" class="rounded-circle img-center img-fluid shadow shadow-lg--hover modal-profile-img" style="width: 140px;">
									<div class="pt-4 text-center">
									    <h5 class="h3 title">
									        <span class="d-block mb-1 modal-profile-name"></span>
									        <small class="h4 font-weight-light text-muted">Web Developer</small>
									    </h5>
									</div>
								</div>
								<div class="card-body px-lg-5 py-lg-5">
									<form role="form">
										<div class="text-left text-muted mb-1">
											<small>제목</small>
										</div>
										<div class="form-group mb-3">
											<div
												class="input-group input-group-merge input-group-alternative">
												<div class="input-group-prepend">
													<span class="input-group-text"><i class="fas fa-heading"></i></span>
												</div>
												<input class="form-control" name="function_name" placeholder="제목" type="text">
											</div>
										</div>
										
										<div style="display: flex; justify-content: space-between;">
											<div style="width: 45%;">
												<div class="text-left text-muted mb-1">
													<small>담당자</small>
												</div>
												<div class="form-group">
													<div
														class="input-group input-group-merge input-group-alternative">
														<select class="form-control modal-select-manager" data-toggle="select" title="Simple select1" data-live-search="true" data-live-search-placeholder="Search ...">
													    </select>
													</div>
												</div>
											</div>
											
											<div style="width: 45%; margin: 10px 0px 0px 0px;">
												<div class="text-left text-muted mb-1">
													<small>진척도</small>
												</div>
												<div class="input-slider-container">
												  <div id="input-slider" class="input-slider" data-range-value-min="0" data-range-value-max="100"></div>
												  <div class="row mt-3 d-none">
												    <div class="col-6">
												      <span id="input-slider-value" class="range-slider-value" data-range-value-low="0"></span>
												    </div>
												  </div>
												</div>
											</div>
										</div>
										
										<div class="text-left text-muted mb-1">
											<small>일정</small>
										</div>
										<div class="input-daterange datepicker row align-items-center">
										    <div class="col">
										        <div class="form-group">
										            <div class="input-group">
										                <div class="input-group-prepend">
										                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
										                </div>
										                <input class="form-control modal-start-date" placeholder="Start date" type="text" value="06/18/2020">
										            </div>
										        </div>
										    </div>
										    <div class="col">
										        <div class="form-group">
										            <div class="input-group">
										                <div class="input-group-prepend">
										                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
										                </div>
										                <input class="form-control modal-end-date" placeholder="End date" type="text" value="06/22/2020">
										            </div>
										        </div>
										    </div>
										</div>
										

										<div style="display: flex; justify-content: space-between;">
											<div style="width: 45%;">
												<div class="text-left text-muted mb-1">
													<small>상태</small>
												</div>
												<div class="form-group">
													<div
														class="input-group input-group-merge input-group-alternative">
														<select class="form-control modal-select-status" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="Search ...">
													        <option>신규</option>
													        <option>완료</option>
													    </select>
													</div>
												</div>
											</div>
											
											<div style="width: 45%;">
												<div class="text-left text-muted mb-1">
													<small>우선 순위</small>
												</div>
												<div class="form-group">
													<div
														class="input-group input-group-merge input-group-alternative">
														<select class="form-control modal-select-priority" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="Search ...">
													        <option>낮음</option>
													        <option>보통</option>
													        <option>높음</option>
													    </select>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
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
	<script
		src="${pageContext.request.contextPath}/assets/vendor/list.js/dist/list.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/datatables.net-select/js/dataTables.select.min.js"></script>
	<script 
		src="${pageContext.request.contextPath}/assets/vendor/nouislider/distribute/nouislider.min.js"></script>
	<script 
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<!-- Argon JS -->
	<script
		src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

	<!-- 스크립트위치 -->
	<script>
		/**
		 * 페이지 로딩
		 */
		let function_manager = '';
		let project_function_no_all = '';

		// 처음 프로젝트에 맞는 데이터 표시
		loadProject('${MEMBER_LOGININFO.mem_id}');

		// 프로젝트를 선택하면 해당 프로젝트에 맞는 담당자와 상태 선택할 수 있도록 표시
		$(document.body).on(
				"change",
				".select-project",
				function() {
					let
					project_no = $('.select-project').select2('val');
					project_no = project_no.substring(
							project_no.indexOf(':') + 2, project_no
									.indexOf('이') - 1);

					loadManager(project_no);
				});

		// 매니저를 선택하면 해당 프로젝트에서 선택한 담당자가 맡은 기능을 조회하도록 구현
		$(document.body).on(
				"change",
				".select-manager",
				function() {
					let
					project_no = $('.select-project').select2('val');
					project_no = project_no.substring(
							project_no.indexOf(':') + 2, project_no
									.indexOf('이') - 1);

					let manager = $('.select-manager').select2('val');

					loadTaskList(project_no, manager);
				});

		function loadProject(mem_id) {
			$
					.ajax({
						type : 'POST',
						url : '${pageContext.request.contextPath}/user/task/selectNotProjectList.do',
						dataType : 'json',
						data : {
							mem_id : mem_id
						},
						success : function(result) {
							if (result.notProjectList == 0) { // 맡은 프로젝트가 없을 시에 담당자와 상태를 감추고 프로젝트 선택 창에 데이터 없음 표시
								$('.select-project').empty();
								$('.select-project')
										.append(
												'<option>현재 진행 중인 프로젝트가 없습니다.</option>');
								$('.select-project').attr('disabled',
										'disabled');
								$('.select-manager-area').hide();
							} else {
								$.each(result.notProjectList, function(index, item) {
									$('.select-project').append('<option value="' + item.PROJECT_NO + '">' + item.PROJECT_TITLE + '</option>');
								});

								let project_no = $('.select-project').select2('val');

								loadManager(project_no);
							}
						},
						error : function(response, status, request) {
							alert(request.status);
						}
					});
		}

		function loadManager(project_no) {
			$
					.ajax({
						type : 'POST',
						url : '${pageContext.request.contextPath}/user/task/selectProjectInfo.do',
						dataType : 'json',
						data : {
							project_no : project_no
						},
						success : function(result) {
							$('.select-manager').empty();
							if (result.projectInfo == 0) {
								$('.select-manager').append('<option>아직 프로젝트에 참여한 팀원이 없습니다.</option>');
							} else {
								const PL = $('<option value="' + result.projectInfo.PL + '">' + result.projectInfo.PL_NAME
										+ ' (PL)</option>');
								const DA = $('<option value="' + result.projectInfo.DA + '">' + result.projectInfo.DA_NAME
										+ ' (DA)</option>');
								const UA = $('<option value="' + result.projectInfo.UA + '">' + result.projectInfo.UA_NAME
										+ ' (UA)</option>');
								const TA = $('<option value="' + result.projectInfo.TA + '">' + result.projectInfo.TA_NAME
										+ ' (TA)</option>');
								const AA = $('<option value="' + result.projectInfo.AA + '">' + result.projectInfo.AA_NAME
										+ ' (AA)</option>');

								let
								chkPL = null;
								let
								chkDA = null;
								let
								chkUA = null;
								let
								chkTA = null;
								let
								chkAA = null;
								
								if (result.projectInfo.PL != null) {
									$('.select-manager').append(PL);
									chkPL = result.projectInfo.PL;
								}
								if (result.projectInfo.DA != null) {
									$('.select-manager').append(DA);
									chkDA = result.projectInfo.DA;
								}
								if (result.projectInfo.UA != null) {
									$('.select-manager').append(UA);
									chkUA = result.projectInfo.UA;
								}
								if (result.projectInfo.TA != null) {
									$('.select-manager').append(TA);
									chkTA = result.projectInfo.TA;
								}
								if (result.projectInfo.AA != null) {
									$('.select-manager').append(AA);
									chkAA = result.projectInfo.AA;
								}

								if (chkPL != null) {
									function_manager = chkPL;
								} else if (chkDA != null) {
									function_manager = chkDA;
								} else if (chkUA != null) {
									function_manager = chkUA;
								} else if (chkTA != null) {
									function_manager = chkTA;
								} else if (chkAA != null) {
									function_manager = chkAA;
								}

								let project_no = $('.select-project').select2('val');
								
								loadTaskList(project_no, function_manager);
							}
						},
						error : function(response, status, request) {
							alert(request.status);
						}
					});
		}

		// 선택한 카테고리에 따라 조회하는 값 변경
		function loadTaskList(project_no, mem_id) {
			$
					.ajax({
						type : 'POST',
						url : '${pageContext.request.contextPath}/user/task/selectTaskList.do',
						dataType : 'json',
						data : {
							project_no : project_no,
							mem_id : mem_id
						},
						success : function(result) {
							$('.tasklist-area').empty();
							if (result.taskList == 0) {
								Swal.fire('INFO', '현재 작업중인 기능이 존재하지 않습니다.',
										'info')
								$('.tasklist-area')
										.append(
												'<tr><td colspan="5"><div style="display: flex; justify-content: center;">데이터가 없습니다.</div></td></tr>');
							} else {
								$
										.each(
												result.taskList,
												function(index, item) {
													// 완료 text-primary
													let
													function_status = '';
													if (item.FUNCTION_STATUS == '신규') {
														function_status = '<span class="name mb-0 text-sm">신규</span>';
													} else {
														function_status = '<span class="name mb-0 text-sm text-primary">완료</span>';
													}

													// 우선순위 (낮음 : text-muted 보통 : text-primary 높음 : text-warning)
													let
													function_priority = '';
													if (item.FUNCTION_PRIORITY == '낮음') {
														function_priority = '<td class="status text-muted">낮음</td>';
													} else if (item.FUNCTION_PRIORITY == '보통') {
														function_priority = '<td class="status text-primary">보통</td>';
													} else if (item.FUNCTION_PRIORITY == '높음') {
														function_priority = '<td class="status text-warning">높음</td>';
													}

													const
													taskItem = $(''
															+ '<tr data-toggle="modal" data-target="#modal-form" style="cursor: pointer;" onclick="beforeLoadModal(this)">'
															+ '<input type="hidden" name="project_function_no" value="' + item.PROJECT_FUNCTION_NO + '">'
															+ '<th scope="row">'
															+ '<div class="media align-items-center">'
															+ '<div class="media-body">'
															+ function_status
															+ '</div>'
															+ '</div>'
															+ '</th>'
															+ function_priority
															+ '<td>'
															+ '<span class="badge badge-dot mr-4">'
															+ '<span class="function-name">'
															+ item.FUNCTION_NAME
															+ '</span>'
															+ '</span>'
															+ '</td>'
															+ '<td>'
															+ '<div class="avatar-group">'
															+ item.MEM_NAME
															+ '</div>'
															+ '</td>'
															+ '<td>'
															+ '<div class="d-flex align-items-center">'
															+ '<span class="completion mr-2">'
															+ item.FUNCTION_MODIDATE
															+ '</span>'
															+ '</div>'
															+ '</td>' + '</tr>');

													$('.tasklist-area').append(
															taskItem);
												});
							}
						},
						error : function(response, status, request) {
							alert(response.status);
						}
					});
		}
		
		// 일감 모달창 매니저 변경 시 사진이랑 정보들 변경
		$(document.body).on("change", ".task-modal .modal-select-manager", function() {
			const mem_id = $('.task-modal .modal-select-manager').select2('val');
			
			changeManager(mem_id);
		});
		
		// 일감 모달창 확인 버튼
		$('.task-modal .modal-event-add').on('click', function() {
			// 일감 등록 or 일감 수정
			const current_status = $('.task-modal .modal-little-title').text();
			
			
			const project_no = $('.select-project').select2('val');
			const function_name = $('.task-modal input[name=function_name]').val();
			const function_manager = $('.task-modal .modal-select-manager').select2('val');
			let function_progress = $('.task-modal .range-slider-value').text();
			function_progress = function_progress.substring(0, function_progress.indexOf('.'));
			
			let temp = '';
			let year = '';
			let month = '';
			let day = '';
			
			let function_regdate = $('.task-modal .modal-start-date').val();
			temp = function_regdate;
			year = temp.substring(temp.lastIndexOf('/') + 1);
			month = temp.substring(0, temp.indexOf('/'));
			day = temp.substring(temp.indexOf('/') + 1, temp.lastIndexOf('/'));
			function_regdate = year + '-' + month + '-' + day;
			
			let function_enddate = $('.task-modal .modal-end-date').val();
			temp = function_enddate;
			year = temp.substring(temp.lastIndexOf('/') + 1);
			month = temp.substring(0, temp.indexOf('/'));
			day = temp.substring(temp.indexOf('/') + 1, temp.lastIndexOf('/'));
			function_enddate = year + '-' + month + '-' + day;
			
			const function_status = $('.task-modal .modal-select-status').select2('val');
			const function_priority = $('.task-modal .modal-select-priority').select2('val');
			
			
			if (current_status === '일감 등록') {
				
				$.ajax({
					type: 'POST',
					url: '${pageContext.request.contextPath}/user/task/insertTask.do',
					dataType: 'json',
					data: {
						project_no: project_no,
						function_name: function_name,
						function_manager: function_manager,
						function_progress: function_progress,
						function_regdate: function_regdate,
						function_enddate: function_enddate,
						function_status: function_status,
						function_priority: function_priority
					},
					success: function(result) {
						$('#modal-form').modal("hide");
						
						const manager = $('.task .select-manager').select2('val');
						loadTaskList(project_no, manager);
					},
					error(response, status, request) {
						alert(response.status);
					}
				});
				
			} else if (current_status === '일감 수정') {
				const project_function_no = $('')
				
				$.ajax({
					type: 'POST',
					url: '${pageContext.request.contextPath}/user/task/updateTask.do',
					dataType: 'json',
					data: {
						project_function_no: project_function_no_all,
						project_no: project_no,
						function_name: function_name,
						function_manager: function_manager,
						function_progress: function_progress,
						function_regdate: function_regdate,
						function_enddate: function_enddate,
						function_status: function_status,
						function_priority: function_priority
					},
					success: function(result) {
						if (result.result == "Y") {
							$('#modal-form').modal("hide");
							
							const manager = $('.task .select-manager').select2('val');
							loadTaskList(project_no, manager);
						} else if (result.result == "N") {
							Swal.fire('WARNING',
									  '일감 수정에 실패했습니다.',
									  'warning');
						}
					},
					error(response, status, request) {
						alert(response.status);
					}
				});
				
			}
		});
		
		// 일감 등록 모달창 실행 시 선행되는 이벤트!
		$('.btn-open-taskadd-modal').on('click', function() {
			// noUiSlider 초기화
			let function_progress = $('.task-modal .range-slider-value').text('0.0');
			$('.noUi-connect').css('transform', 'translate(0%, 0px) scale(0, 1)');
			$('.noUi-origin').css('transform', 'translate(-100%, 0px)');
			$('.noUi-origin').css('z-index', '4');
			
			const projectData = $('.task .select-project').select2('data');
			const project_no = projectData[0].id;
			const project_title = projectData[0].text;
			
			$('.task-modal #input-slider-value').attr('data-range-value-low', '0');
			noUiSlider;
			
			$('.task-modal .modal-little-title').text('일감 등록');
			$('.task-modal .modal-title').text(project_title);
			
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/task/selectProjectInfo.do',
				dataType : 'json',
				data : {
					project_no : project_no
				},
				success : function(result) {
					$('.task-modal .modal-select-manager').empty();
					if (result.projectInfo == 0) {
						$('.task-modal .modal-select-manager').append('<option>아직 프로젝트에 참여한 팀원이 없습니다.</option>');
					} else {
						const PL = $('<option value="' + result.projectInfo.PL + '">' + result.projectInfo.PL_NAME
								+ ' (PL)</option>');
						const DA = $('<option value="' + result.projectInfo.DA + '">' + result.projectInfo.DA_NAME
								+ ' (DA)</option>');
						const UA = $('<option value="' + result.projectInfo.UA + '">' + result.projectInfo.UA_NAME
								+ ' (UA)</option>');
						const TA = $('<option value="' + result.projectInfo.TA + '">' + result.projectInfo.TA_NAME
								+ ' (TA)</option>');
						const AA = $('<option value="' + result.projectInfo.AA + '">' + result.projectInfo.AA_NAME
								+ ' (AA)</option>');
						
						if (result.projectInfo.PL != null) {
							$('.task-modal .modal-select-manager').append(PL);
						}
						if (result.projectInfo.DA != null) {
							$('.task-modal .modal-select-manager').append(DA);
						}
						if (result.projectInfo.UA != null) {
							$('.task-modal .modal-select-manager').append(UA);
						}
						if (result.projectInfo.TA != null) {
							$('.task-modal .modal-select-manager').append(TA);
						}
						if (result.projectInfo.AA != null) {
							$('.task-modal .modal-select-manager').append(AA);
						}
						
						const mem_id = $('.task-modal .modal-select-manager').select2('val');
						changeManager(mem_id);
					}
				},
				error : function(response, status, request) {
					alert(request.status);
				}
			});
			
			// 월/일/년도
			let nowDate = new Date();
			nowDate = nowDate.toISOString();
			nowDate = nowDate.substring(0, nowDate.indexOf('T'));
			
			const year = nowDate.substring(0, nowDate.indexOf('-'));
			const month = nowDate.substring(nowDate.indexOf('-') + 1, nowDate.lastIndexOf('-'));
			const day = nowDate.substring(nowDate.lastIndexOf('-') + 1);
			
			$('.task-modal input[name=function_name]').val('');
			$('.task-modal .modal-start-date').val(month + '/' + day + '/' + year);
			$('.task-modal .modal-end-date').val(month + '/' + day + '/' + year);
			
			
			$('.task-modal .modal-select-status').empty();
			$('.task-modal .modal-select-status').append('<option>신규</option> <option>완료</option>');
			
			$('.task-modal .modal-select-priority').empty();
			$('.task-modal .modal-select-priority').append('<option>낮음</option> <option>보통</option> <option>높음</option>')
		});
		
		// 일감 수정 모달창 실행 시 선행되는 이벤트
		function beforeLoadModal(e) {
			project_function_no_all = $(e).find('input[name=project_function_no]').val();
			const currentSelectedManagerName = $('.task .select-manager').select2('data');
			let temp = currentSelectedManagerName[0].text;
			let chkPosition = temp.substring(temp.indexOf('(') + 1, temp.indexOf(')'));
			
			// 지금 선택한 일감의 상세 정보를 조회해야함!
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath}/user/task/selectTaskInfo.do',
				dataType: 'json',
				data: {
					project_function_no: project_function_no_all
				},
				success: function(result) {
					// 제목 세팅!
					$('.task-modal input[name=function_name]').val(result.FUNCTION_NAME);
					
					// noUiSlider 선택한 값에 맞춰 세팅!
					let function_progress = $('.task-modal .range-slider-value').text(result.FUNCTION_PROGRESS + '.0');
					$('.noUi-connect').css('transform', 'translate(0%, 0px) scale(0.' + result.FUNCTION_PROGRESS + ', 1)');
					$('.noUi-origin').css('transform', 'translate(-' + (100 - Number(result.FUNCTION_PROGRESS)) + '%, 0px)');
					$('.noUi-origin').css('z-index', '4');
					
					// 날짜 세팅! (월/일/년도 -> 이렇게 들어가야함)
					$('.task-modal .modal-start-date').val(result.FUNCTION_REGDATE);
					$('.task-modal .modal-end-date').val(result.FUNCTION_ENDDATE);
					
					// 상태 세팅!
					$('.task-modal .modal-select-status').empty();
					if (result.FUNCTION_STATUS == '신규') {
						$('.task-modal .modal-select-status').append('<option selected>신규</option> <option>완료</option>');
					} else if (result.FUNCTION_STATUS == '완료') {
						$('.task-modal .modal-select-status').append('<option>신규</option> <option selected>완료</option>');
					}
					
					// 우선 순위 세팅!
					$('.task-modal .modal-select-priority').empty();
					if (result.FUNCTION_PRIORITY == '낮음') {
						$('.task-modal .modal-select-priority').append('<option selected>낮음</option> <option>보통</option> <option>높음</option>');
					} else if (result.FUNCTION_PRIORITY == '보통') {
						$('.task-modal .modal-select-priority').append('<option>낮음</option> <option selected>보통</option> <option>높음</option>');
					} else if (result.FUNCTION_PRIORITY == '높음') {
						$('.task-modal .modal-select-priority').append('<option>낮음</option> <option>보통</option> <option selected>높음</option>');
					}
				},
				error: function(response, status, request) {
					alert(response.status);
				}
			});
			
			const projectData = $('.task .select-project').select2('data');
			const project_no = projectData[0].id;
			const project_title = projectData[0].text;
			
			
			$('.task-modal .modal-little-title').text('일감 수정');
			$('.task-modal .modal-title').text(project_title);
			
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/task/selectProjectInfo.do',
				dataType : 'json',
				data : {
					project_no : project_no
				},
				success : function(result) {
					$('.task-modal .modal-select-manager').empty();
					if (result.projectInfo == 0) {
						$('.task-modal .modal-select-manager').append('<option>아직 프로젝트에 참여한 팀원이 없습니다.</option>');
					} else {
						let PL = $('<option value="' + result.projectInfo.PL + '">' + result.projectInfo.PL_NAME
								+ ' (PL)</option>');
						let DA = $('<option value="' + result.projectInfo.DA + '">' + result.projectInfo.DA_NAME
								+ ' (DA)</option>');
						let UA = $('<option value="' + result.projectInfo.UA + '">' + result.projectInfo.UA_NAME
								+ ' (UA)</option>');
						let TA = $('<option value="' + result.projectInfo.TA + '">' + result.projectInfo.TA_NAME
								+ ' (TA)</option>');
						let AA = $('<option value="' + result.projectInfo.AA + '">' + result.projectInfo.AA_NAME
								+ ' (AA)</option>');
						
						if (chkPosition === 'PL') {
							PL = $('<option selected value="' + result.projectInfo.PL + '">' + result.projectInfo.PL_NAME
									+ ' (PL)</option>');
						} else if (chkPosition === 'DA') {
							DA = $('<option selected value="' + result.projectInfo.DA + '">' + result.projectInfo.DA_NAME
									+ ' (DA)</option>');
						} else if (chkPosition === 'UA') {
							PL = $('<option selected value="' + result.projectInfo.UA + '">' + result.projectInfo.UA_NAME
									+ ' (UA)</option>');
						} else if (chkPosition === 'TA') {
							PL = $('<option selected value="' + result.projectInfo.TA + '">' + result.projectInfo.TA_NAME
									+ ' (TA)</option>');
						} else if (chkPosition === 'AA') {
							PL = $('<option selected value="' + result.projectInfo.AA + '">' + result.projectInfo.AA_NAME
									+ ' (AA)</option>');
						}
						
						
						if (result.projectInfo.PL != null) {
							$('.task-modal .modal-select-manager').append(PL);
						}
						if (result.projectInfo.DA != null) {
							$('.task-modal .modal-select-manager').append(DA);
						}
						if (result.projectInfo.UA != null) {
							$('.task-modal .modal-select-manager').append(UA);
						}
						if (result.projectInfo.TA != null) {
							$('.task-modal .modal-select-manager').append(TA);
						}
						if (result.projectInfo.AA != null) {
							$('.task-modal .modal-select-manager').append(AA);
						}
						
						const mem_id = $('.task-modal .modal-select-manager').select2('val');
						changeManager(mem_id);
					}
				},
				error : function(response, status, request) {
					alert(request.status);
				}
			});
		}
		
		function changeManager(mem_id) {
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath}/user/member/selectMemberInfoJSON.do',
				dataType: 'json',
				data: {
					mem_id: mem_id
				},
				success: function(result) {
					$('.task-modal .modal-profile-img').attr('src', '/' + result.PROFILE_SAVENAME)
					$('.task-modal .modal-profile-name').text(result.MEM_NAME);
				},
				error: function(response, status, request) {
					alert(response.status);
				}
			});
		}
	</script>
</body>
</html>