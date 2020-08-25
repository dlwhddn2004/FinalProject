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
</head>
<body>
	<div class="row">
		<div class="col">
			<div class="card">
				<!-- Card header -->
				<div class="card-header border-0" style="margin: 0px 0px 100px 0px;">
					<h1 class="mb-0">일감</h1>
					<div style="display: flex; margin: 10px 0px 10px 0px">
						<div style="display: flex; width: 500px;">
							<div style="margin: 10px 10px 10px 0px; width: 300px;">
								<h5>프로젝트</h5>
								<select class="form-control select-project" data-toggle="select"
									title="Simple select" data-live-search="true"
									data-live-search-placeholder="데이터가 없습니다.">
								</select>
							</div>
							<div class="select-manager-area" style="margin: 10px; width: 250px;">
								<h5>담당자</h5>
								<select class="form-control select-manager" data-toggle="select"
									title="Simple select" data-live-search="true"
									data-live-search-placeholder="담당자">
								</select>
							</div>
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

	<!-- Argon Scripts -->
	<!-- Core -->
	<script src="${pageContext.request.contextPath}/assets/vendor/jquery/dist/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/js-cookie/js.cookie.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
	<!-- Optional JS -->
	<script src="${pageContext.request.contextPath}/assets/vendor/list.js/dist/list.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
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
	<!-- Argon JS -->
	<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

	<!-- 스크립트위치 -->
	<script>
		/**
		 * 페이지 로딩
		 */
		 let function_manager = '';
		
		// 처음 프로젝트에 맞는 데이터 표시
		loadProject('${MEMBER_LOGININFO.mem_id}');
		
		// 프로젝트를 선택하면 해당 프로젝트에 맞는 담당자와 상태 선택할 수 있도록 표시
		$(document.body).on("change", ".select-project", function() {
			let project_no = $('.select-project').select2('val');
			project_no = project_no.substring(project_no.indexOf(':') + 2, project_no.indexOf('이') - 1);
			
			loadManager(project_no);
		});
		
		// 매니저를 선택하면 해당 프로젝트에서 선택한 담당자가 맡은 기능을 조회하도록 구현
		$(document.body).on("change", ".select-manager", function() {
			let project_no = $('.select-project').select2('val');
			project_no = project_no.substring(project_no.indexOf(':') + 2, project_no.indexOf('이') - 1);
			
			let manager = $('.select-manager').select2('val');
			manager = manager.substring(0, manager.indexOf('('));
			
			loadTaskList(project_no, manager);
		});
		
		function loadProject(mem_id) {
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath}/user/task/selectNotProjectList.do',
				dataType: 'json',
				data: {mem_id: mem_id},
				success: function(result) {
					if (result.notProjectList == 0) { // 맡은 프로젝트가 없을 시에 담당자와 상태를 감추고 프로젝트 선택 창에 데이터 없음 표시
						$('.select-project').empty();
						$('.select-project').append('<option>현재 진행 중인 프로젝트가 없습니다.</option>');
						$('.select-project').attr('disabled', 'disabled');
						$('.select-manager-area').hide();
					} else {
						$.each(result.notProjectList, function(index, item) {
							const project_no = '번호 : ' + item.PROJECT_NO;
							const project_title = '이름 : ' + item.PROJECT_TITLE;
							$('.select-project').append('<option>' + project_no + ' ' + project_title + '</option>');
						});
						
						let project_no = $('.select-project').select2('val');
						project_no = project_no.substring(project_no.indexOf(':') + 2, project_no.indexOf('이') - 1);
						
						loadManager(project_no);
					}
				},
				error: function(response, status, request) {
					alert(request.status);
				}
			});
		}

		function loadManager(project_no) {
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/task/selectProjectInfo.do',
				dataType : 'json',
				data : {
					project_no : project_no
				},
				success : function(result) {
					$('.select-manager').empty();
					if (result.projectInfo == 0) {
						$('.select-manager').append('<option>아직 프로젝트에 참여한 팀원이 없습니다.</option>')
					} else {
						const PL = $('<option>' + result.projectInfo.PL + '(PL)</option>');
						const DA = $('<option>' + result.projectInfo.DA + '(DA)</option>');
						const UA = $('<option>' + result.projectInfo.UA + '(UA)</option>');
						const TA = $('<option>' + result.projectInfo.TA + '(TA)</option>');
						const AA = $('<option>' + result.projectInfo.AA + '(AA)</option>');

						let chkPL = null;
						let chkDA = null;
						let chkUA = null;
						let chkTA = null;
						let chkAA = null;
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
						project_no = project_no.substring(project_no.indexOf(':') + 2, project_no.indexOf('이') - 1);
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
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath}/user/task/selectTaskList.do',
				dataType: 'json',
				data: {
					project_no: project_no,
					mem_id: mem_id
				},
				success: function(result) {
					$('.tasklist-area').empty();
					if (result.taskList == 0) {
						Swal.fire(
						  'INFO',
						  '현재 작업중인 기능이 존재하지 않습니다.',
						  'info'
						)
						$('.tasklist-area').append('<tr><td colspan="5"><div style="display: flex; justify-content: center;">데이터가 없습니다.</div></td></tr>');
					} else {
						$.each(result.taskList, function(index, item) {
							// 완료 text-primary
							let function_status = '';
							if (item.FUNCTION_STATUS == '신규') {
								function_status = '<span class="name mb-0 text-sm">신규</span>';
							} else {
								function_status = '<span class="name mb-0 text-sm text-primary">완료</span>';
							}
							
							// 우선순위 (낮음 : text-muted 보통 : text-primary 높음 : text-warning)
							let function_priority = '';
							if (item.FUNCTION_PRIORITY == '낮음') {
								function_priority = '<td class="status text-muted">낮음</td>';
							} else if (item.FUNCTION_PRIORITY == '보통') {
								function_priority = '<td class="status text-primary">보통</td>';
							} else if (item.FUNCTION_PRIORITY == '높음') {
								function_priority = '<td class="status text-warning">높음</td>';
							}
							
							const taskItem = $('' +
			                        '<tr>' +
			                        '<th scope="row">' +
			                        '<div class="media align-items-center">' +
			                        '<div class="media-body">' +
			                        function_status
			                        +
			                        '</div>' +
			                        '</div>' +
			                        '</th>' +
			                        function_priority
			                        +
			                        '<td>' +
			                        '<span class="badge badge-dot mr-4">' +
			                        '<span class="function-name">' + item.FUNCTION_NAME + '</span>' +
			                        '</span>' +
			                        '</td>' +
			                        '<td>' +
			                        '<div class="avatar-group">' +
			                        item.FUNCTION_MANAGER 
			                        +
			                        '</div>' +
			                        '</td>' +
			                        '<td>' +
			                        '<div class="d-flex align-items-center">' +
			                        '<span class="completion mr-2">' + item.FUNCTION_MODIDATE + '</span>' +
			                        '</div>' +
			                        '</td>' +
			                        '</tr>');
							
							$('.tasklist-area').append(taskItem);
						});
					}
				},
				error: function(response, status, request) {
					alert(response.status);
				}
			});
		}
	</script>
</body>
</html>