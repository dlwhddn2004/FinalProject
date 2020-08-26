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
    
<div class="row gantt">
  <div class="col">
    <div class="card">
      <!-- Card header -->
      <div class="card-header border-0">
        <h3 class="mb-0">GANTT 차트</h3>
        <div style="display: flex; width: 400px; margin: 10px 0px 10px 0px;">
          <select class="form-control select-project" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="프로젝트 선택">
          	<c:forEach items="${projectList }" var="item">
          		<option>번호 : ${item.PROJECT_NO } 이름 : ${item.PROJECT_TITLE }</option>
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
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

  <script>
    let project_no = $('.select-project').select2('val');
    project_no = project_no.substring(project_no.indexOf(':') + 2, project_no.indexOf('이') - 1);
    loadManager(project_no);
  
    // VIEW 버튼 이벤트
    $('.gantt .btn-view').on('click', function () {
      let project_no = $('.select-project').select2('val');
      project_no = project_no.substring(project_no.indexOf(':') + 2, project_no.indexOf('이') - 1);

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
      project_no_re = project_no_re.substring(project_no_re.indexOf(':') + 2, project_no_re.indexOf('이') - 1);
	  loadManager(project_no_re);
  	});
        
    // 기능들 조회해서 페이지에 표시
    function loadTaskList() {
    	let project_no = $('.gantt .select-project').select2('val');
    	project_no = project_no.substring(project_no.indexOf(':') + 2, project_no.indexOf('이') - 1);
    	
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
        			const listItem = ('<tr>\n' +
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
        		              '\t                  <span class="title mb-0 text-sm">' + item.FUNCTION_MANAGER + '</span>\n' +
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
				if (result.projectInfo == 0) {
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
  </script>