<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Start your development with a Dashboard for Bootstrap 4.">
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
<!-- Argon CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0"
	type="text/css">
<!-- DROPDOWN -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/select2/dist/css/select2.min.css">

<style>
.checklist-entry:hover .trashcan-icon-area::after {
	content: "\f1f8";
	font-family: "Font Awesome 5 Free";
	font-weight: 900;
	margin-left: 10px;
	cursor: pointer;
}

.trashcan-icon-area {
	display: inline-block;
	width: 20px;
}
</style>
</head>
<body>

	<div class="row">
		<div class="col-lg-6"
			style="display: flex; justify-content: space-between;">
			<div class="card" style="width: 750px;">
				<div class="card-header bg-transparent">
					<div style="display: flex; justify-content: space-between;">
						<div style="width: 400px;">
							<select class="form-control project-category"
								data-toggle="select" title="Simple select"
								data-placeholder="카테고리">
								<c:forEach items="${projectList }" var="item">
									<option>번호 : ${item.PROJECT_NO } 이름 : ${item.PROJECT_TITLE }</option>
								</c:forEach>
							</select>
						</div>
						<div>
							<button type="button" class="btn btn-default"
								onclick="viewType(this)">좌우 보기</button>
						</div>
					</div>
					<script>
	                  // 작업 내역 보기 방식 변경
	                  function viewType(e) {
	                    const item = $('.timeline-view-method');
	                    const className = $('.timeline-view-method').attr('class');
	
	                    if (className.indexOf('timeline-one-side') != -1) {
	                      // 포함되어 있음
	                      item.removeClass('timeline-one-side')
	                      $(e).text('한쪽 보기');
	                    } else {
	                      // 포함되어 있지않음
	                      item.addClass('timeline-one-side');
	                      $(e).text('좌우 보기');
	                    }
	                  }
	                </script>
				</div>
				<div class="card-body" style="overflow: auto; height: 700px;">
					<div class="timeline timeline-view-method timeline-one-side timeline-list-area"
						data-timeline-content="axis" data-timeline-axis-style="dashed">

					</div>
				</div>
			</div>
		</div>
		<div class="card" style="width: 800px;">
			<!-- Card header -->
			<div class="card-header"
				style="display: flex; justify-content: space-between; height: 60px;">
				<!-- Title -->
				<h5 class="h3 mb-0" style="display: inline-block">할 일 목록</h5>
				<a class="btn btn-sm btn-neutral" data-toggle="modal"
					data-target="#modal-form" style="height: 25px;">등록</a>
			</div>
			<!-- Card body -->
			<div class="card-body p-0" style="overflow: auto; height: 700px">
				<!-- List group -->
				<ul class="list-group list-group-flush todo-list-ul"
					data-toggle="checklist">
				</ul>
			</div>
		</div>
	</div>
	</div>

	<div class="col-md-4">
		<div class="modal fade" id="modal-form" tabindex="-1" role="dialog"
			aria-labelledby="modal-form" aria-hidden="true">
			<div class="modal-dialog modal- modal-dialog-centered modal-sm"
				role="document">
				<div class="modal-content">
					<div class="modal-body p-0">
						<div class="card-body px-lg-5 py-lg-5">
							<div class="text-center text-muted mb-4">
								<h2>TODO LIST</h2>
							</div>
							<div class="text-center text-muted mb-4">
								<small>새로 등록해야 할 일을 입력해주세요.</small>
							</div>
							<div class="form-group mb-3">
								<small>제목</small>
								<div
									class="input-group input-group-merge input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="fas fa-list-ul"></i></span>
									</div>
									<input class="form-control ipt-todo-title" placeholder="제목"
										type="text">
								</div>
							</div>
							<div style="margin: 25px 0px 25px 0px;">
								<small>카테고리</small> 
								<select class="form-control todo-category"
									data-toggle="select" title="Simple select"
									data-placeholder="카테고리">
									<option>SUCCESS</option>
									<option>INFORMATION</option>
									<option>WARNING</option>
									<option>DANGER</option>
								</select>
							</div>
							<div class="form-group">
								<small>날짜</small>
								<div class="form-group">
									<div class='input-group date' id='datetimepicker1'>
										<input type='text' class="form-control ipt-todo-regdate" /> <span
											class="input-group-addon input-group-append">
											<button class="btn btn-outline-primary" type="button"
												id="button-addon2">
												<span class="fa fa-calendar"></span>
											</button>
										</span>
									</div>
								</div>
							</div>
							<div class="text-center">
								<button type="button" class="btn btn-primary my-4"
									data-dismiss="modal" onclick="insertTodoList()">등록</button>
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
		src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datetimepicker.js"></script>
	<!-- Argon JS -->
	<script
		src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

	<script>
    $(function () {
      $('#datetimepicker1').datetimepicker({
        icons: {
          time: "fa fa-clock",
          date: "fa fa-calendar-day",
          up: "fa fa-chevron-up",
          down: "fa fa-chevron-down",
          previous: 'fa fa-chevron-left',
          next: 'fa fa-chevron-right',
          today: 'fa fa-screenshot',
          clear: 'fa fa-trash',
          close: 'fa fa-remove'
        }
      });
    });

    $('.todo-category').select2('val', 'reset');
    
    // loadTodoData
    function loadTodoList(project_no) {
    	// ajax로 데이터 추가
        $.ajax({
  			type: 'POST'
  			,url: '${pageContext.request.contextPath}/user/project/selectTodo.do'
  			,dataType: 'json'
  			,data: {project_no: project_no,
  				    mem_id: '${MEMBER_LOGININFO.mem_id}'}
  			,success: function(result) {
  				$('.todo-list-ul').empty();
  				$.each(result.todoList, function(index, todoList) {
  					const todo_item = $('' +
    			              '<li class="checklist-entry list-group-item flex-column align-items-start py-4 px-4">' +
    			              '<div class="checklist-item checklist-item-' + todoList.TODO_CATEGORY + '">' +
    			              '<div class="checklist-' + todoList.TODO_CATEGORY + '">' +
    			              '<h5 class="checklist-title mb-0">' + todoList.TODO_TITLE + '<input type="hidden" name="todo_seq" value="' + todoList.TODO_SEQ + '"></h5>' +
    			              '<small>' + todoList.TODO_REGDATE + '</small>' +
    			              '</div>' +
    			              '<div>' +
    			              '<div class="custom-control custom-checkbox custom-checkbox-' + todoList.TODO_CATEGORY + '">' +
    			              '<a class="trashcan-icon-area"></a>' +
    			              '</div>' +
    			              '</div>' +
    			              '</div>' +
    			              '</li>');
  	  		        $('.todo-list-ul').append(todo_item);
  				});
  			}
  			,error: function(response, status, request) {
  				alert(request.status);
  			}
  		});
    }
    
    // loadTimeline
    function loadTimeline(project_no) {
    	$.ajax({
			type: 'POST'
			,url: '${pageContext.request.contextPath}/user/project/selectTimeline.do'
			,dataType: 'json'
			,data: {project_no: project_no,
				    mem_id: '${MEMBER_LOGININFO.mem_id}'}
			,success: function(result) {
				$.each(result.timelineList, function(index, timelineList) {
					const tag_arr = timelineList.TIMELINE_TAG.split(',');
					let tag_str = "";
					$.each(tag_arr, function(index, tag_arr) {
						tag_str += '<span class="badge badge-pill badge-success">' + tag_arr + '</span>';
					});
					const $timelineItem = $('' +
				            '<div class="timeline-block">' +
				            '<span class="timeline-step badge-success">' +
				            '<i class="ni ni-bell-55"></i>' +
				            '</span>' +
				            '<div class="timeline-content">' +
				            '<small class="text-muted font-weight-bold">' + timelineList.TIMELINE_DATE + '</small>' +
				            '<h5 class=" mt-3 mb-0">' + timelineList.TIMELINE_TITLE + '</h5>' +
				            '<p class=" text-sm mt-1 mb-0">' + timelineList.TIMELINE_CONTENT + '</p>' +
				            '<div class="mt-3">' +
				            tag_str +
				            '</div>' +
				            '</div>' +
				            '</div>');
					$('.timeline-list-area').append($timelineItem);
				});
			}
			,error: function(response, status, request) {
				alert(request.status);
			}
		});
    }
    
    // Project List 선택 시!
    $(document.body).on("change",".project-category", function(){
	  let project_no = $('.project-category').select2('val');
	  project_no = project_no.substring(project_no.indexOf(':') + 2, project_no.indexOf('이') - 1);
	  
	  loadTimeline(project_no);
	  loadTodoList(project_no);
	});
    
    
    let first_project_no = $('.project-category').select2('val');
    first_project_no = first_project_no.substring(first_project_no.indexOf(':') + 2, first_project_no.indexOf('이') - 1);
    // TIMELINE List 로딩!
    loadTimeline(first_project_no);
    
    // TODO List 로딩!
    loadTodoList(first_project_no);
    
    // Todo 추가!
    function insertTodoList() {
      const todo_title = $('.ipt-todo-title').val();
      let project_no = $('.project-category').select2('val');
	  project_no = project_no.substring(project_no.indexOf(':') + 2, project_no.indexOf('이') - 1);
      let todo_category = $('.todo-category').select2('val');
      if (todo_category === "SUCCESS") {
        todo_category = "success";
      } else if (todo_category === "INFORMATION") {
        todo_category = "info";
      } else if (todo_category === "WARNING") {
        todo_category = "warning";
      } else if (todo_category === "DANGER") {
        todo_category = "danger";
      }
      const todo_regdate = $('.ipt-todo-regdate').val();

      // ajax로 데이터 추가
      $.ajax({
			type: 'POST'
			,url: '${pageContext.request.contextPath}/user/project/insertTodo.do'
			,dataType: 'json'
			,data: {project_no: project_no,
				    mem_id: '${MEMBER_LOGININFO.mem_id}',
				    todo_title: todo_title,
				    todo_category: todo_category}
			,success: function(result) {
			  // ajax 성공 시 프론트쪽에 표시
		      const todo_item = $('' +
		              '<li class="checklist-entry list-group-item flex-column align-items-start py-4 px-4">' +
		              '<div class="checklist-item checklist-item-' + todo_category + '">' +
		              '<div class="checklist-' + todo_category + '">' +
		              '<h5 class="checklist-title mb-0">' + todo_title + '<input type="hidden" name="todo_seq" value="' + result.result + '"></h5>' +
		              '<small>' + todo_regdate + '</small>' +
		              '</div>' +
		              '<div>' +
		              '<div class="custom-control custom-checkbox custom-checkbox-' + todo_category + '">' +
		              '<a class="trashcan-icon-area"></a>' +
		              '</div>' +
		              '</div>' +
		              '</div>' +
		              '</li>');
		      $('.todo-list-ul').append(todo_item);
			      
			  // 한번 등록하면 초기화
		      $('.ipt-todo-title').val('');
		      $('.todo-category').select2('val', 'reset');
		      $('.ipt-todo-regdate').val('');
			}
			,error: function(response, status, request) {
				alert(request.status);
			}
		});
    }

    // Todo 데이터 삭제!
    $(document).on('click', '.trashcan-icon-area', function () {
      const todo_seq = $(this).parent().parent().parent().find('input[name=todo_seq]').val();
      const removeObj = $(this).parent().parent().parent().parent();
      
      // ajax로 데이터 삭제
      $.ajax({
			type: 'POST'
			,url: '${pageContext.request.contextPath}/user/project/deleteTodo.do'
			,dataType: 'json'
			,data: {todo_seq: todo_seq}
			,success: function(result) {
				if (result.result === 'Y') {
 					removeObj.remove();
				} else if (result === 'N') {
					Swal.fire(
					  'warning',
					  'TODO 리스트 삭제에 실패했습니다.',
					  'warning'
					)
				}
			}
			,error: function(response, status, request) {
				alert(request.status);
			}
		});
    });
  </script>

</body>
</html>