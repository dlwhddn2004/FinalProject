<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Favicon -->
<link rel="icon" href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" type="image/png">
<!-- Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/nucleo/css/nucleo.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
<!-- Page plugins -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/select2/dist/css/select2.min.css">
<!-- Argon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">
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
    
<div class="row gantt">
  <div class="col">
    <div class="card">
      <!-- Card header -->
      <div class="card-header border-0">
        <h3 class="mb-0">GANTT 차트</h3>
        <div style="display: flex; width: 400px; margin: 10px 0px 10px 0px;">
          <select class="form-control select-project" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="프로젝트 선택">
          	<c:forEach items="${projectList }" var="item">
          		<option value="${item.PROJECT_NO }">${item.PROJECT_TITLE }</option>
          	</c:forEach>
          </select>
          <div style="margin: 0px 0px 0px 10px;">
            <button type="button" class="btn btn-outline-primary btn-view" data-toggle="tooltip" data-placement="top" title="해당 프로젝트 상세 정보로 이동합니다.">VIEW</button>
          </div>
        </div>
        <div class="accordion" id="accordionExample">
          <div class="card" style="width: 400px; margin: 10px 0px 10px 0px;">
            <div class="card-header" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
              <h5 class="mb-0">검색 조건</h5>
            </div>
            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
              <div class="card-body">
                <small style="color: #2e2e2e; margin: 0px 10px 0px 0px">상태</small>
                <br>
                <div>
	                <div class="custom-control custom-radio custom-control-inline">
	                  <input type="radio" id="function-status-radio1" name="function-status-radio" class="custom-control-input" value="전체" checked>
	                  <label class="custom-control-label" for="function-status-radio1">전체</label>
	                </div>
	                <div class="custom-control custom-radio custom-control-inline">
	                  <input type="radio" id="function-status-radio2" name="function-status-radio" class="custom-control-input" value="신규">
	                  <label class="custom-control-label" for="function-status-radio2">신규</label>
	                </div>
	                <div class="custom-control custom-radio custom-control-inline">
	                  <input type="radio" id="function-status-radio3" name="function-status-radio" class="custom-control-input" value="완료">
	                  <label class="custom-control-label" for="function-status-radio3">완료</label>
	                </div>
                </div>
                <br>
                <small style="color: #2e2e2e; margin: 0px 0px 0px 0px">제목</small>
                <div class="form-group">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <div class="input-group-text">
                        <input type="checkbox" class="checkbox-title checkbox-title" aria-label="Checkbox for following text input" value="on">
                      </div>
                    </div>
                    <input type="text" class="form-control ipt-function-name" aria-label="Text input with checkbox" placeholder="제목을 입력해주세요.">
                  </div>
                </div>
                <small style="color: #2e2e2e; margin: 0px 10px 0px 0px">담당자</small>
                <div class="form-group">
                  <select class="form-control select-manager" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="담당자">
                  </select>
                </div>
                <button type="button" class="btn btn-secondary btn-lg btn-block btn-search">검색하기</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Light table -->
      <div class="table-responsive" data-toggle="list" data-list-values='["name", "regdate", "enddate", "progress"]'>
        <table class="table align-items-center table-flush">
          <thead class="thead-light">
            <tr>
              <th scope="col">제목</th>
              <th scope="col">시작일</th>
              <th scope="col">마감일</th>
              <th scope="col">담당자</th>
              <th scope="col">상태</th>
              <th scope="col" colspan="2">진척도</th>
            </tr>
          </thead>
          <tbody class="list gantt-data-body">
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
								    <a class="btn btn-sm btn-neutral btn-delete-here" style="height: 25px;" onclick="deleteTask(this);">삭제</a>
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
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js-cookie/js.cookie.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
<!-- Optional JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/list.js/dist/list.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
<script 
	src="${pageContext.request.contextPath}/assets/vendor/nouislider/distribute/nouislider.min.js"></script>
