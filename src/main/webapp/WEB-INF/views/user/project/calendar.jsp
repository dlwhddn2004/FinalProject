<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	
<style>
  .fc-time {
    color: white;
  }
</style>

<div class="row calendar">
	<div class="col">
		<!-- Fullcalendar -->
		<div class="card card-calendar">
			<div
				class="header header-dark bg-default pb-6 content__title content__title--calendar">
				<div class="container-fluid">
					<div class="row align-items-center py-4">
						<div class="col-lg-6">
							<h6 class="fullcalendar-title h2 text-white d-inline-block mb-0">Full
								calendar</h6>
						</div>
						<div class="col-lg-6 mt-3 mt-lg-0 text-lg-right">
							<a href="#" class="fullcalendar-btn-prev btn btn-sm btn-neutral">
								<i class="fas fa-angle-left"></i>
							</a> <a href="#" class="fullcalendar-btn-next btn btn-sm btn-neutral">
								<i class="fas fa-angle-right"></i>
							</a> <a href="#" class="btn btn-sm btn-neutral"
								data-calendar-view="month">Month</a> <a href="#"
								class="btn btn-sm btn-neutral" data-calendar-view="basicWeek">Week</a>
							<a href="#" class="btn btn-sm btn-neutral"
								data-calendar-view="basicDay">Day</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Card header -->
			<div class="card-header">
				<!-- Title -->
				<h5 class="h3 mb-0">Calendar</h5>
			</div>
			<!-- Card body -->
			<div class="card-body p-0">
				<div class="calendar" data-toggle="calendar" id="calendar">
				<input type="hidden" name="project_no" value="${project_no }">
				</div>
			</div>
		</div>
		<!-- Modal - Add new event -->
		<!--* Modal header *-->
		<!--* Modal body *-->
		<!--* Modal footer *-->
		<!--* Modal init *-->
		<div class="modal fade" id="new-event" tabindex="-1" role="dialog"
			aria-labelledby="new-event-label" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-secondary"
				role="document">
				<div class="modal-content">
					<!-- Modal body -->
					<div class="modal-body">
						<form class="new-event--form">
							<div class="form-group">
								<label class="form-control-label">이벤트 제목</label> 
								<input type="text" class="form-control form-control-alternative new-event--title" placeholder="제목을 입력해주세요.">
							</div>
							<div class="form-group mb-0">
								<label class="form-control-label d-block mb-3">색상</label>
								<div
									class="btn-group btn-group-toggle btn-group-colors event-tag"
									data-toggle="buttons">
									<label class="btn bg-info active">
										<input type="radio" name="event-tag" value="bg-info" autocomplete="off" checked>
									</label>
									<label class="btn bg-warning">
										<input type="radio" name="event-tag" value="bg-warning" autocomplete="off"></label>
									<label class="btn bg-danger">
										<input type="radio" name="event-tag" value="bg-danger" autocomplete="off"></label>
									<label class="btn bg-success">
										<input type="radio" name="event-tag" value="bg-success" autocomplete="off"></label>
									<label class="btn bg-default">
										<input type="radio" name="event-tag" value="bg-default" autocomplete="off"></label>
									<label class="btn bg-primary">
									<input type="radio" name="event-tag" value="bg-primary" autocomplete="off"></label>
								</div>
							</div>
							<div style="margin: 15px 0px 0px 0px;">
								<div>
									<label class="form-control-label d-block mb-3">하루 종일</label>
								</div>
								<label class="custom-toggle">
								    <input class="allday-toggle" type="checkbox" value="on">
								    <span class="custom-toggle-slider rounded-circle" data-label-off="No" data-label-on="Yes"></span>
								</label>
							</div>
							<div style="display: flex; justify-content: space-between; margin: 15px 0px 0px 0px;">
								<div>
									<label class="form-control-label d-block mb-3">시작일</label>
									<div class="input-group">
								        <div class="input-group-prepend">
								            <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
								        </div>
								        <input class="form-control datepicker event-start-date" placeholder="Select date" type="text" value="01/01/2020">
								    </div>
								</div>
								<div style="width: 200px;">
									<label class="form-control-label d-block mb-3">시작 시간</label>
									<div class="input-group">
								        <div class="input-group-prepend">
								            <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
								        </div>
								        <input class="form-control event-start-time" type="time" value="09:00" id="example-time-input1">
								    </div>
								</div>
							</div>
							<div style="display: flex; justify-content: space-between; margin: 15px 0px 0px 0px;">
								<div>
									<label class="form-control-label d-block mb-3">종료일</label>
									<div class="input-group">
								        <div class="input-group-prepend">
								            <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
								        </div>
								        <input class="form-control datepicker event-end-date" placeholder="Select date" type="text" value="01/01/2020">
								    </div>
								</div>
								<div style="width: 200px;">
									<label class="form-control-label d-block mb-3">종료 시간</label>
									<div class="input-group">
								        <div class="input-group-prepend">
								            <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
								        </div>
								        <input class="form-control event-end-time" type="time" id="example-time-input2">
								    </div>
								</div>
							</div>
							<div class="form-group" style="margin: 10px 0px 0px 0px;">
								<label class="form-control-label">상세 내용</label>
								<textarea
									class="form-control form-control-alternative add-event--description textarea-autosize"
									placeholder="상세 내용을 입력해주세요."></textarea>
								<i class="form-group--bar"></i>
							</div>
 						</form>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary new-event--add">일정 추가</button>
						<button type="button" class="btn btn-link ml-auto" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal - Edit event -->
		<!--* Modal body *-->
		<!--* Modal footer *-->
		<!--* Modal init *-->
		<div class="modal fade" id="edit-event" tabindex="-1" role="dialog"
			aria-labelledby="edit-event-label" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-secondary"
				role="document">
				<div class="modal-content">
					<!-- Modal body -->
					<div class="modal-body">
						<form class="edit-event--form">
							<div class="form-group edit-event-title-div">
								<label class="form-control-label">이벤트 제목</label> <input
									type="text"
									class="form-control form-control-alternative edit-event--title"
									placeholder="제목을 입력해주세요.">
							</div>
							<div class="form-group">
								<label class="form-control-label d-block mb-3">색상</label>
								<div
									class="btn-group btn-group-toggle btn-group-colors event-tag mb-0"
									data-toggle="buttons">
									<label class="btn bg-info active"><input type="radio"
										name="event-tag" value="bg-info" autocomplete="off" checked></label>
									<label class="btn bg-warning"><input type="radio"
										name="event-tag" value="bg-warning" autocomplete="off"></label>
									<label class="btn bg-danger"><input type="radio"
										name="event-tag" value="bg-danger" autocomplete="off"></label>
									<label class="btn bg-success"><input type="radio"
										name="event-tag" value="bg-success" autocomplete="off"></label>
									<label class="btn bg-default"><input type="radio"
										name="event-tag" value="bg-default" autocomplete="off"></label>
									<label class="btn bg-primary"><input type="radio"
										name="event-tag" value="bg-primary" autocomplete="off"></label>
								</div>
							</div>
							<div class="form-group">
								<label class="form-control-label">상세 내용</label>
								<textarea
									class="form-control form-control-alternative edit-event--description textarea-autosize"
									placeholder="상세 내용을 입력해주세요."></textarea>
								<i class="form-group--bar"></i>
							</div>
							<input type="hidden" class="edit-event--id">
						</form>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button class="btn btn-primary" data-calendar="update">수정</button>
						<button class="btn btn-danger" data-calendar="delete">삭제</button>
						<button class="btn btn-link ml-auto" data-dismiss="modal">닫기</button>
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
	src="${pageContext.request.contextPath}/assets/vendor/moment/min/moment.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/fullcalendar/dist/fullcalendar.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script 
	src="${pageContext.request.contextPath }/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Argon JS -->
<script
	src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>