<script 
	src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

  <script>
  	let var_project_function_no = '';
  	let var_mem_id = '';
  
    let project_no = $('.select-project').select2('val');
    loadManager(project_no);
  
    // VIEW 버튼 이벤트
    $('.gantt .btn-view').on('click', function () {
      let project_no = $('.select-project').select2('val');

      // location.href = '';
    });

    // 검색 조건 검색 버튼 이벤트
    $('.gantt .btn-search').on('click', function () {
      loadTaskList();
    });
    
    // 프로젝트 변경 시 이벤트
    $(document.body).on("change",".gantt .select-project", function(){
  	  $('.gantt #function-status-radio1').prop('checked', true);
  	  $('.gantt .checkbox-title').prop('checked', false);
  	  $('.gantt .ipt-function-name').val('');
  	  
  	  let project_no_re = $('.select-project').select2('val');
	  loadManager(project_no_re);
  	});
        
    // 기능들 조회해서 페이지에 표시
    function loadTaskList() {
    	let project_no = $('.gantt .select-project').select2('val');
    	
    	let mem_id = $('.gantt .select-manager').select2('val');
    	mem_id = mem_id.substring(0, mem_id.indexOf(' '));
    	
    	const function_status = $('.gantt input[name=function-status-radio]:checked').val();
    	
    	const chkbox_status = $('.gantt .checkbox-title:checked').val();
    	
    	let function_name = $('.gantt .ipt-function-name').val();
		if (chkbox_status == undefined) {
			function_name = '없음';
    	}
    	
    	let function_manager = $('.gantt .select-manager').select2('val');
    	if (function_manager !== '조건없음') {
    	  function_manager = function_manager.substring(0, function_manager.indexOf(' '));
    	}
    	
    	$.ajax({
    		type: 'POST',
    		url: '${pageContext.request.contextPath}/user/task/selectTaskList.do',
    		dataType: 'json',
    		data: {
    			project_no: project_no,
    			function_status: function_status,
    			chkbox_status: chkbox_status,
    			function_name: function_name,
    			function_manager: function_manager
    		},
    		success: function(result) {
    			$('.gantt .gantt-data-body').empty();
    			$.each(result.taskList, function(index, item) {
    				let color = '';
        			if (item.FUNCTION_PROGRESS != '100') {
        				color = 'warning';
        			} else {
        				color = 'success';
        			}
        			
        			// 완료 text-primary
					let function_status = '';
					if (item.FUNCTION_STATUS == '신규') {
						function_status = '<span class="name mb-0 text-sm">신규</span>';
					} else {
						function_status = '<span class="name mb-0 text-sm text-primary">완료</span>';
					}
        			const listItem = ('<tr  data-toggle="modal" data-target="#modal-form" style="cursor: pointer;" onclick="beforeModal(this)">\n' +
        					  '\t            <input type="hidden" name="project_function_no" value="' + item.PROJECT_FUNCTION_NO + '">' +
        		              '\t            <th scope="row">\n' +
        		              '\t              <div class="media align-items-center">\n' +
        		              '\t                <div class="media-body">\n' +
        		              '\t                  <span class="title mb-0 text-sm">' + item.FUNCTION_NAME + '</span>\n' +
        		              '\t                </div>\n' +
        		              '\t              </div>\n' +
        		              '\t            </th>\n' +
        		              '\t            <td class="regdate">\n' +
        		              '\t              ' + item.FUNCTION_REGDATE + '\n' +
        		              '\t            </td>\n' +
        		              '\t            <td>\n' +
        		              '\t              ' + item.FUNCTION_ENDDATE + '\n' +
        		              '\t            </td>\n' +
        		              '\t            <td>\n' +
        		              '\t              <div class="avatar-group">\n' +
        		              '\t                  <span class="title mb-0 text-sm function_manager">' + item.FUNCTION_MANAGER + '</span>\n' +
        		              '\t              </div>\n' +
        		              '\t            </td>\n' +
        		              '\t            <td>\n' +
        		              '\t              <div class="avatar-group">\n' +
        		              function_status +
        		              '\t              </div>\n' +
        		              '\t            </td>\n' +
        		              '\t            <td colspan="2">\n' +
        		              '\t              <div class="d-flex align-items-center">\n' +
        		              '\t                <span class="completion mr-2">' + item.FUNCTION_PROGRESS + '%</span>\n' +
        		              '\t                <div>\n' +
        		              '\t                  <div class="progress">\n' +
        		              '\t                    <div class="progress-bar bg-' + color + '" role="progressbar" aria-valuenow="' + item.FUNCTION_PROGRESS + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + item.FUNCTION_PROGRESS + '%;"></div>\n' +
        		              '\t                  </div>\n' +
        		              '\t                </div>\n' +
        		              '\t              </div>\n' +
        		              '\t            </td>\n' +
        		              '\t          </tr>');
        			$('.gantt .gantt-data-body').append(listItem);
    			});
    		},
    		error: function(response, status, request) {
    			alert(response.status);
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
				$('.gantt .select-manager').empty();
				if (result.projectInfo == null) {
					$('.gantt .select-manager').append('<option>아직 프로젝트에 참여한 팀원이 없습니다.</option>')
				} else {
					const PL = $('<option>' + result.projectInfo.PL + ' (PL)</option>');
					const DA = $('<option>' + result.projectInfo.DA + ' (DA)</option>');
					const UA = $('<option>' + result.projectInfo.UA + ' (UA)</option>');
					const TA = $('<option>' + result.projectInfo.TA + ' (TA)</option>');
					const AA = $('<option>' + result.projectInfo.AA + ' (AA)</option>');
					
					$('.gantt .select-manager').append('<option>조건없음</option>');
					if (result.projectInfo.PL != null) {
						$('.gantt .select-manager').append(PL);
						chkPL = result.projectInfo.PL;
					}
					if (result.projectInfo.DA != null) {
						$('.gantt .select-manager').append(DA);
						chkDA = result.projectInfo.DA;
					}
					if (result.projectInfo.UA != null) {
						$('.gantt .select-manager').append(UA);
						chkUA = result.projectInfo.UA;
					}
					if (result.projectInfo.TA != null) {
						$('.gantt .select-manager').append(TA);
						chkTA = result.projectInfo.TA;
					}
					if (result.projectInfo.AA != null) {
						$('.gantt .select-manager').append(AA);
						chkAA = result.projectInfo.AA;
					}
					
					loadTaskList();
				}
			},
			error : function(response, status, request) {
				alert(request.status);
			}
		});
	}
    
    // 기능 선택했을 때 모달창이 켜지는데 켜지기 전 콜백 함수!
    function beforeModal(e) {
    	const project_no = $('.gantt .select-project').select2('val');
    	let project_function_no_all = $(e).find('input[name=project_function_no]').val();
    	var_project_function_no = project_function_no_all;
		
    	const mem_id = $(e).find('.function_manager').text();
    	var_mem_id = $(e).find('.function_manager').text();
    	
    	// 현재 선택한 기능의 PK 값을 이용해 기능의 정보를 조회해온다.
    	$.ajax({
    		type: 'POST',
    		url: '${pageContext.request.contextPath}/user/task/selectTaskInfo.do',
    		dataType: 'json',
    		data: {
    			project_function_no: project_function_no_all
    		},
    		async: true,
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
    		error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
    	});
    	
    	let chkPosition = '';
    	$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/task/checkPosition.do',
			dataType : 'json',
			data : {
				project_no : project_no,
				mem_id: mem_id
			},
			success : function(result) {
				chkPosition = result.result;
			},
			error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
		});
    	
    	// 현재 선택한 기능이 속한 프로젝트에 참여하는 팀원들을 조회해서 select2를 구성한다.
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
			error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
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
			error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
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
		const project_no = $('.gantt .select-project').select2('val');
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
		
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/user/task/updateTask.do',
			dataType: 'json',
			data: {
				project_function_no: var_project_function_no,
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
					
					loadManager(project_no);
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
	});
	
	function deleteTask(e) {
		const project_no = $('.gantt .select-project').select2('val');
		
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/user/task/deleteTask.do',
			dataType: 'json',
			data: {
				project_function_no: var_project_function_no,
				mem_id: var_mem_id,
				project_no: project_no
			},
			success: function(result) {
				$('#modal-form').modal("hide");
				
				loadManager(project_no);
			},
			error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
		})
	}
  </script>