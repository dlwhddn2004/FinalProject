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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fullcalendar/dist/fullcalendar.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/select2/dist/css/select2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css/animate.min.css">
<!-- Argon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">

<style>
    .modal-position-center {
        transform: translate(-300px, 0px) !important;
    }
    
    .fc-time {
	    color: white;
	}
</style>

<input type="hidden" name="check-currentPage-forCalendar" value="interviewCalendar">
<input type="hidden" name="project_no_hidden" value="${param.project_no }">;
<div class="row interview">
  <div class="col">
    <!-- 탭 -->
    <div class="nav-wrapper">
      <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
        <li class="nav-item">
          <a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true"><i class="ni ni-cloud-upload-96 mr-2"></i>면접 일정</a>
        </li>
        <li class="nav-item apply-list-tab-btn">
          <a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-3-tab" data-toggle="tab" href="#tabs-icons-text-3" role="tab" aria-controls="tabs-icons-text-3" aria-selected="false"><i class="ni ni-calendar-grid-58 mr-2"></i>신청자 명단</a>
        </li>
        <li class="nav-item apply-list-tab-btn">
          <a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-2-tab" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false"><i class="ni ni-calendar-grid-58 mr-2"></i>면접 결과</a>
        </li>
      </ul>
    </div>
    <div class="card shadow">
      <div class="card-body">
        <div class="tab-content" id="myTabContent">
          <div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
            <!-- Fullcalendar -->
            <div class="card card-calendar">
              <div class="header header-dark bg-default pb-6 content__title content__title--calendar">
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
          </div>
          <div class="tab-pane fade" id="tabs-icons-text-3" role="tabpanel" aria-labelledby="tabs-icons-text-3-tab">
            <!-- 지원자 목록 -->
            <div class="card div-apply-table-list">
              <!-- Card header -->
              <div class="card-header border-0">
                <div class="row" style="display: flex; justify-content: space-between;">
                  <div class="col-6">
                    <h3 class="mb-0 main-title">명단 조회</h3>
                  </div>
                  <div>
                  	<button type="button" class="btn btn-outline-primary btn-sm btn-view-category">면접자</button>
                  	<c:if test="${projectInfo.PROJECT_HIRESTATUS == 'N' }">
                  		<button type="button" class="btn btn-outline-primary btn-sm btn-end-hire">모집 마감</button>
                  	</c:if>
                  </div>
                </div>
                <small class="text-muted sub-title">지원자 조회</small>
              </div>
              <!-- Light table -->
              <div class="table-responsive">
                <table class="table align-items-center table-flush">
                  <thead class="thead-light">
                  <tr>
                    <th>이름</th>
                    <th>나이</th>
                    <th>보유 기술</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody class="apply-list_data_input-area">
<!--                     LIST DATA -->
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="tab-pane fade" id="tabs-icons-text-2" role="tabpanel" aria-labelledby="tabs-icons-text-2-tab">
          	<div class="nav-wrapper">
			    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
			        <li class="nav-item">
			            <a class="nav-link mb-sm-3 mb-md-0 active" id="final-tabs-icons-text-1-tab" data-toggle="tab" href="#final-tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true"><i class="fas fa-users mr-2"></i></i>명단</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link mb-sm-3 mb-md-0" id="final-tabs-icons-text-2-tab" data-toggle="tab" href="#final-tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false"><i class="fas fa-id-card-alt mr-2"></i></i>최종 합격자</a>
			        </li>
			    </ul>
			</div>
			<div class="card shadow">
			    <div class="card-body">
			        <div class="tab-content tab3-btn" id="myTabContent">
			            <div class="tab-pane fade show active tab-tab1" id="final-tabs-icons-text-1" role="tabpanel" aria-labelledby="final-tabs-icons-text-1-tab">
			            	<!-- 명단 -->
							<div class="card">
							  <!-- Card header -->
							  <div class="card-header border-0">
							    <div class="row">
							      <div class="col-6">
							      </div>
							      <div class="col-6 text-right">
							        <button type="button" class="btn btn-outline-primary btn-sm btn-interview-success"><i class="fas fa-id-card-alt mr-2"></i>합격</button>
							        <button type="button" class="btn btn-outline-danger btn-sm btn-interview-fail"><i class="fas fa-trash mr-2"></i>탈락</button>
							      </div>
							    </div>
							  </div>
							  <!-- Light table -->
							  <div class="table-responsive">
							    <table class="table align-items-center table-flush table-hover">
							      <thead class="thead-light">
							        <tr>
							          <th>이름</th>
							          <th>이메일</th>
							          <th>최종 평가 등급</th>
							          <th>여부</th>
							        </tr>
							      </thead>
							      <tbody>
<!-- 							        <tr> -->
<!-- 							          <td class="table-user"> -->
<!-- 							            <b>김은대</b> -->
<!-- 							          </td> -->
<!-- 							          <td> -->
<!-- 							            <span class="text-muted">31세</span> -->
<!-- 							          </td> -->
<!-- 							          <td> -->
<!-- 							            <i class="fas fa-star" style="color: #ff4a1c;"></i> -->
<!-- 							            <i class="fas fa-star" style="color: #ff4a1c;"></i> -->
<!-- 							            <i class="fas fa-star" style="color: #ff4a1c;"></i> -->
<!-- 							            <i class="fas fa-star" style="color: #ff4a1c;"></i> -->
<!-- 							            <i class="far fa-star" style="color: #ff4a1c;"></i> -->
<!-- 							          </td> -->
<!-- 							          <td> -->
<!-- 							            <label class="custom-toggle"> -->
<!-- 							              <input type="checkbox"> -->
<!-- 							              <span class="custom-toggle-slider rounded-circle" data-label-off="No" data-label-on="Yes"></span> -->
<!-- 							            </label> -->
<!-- 							          </td> -->
<!-- 							        </tr> -->
							      </tbody>
							    </table>
							  </div>
							</div>
			            </div>
			            <div class="tab-pane fade tab-tab2" id="final-tabs-icons-text-2" role="tabpanel" aria-labelledby="final-tabs-icons-text-2-tab">
			            	<!-- 최종 합격자 -->
							<div class="card">
							  <!-- Card header -->
							  <div class="card-header border-0">
							    <div class="row">
							      <div class="col-6">
							      </div>
							      <div class="col-6 text-right">
							      	<div>
							      		
							      	</div>
							      	<div>
							      		<small class="text-muted">최종 합격자에게 역할을 배정해주세요.</small>
							      	</div>
							      </div>
							    </div>
							  </div>
							  <!-- Light table -->
							  <div class="table-responsive success-interviewee-table">
							    <table class="table align-items-center table-flush">
							      <thead class="thead-light">
							        <tr>
							          <th>이름</th>
							          <th>이메일</th>
							          <th>최종 평가 등급</th>
							          <th></th>
							        </tr>
							      </thead>
							      <tbody>
<!-- 							        <tr> -->
<!-- 							          <td class="table-user"> -->
<!-- 							            <img src="../../assets/img/theme/team-1.jpg" class="avatar rounded-circle mr-3"> -->
<!-- 							            <b>김재석</b> -->
<!-- 							          </td> -->
<!-- 							          <td> -->
<!-- 							            <span class="text-muted">iai6203@gmail.com</span> -->
<!-- 							          </td> -->
<!-- 							          <td> -->
<!-- 							            <i class="fas fa-star" style="color: #ff4a1c;"></i> -->
<!-- 							            <i class="fas fa-star" style="color: #ff4a1c;"></i> -->
<!-- 							            <i class="fas fa-star" style="color: #ff4a1c;"></i> -->
<!-- 							            <i class="fas fa-star" style="color: #ff4a1c;"></i> -->
<!-- 							            <i class="far fa-star" style="color: #ff4a1c;"></i> -->
<!-- 							          </td> -->
<!-- 							          <td class="table-actions"> -->
<!-- 							            <a class="table-action assign-role-btn" data-toggle="tooltip" data-original-title="역할 배정" style="cursor: pointer;"> -->
<!-- 							              <i class="fas fa-briefcase"></i> -->
<!-- 							              <input type="hidden" name="mem_id" value=""> -->
<!-- 							            </a> -->
<!-- 							          </td> -->
<!-- 							        </tr> -->
							      </tbody>
							    </table>
							  </div>
							</div>
			            </div>
			        </div>
			    </div>
			</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 역할 배정 모달 -->
<!-- 작업 -->
<div class="row">
  <div class="col-md-4">
    <div class="modal fade" id="assign-role-modal" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
      <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-body p-0">
            <div class="card bg-secondary border-0 mb-0">
              <div class="card-header bg-transparent">
                <h2 class="font-weight-bold">역할 배정</h2>
                <small class="text-muted">앞으로 같이 일하게 될 디벨로퍼에게 역할을 배정해주세요.</small>
              </div>
              <div class="card-body">
                <div>
                  <a href="#!">
                    <img src="" class="rounded-circle img-center img-fluid shadow shadow-lg--hover" style="width: 140px;">
                  </a>
                  <div class="pt-4 text-center">
                    <h5 class="h3 title">
                      <span class="d-block mb-1 mem_name"></span>
                      <small class="h4 font-weight-light text-muted">Web Developer</small>
                    </h5>
                  </div>
                  <div>
                    <div style="display: flex; justify-content: center;">
                      <div style="width: 100px;">
                        <select class="form-control role-select" data-toggle="select" data-placeholder="역할">
                        </select>
                      </div>
                    </div>
                    <div class="text-center">
                      <small class="text-muted">배정할 역할을 선택해주세요.</small>
                    </div>
                  </div>
                </div>
                <div style="display: flex; justify-content: center; margin: 10px 0px 0px 0px;">
                  <div style="margin: 0px 10px 0px 0px">
                    <button type="button" class="btn btn-outline-primary btn-add--event">배정</button>
                  </div>
                  <div style="margin: 0px 0px 0px 10px">
                    <button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 모달 캘린더 등록 -->
<div class="modal fade modal-interview-add" id="new-event" tabindex="-1" role="dialog"
     aria-labelledby="edit-event-label" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-secondary"
       role="document">
    <div class="modal-content">
      <!-- Modal body -->
      <div class="modal-body">
        <form class="edit-event--form">
            <div class="form-group">
                <label class="form-control-label d-block mb-3">면접 구분명</label>
                <input type="text" class="form-control form-control-alternative new-event--title" placeholder="면접 구분명을 입력해주세요.">
            </div>
            <div class="form-group mb-0">
                <label class="form-control-label d-block mb-3">색상</label>
                <div class="btn-group btn-group-toggle btn-group-colors event-tag" data-toggle="buttons">
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
            <div style="display: flex; justify-content: space-between; margin: 15px 0px 0px 0px;">
                <div style="width: 200px;">
                    <label class="form-control-label d-block mb-3">시작일</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                        </div>
                        <input class="form-control datepicker event-start-date" placeholder="Select date" type="text"
                               value="09/01/2020">
                    </div>
                </div>
            </div>
            <div style="display: flex; justify-content: space-between; margin: 15px 0px 0px 0px;">
                <div style="width: 200px;">
                    <label class="form-control-label d-block mb-3">시작 시간</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                        </div>
                        <input class="form-control event-start-time" type="time" value="09:00"
                               id="example-time-input1">
                    </div>
                </div>
                <div style="width: 200px;">
                    <label class="form-control-label d-block mb-3">종료 시간</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                        </div>
                        <input class="form-control event-end-time" type="time" value="09:00" id="example-time-input2">
                    </div>
                </div>
            </div>
            <div class="form-group" style="margin: 10px 0px 0px 0px;">
                <label class="form-control-label">면접자</label>
                <select class="form-control pass-apply-member-list" data-toggle="select" multiple data-placeholder="Select multiple options">
                
                </select>
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

<!-- 모달 캘린더 수정 -->
<div class="modal fade modal-interview-modify" id="edit-event" tabindex="-1" role="dialog"
     aria-labelledby="edit-event-label" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-secondary"
       role="document">
    <div class="modal-content">
      <!-- Modal body -->
      <div class="modal-body">
        <form class="new-event--form">
            <div class="form-group">
                <label class="form-control-label d-block mb-3">면접 구분명</label>
                <input type="text" class="form-control form-control-alternative new-event--title" placeholder="면접 구분명을 입력해주세요.">
            </div>
            <div class="form-group mb-0">
                <label class="form-control-label d-block mb-3">색상</label>
                <div class="btn-group btn-group-toggle btn-group-colors event-tag" data-toggle="buttons">
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
            <div style="display: flex; justify-content: space-between; margin: 15px 0px 0px 0px;">
                <div style="width: 200px;">
                    <label class="form-control-label d-block mb-3">시작 시간</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                        </div>
                        <input class="form-control event-start-time" type="time" value="09:00"
                               id="example-time-input1">
                    </div>
                </div>
                <div style="width: 200px;">
                    <label class="form-control-label d-block mb-3">종료 시간</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                        </div>
                        <input class="form-control event-end-time" type="time" value="09:00" id="example-time-input2">
                    </div>
                </div>
            </div>
            <div class="form-group" style="margin: 10px 0px 0px 0px;">
                <label class="form-control-label">면접자</label>
                <select class="form-control pass-apply-member-list" data-toggle="select" multiple data-placeholder="Select multiple options">
                </select>
            </div>
            <input type="hidden" class="edit-event--id">
        </form>
      </div>
        <!-- Modal footer -->
        <div class="modal-footer">
            <button type="submit" class="btn btn-primary" data-calendar="update">수정</button>
            <button class="btn btn-danger" data-calendar="delete" data-calendar="delete">삭제</button>
            <button type="button" class="btn btn-link ml-auto" data-dismiss="modal">닫기</button>
        </div>
    </div>
  </div>
</div>

<!-- 모달 인포그래픽 -->
<div class="modal fade" id="infographic" tabindex="-1" role="dialog"
     aria-labelledby="infographic-aria" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-secondary"
         role="document">
        <div class="modal-content modal-position-center" style="width: 1200px;">
            <div class="modal-body" style="width: 1200px;">
                <div class="card-deck">
                    <div class="card card-profile">
                        <img src="../../assets/img/theme/img-1-1000x600.jpg" alt="Image placeholder" class="card-img-top">
                        <div class="row justify-content-center">
                            <div class="col-lg-3 order-lg-2">
                                <div class="card-profile-image">
                                    <a href="#">
                                        <img src="../../assets/img/theme/team-4.jpg" class="rounded-circle">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
                            <div class="d-flex justify-content-between">
                                <a href="#" class="btn btn-sm btn-info mr-4 btn-hire">HIRE</a>
                                <a href="#" class="btn btn-sm btn-default float-right btn-cancel" data-dismiss="modal">CANCEL</a>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <div class="row">
                                <div class="col">
                                    <div class="card-profile-stats d-flex justify-content-center">
                                        <div>
                                            <span class="heading projectCnt"></span>
                                            <span class="description">Project</span>
                                        </div>
                                        <div>
                                            <span class="heading portfolioCnt"></span>
                                            <span class="description">Portfolio</span>
                                        </div>
                                        <div>
                                            <span class="heading careerCnt"></span>
                                            <span class="description">Career</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <h5 class="h3"><span class="font-weight-light font-weight-bold mem-name"></span>
                                </h5>
                                <div class="h5 font-weight-300">
                                    <i class="ni location_pin mr-2"></i><span class="font-weight-bold mem-addr"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <!-- Card header -->
                        <div class="card-header">
                            <!-- Title -->
                            <h5 class="h3 mb-0">기술별 숙련도</h5>
                        </div>
                        <!-- Card body -->
                        <div class="card-body">
                            <!-- List group -->
                            <ul class="list-group list-group-flush list my--3 tech-experience">
                                <li class="list-group-item px-0 angular">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <!-- Avatar -->
                                            <a href="#" class="avatar rounded-circle">
                                                <img alt="Image placeholder" src="../../assets/img/theme/angular.jpg">
                                            </a>
                                        </div>
                                        <div class="col">
                                            <h5>ANGULAR</h5>
                                            <div class="progress progress-xs mb-0">
                                                <div class="progress-bar bg-orange" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item px-0 bootstrap">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <!-- Avatar -->
                                            <a href="#" class="avatar rounded-circle">
                                                <img alt="Image placeholder" src="../../assets/img/theme/bootstrap.jpg">
                                            </a>
                                        </div>
                                        <div class="col">
                                            <h5>BOOTSTRAP</h5>
                                            <div class="progress progress-xs mb-0">
                                                <div class="progress-bar bg-green" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item px-0 react">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <!-- Avatar -->
                                            <a href="#" class="avatar rounded-circle">
                                                <img alt="Image placeholder" src="../../assets/img/theme/react.jpg">
                                            </a>
                                        </div>
                                        <div class="col">
                                            <h5>REACT</h5>
                                            <div class="progress progress-xs mb-0">
                                                <div class="progress-bar bg-red" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item px-0 vue">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <!-- Avatar -->
                                            <a href="#" class="avatar rounded-circle">
                                                <img alt="Image placeholder" src="../../assets/img/theme/vue.jpg">
                                            </a>
                                        </div>
                                        <div class="col">
                                            <h5>VUE</h5>
                                            <div class="progress progress-xs mb-0">
                                                <div class="progress-bar bg-teal" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                  <div class="col">
                    <div class="card">
                      <div class="card-header">
                        <h3 class="mb-0">지원자 정보</h3>
                      </div>
                      <div class="card-body">
                        <div class="accordion" id="accordionExample">
                          <div class="card">
                            <div class="card-header" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                              <h5 class="mb-0">기본 정보</h5>
                            </div>
                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                              <!-- 기본 정보 -->
                              <div class="card-body information-card1">
                                <div class="row row-name">
                                  <div class="col-md-6">
                                    <small class="text-muted">이름</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="이름을 입력하세요." disabled>
                                    </div>
                                  </div>
                                </div>
                                <div class="row row-gender">
                                  <div class="col-md-6">
                                    <small class="text-muted">성별</small>
                                    <div class="form-group">
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="modalGender1" name="customRadioInline1" class="custom-control-input" checked disabled>
                                        <label class="custom-control-label" for="modalGender1">남</label>
                                      </div>
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="modalGender2" name="customRadioInline1" class="custom-control-input" disabled>
                                        <label class="custom-control-label" for="modalGender2">여</label>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">생년월일</small>
                                    <div class="form-group">
                                      <div class="input-group">
                                        <div class="input-group-prepend">
                                          <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                                        </div>
                                        <input class="form-control datepicker" placeholder="Select date" type="text" disabled>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card">
                            <div class="card-header" id="headingTwo" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                              <h5 class="mb-0">부가 정보</h5>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                              <!-- 부가 정보 -->
                              <div class="card-body information-card2">
                                <div class="row row-engname">
                                  <div class="col-md-6">
                                    <small class="text-muted">영문 이름</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="영문 이름을 입력하세요." disabled>
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6 row-hopesal">
                                    <small class="text-muted">희망 연봉</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="희망 연봉을 입력하세요." disabled>
                                    </div>
                                  </div>
                                  <div class="col-md-6 row-presal">
                                    <small class="text-muted">직전 연봉</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="직전 연봉을 입력하세요." disabled>
                                    </div>
                                  </div>
                                </div>
                                <div class="row row-hoperole">
                                  <div class="col-md-6">
                                    <small class="text-muted">희망 역할</small>
                                    <div class="form-group">
                                      <select class="form-control" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="희망 역할" disabled>
                                        <option>PL</option>
                                        <option>TA</option>
                                        <option>DA</option>
                                        <option>UA</option>
                                        <option>AA</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card">
                            <div class="card-header" id="headingThree" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                              <h5 class="mb-0">인적 사항</h5>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                              <!-- 인적 사항 -->
                              <div class="card-body information-card3">
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">국적</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control country" placeholder="국적" disabled>
                                    </div>
                                  </div>
                                  <div class="col-md-6">
                                    <small class="text-muted">기술</small>
                                    <div class="form-group">
                                      <select class="form-control technologies" data-toggle="select" multiple data-placeholder="Select multiple options" disabled>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">연락처</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control tel" placeholder="연락처" disabled>
                                    </div>
                                  </div>
                                  <div class="col-md-6 row-addr">
                                    <small class="text-muted">주소</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control addr" placeholder="주소" disabled>
                                    </div>
                                  </div>
                                </div>
                                <div class="row row-region">
                                  <div class="col-md-6">
                                    <small class="text-muted">종교</small>
                                    <div class="form-group">
                                      <select class="form-control" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="Search ..." disabled>
                                        <option>기독교</option>
                                        <option>천주교</option>
                                        <option>불교</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="row row-bloodtype">
                                  <div class="col-md-6">
                                    <small class="text-muted">혈액형</small>
                                    <div class="form-group">
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="bloodtype1" name="bloodtype" class="custom-control-input" disabled checked>
                                        <label class="custom-control-label" for="bloodtype1">A</label>
                                      </div>
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="bloodtype2" name="bloodtype" class="custom-control-input" disabled>
                                        <label class="custom-control-label" for="bloodtype2">AB</label>
                                      </div>
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="bloodtype3" name="bloodtype" class="custom-control-input" disabled>
                                        <label class="custom-control-label" for="bloodtype3">B</label>
                                      </div>
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="bloodtype4" name="bloodtype" class="custom-control-input" disabled>
                                        <label class="custom-control-label" for="bloodtype4">O</label>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6 row-hobby">
                                    <small class="text-muted">취미</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="취미" disabled>
                                    </div>
                                  </div>
                                  <div class="col-md-6 row-height">
                                    <small class="text-muted">신장</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="신장" disabled>
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6 row-bodyshape">
                                    <small class="text-muted">체형</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="체형" disabled>
                                    </div>
                                  </div>
                                  <div class="col-md-6 row-vision">
                                    <small class="text-muted">시력</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="시력" disabled>
                                    </div>
                                  </div>
                                </div>
                                <div class="row row-specialbodyproblem">
                                  <div class="col-md-12">
                                    <small class="text-muted">신체 특이사항</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="신체 특이사항" disabled>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card">
                            <div class="card-header" id="headingFour" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                              <h5 class="mb-0">학력 사항</h5>
                            </div>
                            <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                              <div class="card-body information-card4">
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">학교명</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control schoolStatus1-input" placeholder="고등학교" disabled>
                                    </div>
                                    <div class="form-group">
                                      <input type="text" class="form-control schoolStatus2-input" placeholder="대학교" disabled>
                                    </div>
                                    <div class="form-group">
                                      <input type="text" class="form-control schoolStatus3-input" placeholder="대학원" disabled>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card">
                            <div class="card-header" id="headingFive" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                              <h5 class="mb-0">어학/자격/기타</h5>
                            </div>
                            <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                              <div class="card-body information-card5">
                                <div class="row row-foreignexperience">
                                  <div class="col-md-12">
                                    <small class="text-muted">해외 경험</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="해외 경험" disabled>
                                    </div>
                                  </div>
                                </div>
                                <div class="row row-pricerecord">
                                  <div class="col-md-12">
                                    <small class="text-muted">수상 경험</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="수상 경험" disabled>
                                    </div>
                                  </div>
                                </div>
                                <div class="row row-educationrecord">
                                  <div class="col-md-12">
                                    <small class="text-muted">교육 이수 사항</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="교육 이수 사항" disabled>
                                    </div>
                                  </div>
                                </div>
                                <div class="row row-schoolrecord">
                                  <div class="col-md-12">
                                    <small class="text-muted">학내외활동</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="학내외활동" disabled>
                                    </div>
                                  </div>
                                </div>
                                <div class="row row-volunteer">
                                  <div class="col-md-12">
                                    <small class="text-muted">봉사활동</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="봉사활동" disabled>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="card bg-default shadow">
                            <div class="card-header bg-transparent border-0">
                                <h3 class="text-white mb-0">이력 사항</h3>
                            </div>
                            <div class="table-responsive">
                                <table class="table align-items-center table-dark table-flush">
                                    <thead class="thead-dark">
                                    <tr>
				                        <th scope="col">번호</th>
				                        <th scope="col">회사명</th>
				                        <th scope="col">부서명</th>
				                        <th scope="col">직책</th>
				                        <th scope="col">입사일</th>
				                        <th scope="col">퇴사일</th>
				                        <th scope="col"></th>
                                    </tr>
                                    </thead>
                                    <tbody class="list career-list">
                                    
                                    </tbody>
                                </table>
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
<script src="${pageContext.request.contextPath}/assets/vendor/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/fullcalendar/dist/fullcalendar.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script> --%>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

<script>
  /**
      초기 설정 Init
  */
  loadApplyList();
  
  let var_mem_id = '';
  
  $('.information-card1 .row-gender').hide();
  $('.information-card1 .row-birth').hide();
  $('.information-card2 .row-engname').hide();
  $('.information-card2 .row-hopesal').hide();
  $('.information-card2 .row-presal').hide();
  $('.information-card2 .row-hoperole').hide();
  $('.information-card3 .row-addr').hide();
  $('.information-card3 .row-region').hide();
  $('.information-card3 .row-bloodtype').hide();
  $('.information-card3 .row-hobby').hide();
  $('.information-card3 .row-height').hide();
  $('.information-card3 .row-bodyshape').hide();
  $('.information-card3 .row-vision').hide();
  $('.information-card3 .row-specialbodyproblem').hide();
  $('.information-card5 .row-foreignexperience').hide();
  $('.information-card5 .row-pricerecord').hide();
  $('.information-card5 .row-educationrecord').hide();
  $('.information-card5 .row-schoolrecord').hide();
  $('.information-card5 .row-volunteer').hide();
  
  loadApplyForm();
  
  function loadApplyForm() {
    // DB에서 Interview 정보를 조회해야함.
    const interview_customizing = '${interviewInfo.INTERVIEW_CUSTOMIZING }';

    const customizing_arr = interview_customizing.split(',');

    let educationStatusChk = 0;
    $.each(customizing_arr, function (index, item) {
      // 1번째
      if (item === '성별') {
        $('.information-card1 .row-gender').show();
      }
      if (item === '생년월일') {
        $('.information-card1 .row-birth').show();
      }

      // 2번째
      if (item === '영문이름') {
        $('.information-card2 .row-engname').show();
      }
      if (item === '희망연봉') {
        $('.information-card2 .row-hopesal').show();
      }
      if (item === '직전연봉') {
        $('.information-card2 .row-presal').show();
      }
      if (item === '희망역할') {
        $('.information-card2 .row-hoperole').show();
      }

      // 3번째
      if (item === '주소') {
        $('.information-card3 .row-addr').show();
      }
      if (item === '종교') {
        $('.information-card3 .row-region').show();
      }
      if (item === '혈액형') {
        $('.information-card3 .row-bloodtype').show();
      }
      if (item === '취미') {
        $('.information-card3 .row-hobby').show();
      }
      if (item === '신장') {
        $('.information-card3 .row-height').show();
      }
      if (item === '체형') {
        $('.information-card3 .row-bodyshape').show();
      }
      if (item === '시력') {
        $('.information-card3 .row-vision').show();
      }
      if (item === '신체 특이사항') {
        $('.information-card3 .row-specialbodyproblem').show();
      }

      // 4번째
      if (item === '고등학교') {
        educationStatusChk++;
      }
      if (item === '대학교') {
        educationStatusChk++;
      }
      if (item === '대학원') {
        educationStatusChk++;
      }

      // 5번째
      if (item === '해외경험') {
        $('.information-card5 .row-foreignexperience').show();
      }
      if (item === '수상경력') {
        $('.information-card5 .row-pricerecord').show();
      }
      if (item === '교육이수사항') {
        $('.information-card5 .row-educationrecord').show();
      }
      if (item === '학내외활동') {
        $('.information-card5 .row-schoolrecord').show();
      }
      if (item === '봉사활동') {
        $('.information-card5 .row-volunteer').show();
      }
    });

    if (educationStatusChk == 1) {
      $('#schoolStatus1').attr('disabled', false);
      $('#schoolStatus2').attr('disabled', true);
      $('#schoolStatus3').attr('disabled', true);
    } else if (educationStatusChk == 2) {
      $('#schoolStatus1').attr('disabled', false);
      $('#schoolStatus2').attr('disabled', false);
      $('#schoolStatus3').attr('disabled', true);
    } else if (educationStatusChk == 3) {
      $('#schoolStatus1').attr('disabled', false);
      $('#schoolStatus2').attr('disabled', false);
      $('#schoolStatus3').attr('disabled', false);
    }
  }

  // <신청자 명단>
  
  // 1. 인포그래픽 표시
  function loadInfographicModal(e) {
	  // 로딩
	  // 1. 지금 선택한 사람의 정보로 교체!
	  var_mem_id = $(e).find('input[name=mem_id]').val();
	  
	  $.ajax({
		  url: '/CONNECTOR/user/interview/infographic.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	mem_id: var_mem_id
		    },
		    success: function (data) {
		    	$('#infographic .projectCnt').text(data.successProjectCnt);
		    	$('#infographic .portfolioCnt').text(data.insertPortfolioCnt);
		    	$('#infographic .careerCnt').text(data.CareerCnt);
		    	
		    	$('#infographic .rounded-circle').attr('src', '/' + data.PROFILE_SAVENAME);
		    	$('#infographic .mem-name').text(data.MEM_NAME + ', ' + data.MEM_AGE);
		    	$('#infographic .mem-addr').text(data.MEM_ADDR);
		    	
		    	const techExperience = (data.MYPAGE_TECHEXPERIENCE).split(',');
		    	
		    	// ANGULAR
		    	$('#infographic .tech-experience .angular .progress-bar').attr('aria-valuenow', techExperience[0]);
		    	$('#infographic .tech-experience .angular .progress-bar').css('width', techExperience[0] + '%');
		    	
		    	// BOOTSTRAP
		    	$('#infographic .tech-experience .bootstrap .progress-bar').attr('aria-valuenow', techExperience[1]);
		    	$('#infographic .tech-experience .bootstrap .progress-bar').css('width', techExperience[1] + '%');
		    	
		    	// REACT
		    	$('#infographic .tech-experience .react .progress-bar').attr('aria-valuenow', techExperience[2]);
		    	$('#infographic .tech-experience .react .progress-bar').css('width', techExperience[2] + '%');
		    	
		    	// VUE
		    	$('#infographic .tech-experience .vue .progress-bar').attr('aria-valuenow', techExperience[3]);
		    	$('#infographic .tech-experience .vue .progress-bar').css('width', techExperience[3] + '%');
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
	  });
	  
	  $.ajax({
		  url: '/CONNECTOR/user/member/selectMemberInfoJSON.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	mem_id: var_mem_id
		    },
		    success: function (data) {
		    	$('.information-card1 .row-name input').val(data.MEM_NAME);
		    	$('.information-card1 .datepicker').val(data.MEM_BIR);
		    	$('.information-card3 .tel').val(data.MEM_TEL);
		    	$('.information-card3 .addr').val(data.MEM_ADDR);
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
	  });
	  
	  $.ajax({
		  url: '/CONNECTOR/user/interview/mypageDeveloperInfoJSON.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	mem_id: var_mem_id
		    },
		    success: function (data) {
		    	$('.information-card3 .technologies').empty();
		    	
		    	let tempHTML = '';
		    	if (data.MYPAGE_TECHNOLOGIES != null) {
		    		if ((data.MYPAGE_TECHNOLOGIES).indexOf('1') != -1) {
			    	      tempHTML += '<option value="1" selected>ANGULAR</option>';
			    	}
		    		if ((data.MYPAGE_TECHNOLOGIES).indexOf('2') != -1) {
			    	      tempHTML += '<option value="2" selected>BOOTSTRAP</option>';
			    	}
		    		if ((data.MYPAGE_TECHNOLOGIES).indexOf('3') != -1) {
			    	      tempHTML += '<option value="3" selected>REACT</option>';
			    	}
		    		if ((data.MYPAGE_TECHNOLOGIES).indexOf('4') != -1) {
			    	      tempHTML += '<option value="4" selected>VUE</option>';
			    	}
		    	}
		    	
		    	$('.information-card3 .technologies').append(tempHTML);
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
	  });
	  
	  $.ajax({
		    url: '/CONNECTOR/user/projectApply/selectProjectApplyInfo.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	mem_id: var_mem_id,
		    	project_no: '${param.project_no}'
		    },
		    success: function (data) {
		    	if (data.APPLY_INFO_GENDER == '남') {
		    		$('.information-card1 #modalGender1').prop('checked', true);
		    	} else {
		    		$('.information-card1 #modalGender2').prop('checked', true);
		    	}
		    	
		    	$('.information-card2 .row-engname input').val(data.APPLY_INFO_ENGNAME);
		    	$('.information-card2 .row-hopesal input').val(data.APPLY_INFO_HOPESAL);
		    	$('.information-card2 .row-presal input').val(data.APPLY_INFO_PRESAL);

		    	// select2 (PL, TA, DA, UA, AA)
		    	let tempHTML = '';
		    	if (data.APPLY_INFO_HOPEROLE == 'PL') {
		    	      tempHTML = '' +
		              '<option selected>PL</option>' +
		              '<option>TA</option>' +
		              '<option>DA</option>' +
		              '<option>UA</option>' +
		              '<option>AA</option>';
		    	} else if (data.APPLY_INFO_HOPEROLE == 'TA') {
		    	      tempHTML = '' +
		              '<option>PL</option>' +
		              '<option selected>TA</option>' +
		              '<option>DA</option>' +
		              '<option>UA</option>' +
		              '<option>AA</option>';
		    	} else if (data.APPLY_INFO_HOPEROLE == 'DA') {
		    	      tempHTML = '' +
		              '<option>PL</option>' +
		              '<option>TA</option>' +
		              '<option selected>DA</option>' +
		              '<option>UA</option>' +
		              '<option>AA</option>';
		    	} else if (data.APPLY_INFO_HOPEROLE == 'UA') {
		    	      tempHTML = '' +
		              '<option>PL</option>' +
		              '<option>TA</option>' +
		              '<option>DA</option>' +
		              '<option selected>UA</option>' +
		              '<option>AA</option>';
		    	} else if (data.APPLY_INFO_HOPEROLE == 'AA') {
		    	      tempHTML = '' +
		              '<option>PL</option>' +
		              '<option>TA</option>' +
		              '<option>DA</option>' +
		              '<option>UA</option>' +
		              '<option selected>AA</option>';
		    	}
		    	$('.information-card2 .row-hoperole select').append(tempHTML);
		    	
		    	
		    	
		    	$('.information-card3 .country').val(data.APPLY_INFO_COUNTRY);

		    	// 종교 (기독교, 천주교, 불교)
		    	if (data.APPLY_INFO_REGION == '기독교') {
		    	      tempHTML = '' +
		              '<option selected>기독교</option>' +
		              '<option>천주교</option>' +
		              '<option>불교</option>';
		    	} else if (data.APPLY_INFO_REGION == '천주교') {
		    	      tempHTML = '' +
		              '<option>기독교</option>' +
		              '<option selected>천주교</option>' +
		              '<option>불교</option>';
		    	} else if (data.APPLY_INFO_REGION == '불교') {
		    	      tempHTML = '' +
		              '<option>기독교</option>' +
		              '<option>천주교</option>' +
		              '<option selected>불교</option>';
		    	}
		    	$('.information-card3 .row-region select').append(tempHTML);

		    	if (data.APPLY_INFO_BLOODTYPE == 'A') {
		    		$('.information-card3 .row-bloodtype #bloodtype1').prop('checked', true);
		    	} else if (data.APPLY_INFO_BLOODTYPE == 'AB') {
		    		$('.information-card3 .row-bloodtype #bloodtype2').prop('checked', true);
		    	} else if (data.APPLY_INFO_BLOODTYPE == 'B') {
		    		$('.information-card3 .row-bloodtype #bloodtype3').prop('checked', true);
		    	} else if (data.APPLY_INFO_BLOODTYPE == 'O') {
		    		$('.information-card3 .row-bloodtype #bloodtype4').prop('checked', true);
		    	}

		    	$('.information-card3 .row-hobby input').val(data.APPLY_INFO_HOBBY);
		    	$('.information-card3 .row-height input').val(data.APPLY_INFO_HEIGHT);
		    	$('.information-card3 .row-bodyshape input').val(data.APPLY_INFO_BODYSHAPE);
		    	$('.information-card3 .row-vision input').val(data.APPLY_INFO_VISION);
		    	$('.information-card3 .row-specialbodyproblem input').val(data.APPLY_INFO_SPECIALBODYPROBLEM);
		    	
		    	$('.information-card4 .schoolStatus1-input').val(data.APPLY_INFO_HIGHSCHOOL);
		    	$('.information-card4 .schoolStatus2-input').val(data.APPLY_INFO_UNIVERSITY);
		    	$('.information-card4 .schoolStatus3-input').val(data.APPLY_INFO_GRADUATEUNIVERSITY);
		    	
		    	$('.information-card5 .row-foreignexperience input').val(data.APPLY_INFO_FOREIGNEXPERIENCE);
		    	$('.information-card5 .row-pricerecord input').val(data.APPLY_INFO_PRICERECORD);
		    	$('.information-card5 .row-educationrecord input').val(data.APPLY_INFO_EDUCATIONRECORD);
		    	$('.information-card5 .row-schoolrecord input').val(data.APPLY_INFO_SCHOOLRECORD);
		    	$('.information-card5 .row-volunteer input').val(data.APPLY_INFO_VOLUNTEER);
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
	  });
	  
	  $.ajax({
		    url: '/CONNECTOR/user/interview/selectProjectApply.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	mem_id: var_mem_id
		    },
		    success: function (data) {
		    	if (data != null) {
		    		if (data.APPLY_STATUS == 'Y') {
			    		$('#infographic .btn-hire').text('FIRE');
			    		$('#infographic .btn-hire').removeClass('btn-info');
			    		$('#infographic .btn-hire').addClass('btn-warning');
			    	} else if (data.APPLY_STATUS == 'N') {
			    		$('#infographic .btn-hire').text('HIRE');
			    		$('#infographic .btn-hire').removeClass('btn-warning');
			    		$('#infographic .btn-hire').addClass('btn-info');
			    	}
		    	}
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
	  });
	  
	  $.ajax({
		    url: '/CONNECTOR/user/career/selectCareer.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	mem_id: var_mem_id
		    },
		    success: function (data) {
		    	let tableNO = 1;
		    	$('.career-list').empty();
		    	$.each(data, function(index, item) {
	  				const trHTML = '<tr class="checklist-entry">\n' +
	  	            '                              <input type="hidden" name="career_seq" value="' + item.CAREER_SEQ + '">\n' +
	  	            '                              <th scope="row">\n' +
	  	            '                                <div class="media align-items-center">\n' +
	  	            '                                  <div class="media-body">\n' +
	  	            '                                    <span class="name mb-0 text-sm">' + tableNO + '</span>\n' +
	  	            '                                  </div>\n' +
	  	            '                                </div>\n' +
	  	            '                              </th>\n' +
	  	            '                              <td>' + item.CAREER_COMPANYNAME + '</td>\n' +
	  	            '                              <td>' + item.CAREER_DEPARTMENT + '</td>\n' +
	  	            '                              <td>' + item.CAREER_CLASS + '</td>\n' +
	  	            '                              <td>' + item.CARRER_STARTDATE + '</td>\n' +
	  	            '                              <td>' + item.CARRER_ENDDATE + '</td>\n' +
	  	            '                              <td><a class="trashcan-icon-area"></a></td>' +
	  	            '                            </tr>';
	  				tableNO++;
	  				$('.career-list').append(trHTML);
		    	});
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
	  });
	  
      $('#infographic').modal('show');
  }
  
  // 인포그래픽 HIRE 버튼
  $('#infographic .btn-hire').on('click', function() {
	  // id = var_mem_id
	  
	  const current_status = $(this).text();
	  const project_no = '${param.project_no}';
	  
	  if (current_status == 'HIRE') {
		  const apply_status = "Y";
		  
		  $.ajax({
			  url: '/CONNECTOR/user/interview/hireMember.do',
			    type: 'POST',
			    async: false,
			    data: {
			    	mem_id: var_mem_id,
			    	project_no: project_no,
			    	apply_status: apply_status
			    },
			    success: function (data) {
			    	$('#infographic').modal('hide');
			    	
			    	loadApplyList();
			    },
			    error: function (xhr, err) {
			        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
			        alert("responseText: " + xhr.responseText);
			    }
		  });
	  } else if (current_status == 'FIRE') {
		  const apply_status = "N";
		  
		  $.ajax({
			  url: '/CONNECTOR/user/interview/hireMember.do',
			    type: 'POST',
			    async: false,
			    data: {
			    	mem_id: var_mem_id,
			    	project_no: project_no,
			    	apply_status: apply_status
			    },
			    success: function (data) {
			    	$('#infographic').modal('hide');
			    	
			    	loadConfirmApplyList();
			    },
			    error: function (xhr, err) {
			        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
			        alert("responseText: " + xhr.responseText);
			    }
		  });
	  }
  });
  
  // 지원자, 면접자 리스트 변경 카테고리
  $('.div-apply-table-list .btn-view-category').on('click', function() {
	  const current_main_title = $('.div-apply-table-list .main-title');
	  const current_sub_title = $('.div-apply-table-list .sub-title');
	  const current_btn_view_category = $('.div-apply-table-list .btn-view-category');
	  
	  if (current_btn_view_category.text() == '면접자') {
		  // 지원자 리스트로 변경해야함
		  current_sub_title.text('면접자 조회');
		  current_btn_view_category.text('지원자');
		  
		  loadConfirmApplyList();
	  } else if (current_btn_view_category.text() == '지원자') {
		  // 면접자 리스트로 변경해야함
		  current_sub_title.text('지원자 조회');
		  current_btn_view_category.text('면접자');
		  
		  loadApplyList();
	  }
  });
  
  // 지원자 리스트 로딩
  function loadApplyList() {
	  const project_no = '${param.project_no}';
	  
	  $.ajax({
		  url: '/CONNECTOR/user/interview/selectApplyList.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	project_no: project_no,
		    },
		    success: function (data) {
		    	$('.apply-list_data_input-area').empty();
		    	$.each(data, function(index, item) {
		    		let techHTML = '';
		    		if (item.ANGULAR != undefined) {
		    			techHTML += '<span class="badge badge-pill badge-default" style="margin: 0px 3px 0px 0px;">' + item.ANGULAR + '</span>';
		    		}
		    		if (item.BOOTSTRAP != undefined) {
		    			techHTML += '<span class="badge badge-pill badge-primary" style="margin: 0px 3px 0px 0px;">' + item.BOOTSTRAP + '</span>';
		    		}
		    		if (item.REACT != undefined) {
		    			techHTML += '<span class="badge badge-pill badge-secondary" style="margin: 0px 3px 0px 0px;">' + item.REACT + '</span>';
		    		}
		    		if (item.VUE != undefined) {
		    			techHTML += '<span class="badge badge-pill badge-info" style="margin: 0px 3px 0px 0px;">' + item.VUE + '</span>';
		    		}
		    		if (item.ANGULAR == undefined && item.BOOTSTRAP == undefined && item.REACT == undefined && item.VUE == undefined) {
		    			techHTML = '<span class="badge badge-pill badge-default">보유 기술 없음</span>';
		    		}
		    		
		    		textHTML = '<tr>\n' +
		            '                <td class="table-user">\n' +
		            '                  <img src="/' + item.PROFILE_SAVENAME + '" class="avatar rounded-circle mr-3">\n' +
		            '                  <b>' + item.MEM_NAME + '</b>\n' +
		            '                </td>\n' +
		            '                <td>\n' +
		            '                  <span class="text-muted">' + item.MEM_AGE + '세</span>\n' +
		            '                </td>\n' +
		            '                <td>\n' +
		            '                  ' + techHTML +
		            '                </td>\n' +
		            '                <td class="table-actions">\n' +
		            '                  <a href="#!" class="table-action" data-toggle="tooltip" data-original-title="인포그래픽 이력서" onclick="loadInfographicModal(this);">\n' +
		            '                  \t<input type="hidden" name="mem_id" value="' + item.MEM_ID + '">\n' +
		            '                    <i class="fas fa-user-edit"></i>\n' +
		            '                  </a>\n' +
		            '                  <a href="#!" class="table-action table-action-delete" data-toggle="tooltip" data-original-title="제외">\n' +
		            '                    <i class="fas fa-trash"></i>\n' +
		            '                  </a>\n' +
		            '                </td>\n' +
		            '              </tr>';
		    		$('.apply-list_data_input-area').append(textHTML);
		    	});
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
	  });
  }
  
  // 면접자 리스트 로딩
  function loadConfirmApplyList() {
	  const project_no = '${param.project_no}';
	  
	  $.ajax({
		    url: '/CONNECTOR/user/interview/selectConfirmApplyList.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	project_no: project_no,
		    },
		    success: function (data) {
		    	$('.apply-list_data_input-area').empty();
		    	$.each(data, function(index, item) {
		    		let techHTML = '';
		    		if (item.ANGULAR != undefined) {
		    			techHTML += '<span class="badge badge-pill badge-default" style="margin: 0px 3px 0px 0px;">' + item.ANGULAR + '</span>';
		    		}
		    		if (item.BOOTSTRAP != undefined) {
		    			techHTML += '<span class="badge badge-pill badge-primary" style="margin: 0px 3px 0px 0px;">' + item.BOOTSTRAP + '</span>';
		    		}
		    		if (item.REACT != undefined) {
		    			techHTML += '<span class="badge badge-pill badge-secondary" style="margin: 0px 3px 0px 0px;">' + item.REACT + '</span>';
		    		}
		    		if (item.VUE != undefined) {
		    			techHTML += '<span class="badge badge-pill badge-info" style="margin: 0px 3px 0px 0px;">' + item.VUE + '</span>';
		    		}
		    		if (item.ANGULAR == undefined && item.BOOTSTRAP == undefined && item.REACT == undefined && item.VUE == undefined) {
		    			techHTML = '<span class="badge badge-pill badge-default">보유 기술 없음</span>';
		    		}
		    		
		    		textHTML = '<tr>\n' +
		            '                <td class="table-user">\n' +
		            '                  <img src="/' + item.PROFILE_SAVENAME + '" class="avatar rounded-circle mr-3">\n' +
		            '                  <b>' + item.MEM_NAME + '</b>\n' +
		            '                </td>\n' +
		            '                <td>\n' +
		            '                  <span class="text-muted">' + item.MEM_AGE + '세</span>\n' +
		            '                </td>\n' +
		            '                <td>\n' +
		            '                  ' + techHTML +
		            '                </td>\n' +
		            '                <td class="table-actions">\n' +
		            '                  <a href="#!" class="table-action" data-toggle="tooltip" data-original-title="인포그래픽 이력서" onclick="loadInfographicModal(this);">\n' +
		            '                  \t<input type="hidden" name="mem_id" value="' + item.MEM_ID + '">\n' +
		            '                    <i class="fas fa-user-edit"></i>\n' +
		            '                  </a>\n' +
		            '                  <a href="#!" class="table-action table-action-delete" data-toggle="tooltip" data-original-title="제외">\n' +
		            '                    <i class="fas fa-trash"></i>\n' +
		            '                  </a>\n' +
		            '                </td>\n' +
		            '              </tr>';
		    		$('.apply-list_data_input-area').append(textHTML);
		    	});
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
	  });
  }
  
  $('.apply-list-tab-btn').on('click', function() {
	  const current_status = $('.div-apply-table-list .sub-title').text();
	  
	  if (current_status === '지원자 조회') {
		  loadApplyList();
	  } else {
		  loadConfirmApplyList();
	  }
  });
  
  
  
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
$('#tabs-icons-text-2-tab').on('click', function() {
	const currentSelectedTab = $('.tab3-btn .active').attr('class');
	
	if (currentSelectedTab.indexOf('tab-tab1') != -1) {
		loadTabTab1();
	} else if (currentSelectedTab.indexOf('tab-tab2') != -1) {
		loadSuccessIntervieweeList();
	}
});
  
$('#final-tabs-icons-text-1-tab').on('click', function() {
	loadTabTab1();
});

$('#final-tabs-icons-text-2-tab').on('click', function() {
	loadSuccessIntervieweeList();
});

function loadTabTab1() {
	const project_no = $('input[name=project_no_hidden]').val();
	$.ajax({
		url: '/CONNECTOR/user/interviewee/loadTabTab1.do',
	    type: 'POST',
	    async: false,
	    data: {
	    	project_no: project_no,
	    },
	    success: function (data) {
	    	$('.tab-tab1 tbody').empty();
	    	$.each(data, function(index, item) {
	    		let rateHTML = '';
	    		if (4 <= item.AVG && item.AVG <= 7) {
		    		rateHTML = '' +
		    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n';
	    		} else if (9 <= item.AVG && item.AVG <= 11) {
		    		rateHTML = '' +
		    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n';
	    		} else if (12 <= item.AVG && item.AVG <= 14) {
		    		rateHTML = '' +
		    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n';
	    		} else if (15 <= item.AVG && item.AVG <= 17) {
		    		rateHTML = '' +
		    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n';
	    		} else if (18 <= item.AVG && item.AVG <= 20) {
		    		rateHTML = '' +
		    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n';
	    		}
	    		
	    	    const textHTML = '\t\t\t\t\t\t\t        <tr>\n' +
	            '\t\t\t\t\t\t\t          <td class="table-user">\n' +
	            '\t\t\t\t\t\t\t            <b>' + item.MEM_NAME + '</b>\n' +
	            '\t\t\t\t\t\t\t          </td>\n' +
	            '\t\t\t\t\t\t\t          <td>\n' +
	            '\t\t\t\t\t\t\t            <span class="text-muted">' + item.MEM_MAIL + '</span>\n' +
	            '\t\t\t\t\t\t\t          </td>\n' +
	            '\t\t\t\t\t\t\t          <td>\n' +
	            rateHTML +
	            '\t\t\t\t\t\t\t          </td>\n' +
	            '\t\t\t\t\t\t\t          <td>\n' +
	            '\t\t\t\t\t\t\t            <label class="custom-toggle">\n' +
	            '\t\t\t\t\t\t\t              <input type="checkbox" value="' + item.MEM_ID + '">\n' +
	            '\t\t\t\t\t\t\t              <span class="custom-toggle-slider rounded-circle" data-label-off="No" data-label-on="Yes"></span>\n' +
	            '\t\t\t\t\t\t\t            </label>\n' +
	            '\t\t\t\t\t\t\t          </td>\n' +
	            '\t\t\t\t\t\t\t        </tr>';
	    	    
	    	    $('.tab-tab1 tbody').append(textHTML);
	    	});
	    },
	    error: function (xhr, err) {
	        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
	        alert("responseText: " + xhr.responseText);
	    }
	});
}

function loadTabTab2() {
	$.ajax({
		url: '/CONNECTOR/user/',
	    type: 'POST',
	    async: false,
	    data: {
	    	s
	    },
	    success: function (data) {
	    	
	    },
	    error: function (xhr, err) {
	        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
	        alert("responseText: " + xhr.responseText);
	    }
	});
}

$('.tab-tab1 .btn-interview-success').on('click', function() {
	const tr_arr = $('.tab-tab1 tbody tr');
	
	let result_arr = [];
	$.each(tr_arr, function(idx, item) {
		const val = $(item).find('input[type=checkbox]:checked').val();
		
		if (val != undefined) {
			result_arr.push(val);
		}
	});
	
	let result_str = result_arr.join(',');
	
	if (result_arr.length == 0) {
		Swal.fire(
		  '경고',
		  '먼저 면접자를 선택해주세요.',
		  'warning'
		);
		
		return;
	}
	
	const project_no = $('input[name=project_no_hidden]').val();
	Swal.fire({
	  title: '합격',
	  text: "선택한 면접자를 합격시키겠습니까?",
	  icon: 'success',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: '확인',
	  cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
		  $.ajax({
			url: '/CONNECTOR/user/interviewee/confirmInterviewee.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	project_no: project_no,
		    	mem_id_all: result_str
		    },
		    success: function (data) {
		    	if (data) {
		    		Swal.fire(
    				  '성공',
    				  '선택한 면접자가 합격 처리 되었습니다.',
    				  'success'
    				);
		    		
		    		loadTabTab1();
		    	} else {
		    		Swal.fire(
    				  '에러',
    				  '면접자를 합격시키는 과정에서 에러 발생!',
    				  'danger'
    				);
		    	}
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
		  });
	  }
	});
});

$('.tab-tab1 .btn-interview-fail').on('click', function() {
	const tr_arr = $('.tab-tab1 tbody tr');
	
	let result_arr = [];
	$.each(tr_arr, function(idx, item) {
		const val = $(item).find('input[type=checkbox]:checked').val();
		
		if (val != undefined) {
			result_arr.push(val);
		}
	});
	
	let result_str = result_arr.join(',');
	
	if (result_arr.length == 0) {
		Swal.fire(
		  '경고',
		  '먼저 면접자를 선택해주세요.',
		  'warning'
		);
		
		return;
	}
	
	const project_no = $('input[name=project_no_hidden]').val();
	Swal.fire({
	  title: '탈락',
	  text: "선택한 면접자를 탈락시키겠습니까?",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: '확인',
	  cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
		  $.ajax({
			url: '/CONNECTOR/user/interviewee/failInterviewee.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	project_no: project_no,
		    	mem_id_all: result_str
		    },
		    success: function (data) {
		    	if (data) {
		    		Swal.fire(
    				  '성공',
    				  '선택한 면접자가 탈락 처리 되었습니다.',
    				  'success'
    				);
		    		
		    		loadTabTab1();
		    	} else {
		    		Swal.fire(
    				  '에러',
    				  '면접자를 탈락시키는 과정에서 에러 발생!',
    				  'danger'
    				);
		    	}
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
		  });
	  }
	});
});


///////////////////////////////////////// 역할 배정 ///////////////////////////////////////// 
function loadSuccessIntervieweeList() {
	  const project_no = $('input[name=project_no_hidden]').val();
	  
	  $.ajax({
		  url: '/CONNECTOR/user/interviewee/selectSuccessInterviewee.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	project_no: project_no
		    },
		    success: function (data) {
		    	$('.success-interviewee-table tbody').empty();
		    	
		    	$.each(data, function(idx, item) {
		    		let rateHTML = '';
		    		if (4 <= item.AVG && item.AVG <= 7) {
			    		rateHTML = '' +
			    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n';
		    		} else if (9 <= item.AVG && item.AVG <= 11) {
			    		rateHTML = '' +
			    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n';
		    		} else if (12 <= item.AVG && item.AVG <= 14) {
			    		rateHTML = '' +
			    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n';
		    		} else if (15 <= item.AVG && item.AVG <= 17) {
			    		rateHTML = '' +
			    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n';
		    		} else if (18 <= item.AVG && item.AVG <= 20) {
			    		rateHTML = '' +
			    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
			            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n';
		    		}
		    		
		    	    const textHTML = '\t\t\t\t\t\t\t        <tr>\n' +
		            '\t\t\t\t\t\t\t          <td class="table-user">\n' +
		            '\t\t\t\t\t\t\t            <img src="/' + item.PROFILE_SAVENAME + '" class="avatar rounded-circle mr-3">\n' +
		            '\t\t\t\t\t\t\t            <b>' + item.MEM_NAME + '</b>\n' +
		            '\t\t\t\t\t\t\t          </td>\n' +
		            '\t\t\t\t\t\t\t          <td>\n' +
		            '\t\t\t\t\t\t\t            <span class="text-muted">' + item.MEM_MAIL + '</span>\n' +
		            '\t\t\t\t\t\t\t          </td>\n' +
		            '\t\t\t\t\t\t\t          <td>\n' +
		            rateHTML +
		            '\t\t\t\t\t\t\t          </td>\n' +
		            '\t\t\t\t\t\t\t          <td class="table-actions">\n' +
		            '\t\t\t\t\t\t\t            <a class="table-action assign-role-btn" data-toggle="tooltip" data-original-title="역할 배정" style="cursor: pointer;" onclick="loadAssignModal(this);">\n' +
		            '\t\t\t\t\t\t\t              <i class="fas fa-briefcase"></i>\n' +
		            '\t\t\t\t\t\t\t              <input type="hidden" name="mem_id" value="' + item.MEM_ID + '">\n' +
		            '\t\t\t\t\t\t\t            </a>\n' +
		            '\t\t\t\t\t\t\t          </td>\n' +
		            '\t\t\t\t\t\t\t        </tr>';
		            
		    	    $('.success-interviewee-table tbody').append(textHTML);
		    	});
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
	  });
}

function loadAssignModal(e) {
	  // 실행되기 전 정보를 조회해서 모달창 세팅!
	  const mem_id = $(e).find('input[name=mem_id]').val();
	  var_mem_id = mem_id;
	  const project_no = '${param.project_no}';
	  
	  $.ajax({
		  url: '/CONNECTOR/user/interviewee/loadAssignModalInfo.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	project_no: '${param.project_no }',
		    	mem_id: mem_id
		    },
		    success: function (data) {
		    	$('#assign-role-modal .rounded-circle').attr('src', '/' + data.memberInfo.PROFILE_SAVENAME);
		    	$('#assign-role-modal .mem_name').text(data.memberInfo.MEM_NAME);
		    	
		    	$('#assign-role-modal .role-select').empty();
		    	if (data.projectInfo.PL == null) {
		    		$('#assign-role-modal .role-select').append('<option>PL</option>');
		    	} else {
		    		$('#assign-role-modal .role-select').append('<option disabled>PL (배정됨)</option>');
		    	}
		    	if (data.projectInfo.TA == null) {
		    		$('#assign-role-modal .role-select').append('<option>TA</option>');
		    	} else {
		    		$('#assign-role-modal .role-select').append('<option disabled>TA (배정됨)</option>');
		    	}
		    	if (data.projectInfo.DA == null) {
		    		$('#assign-role-modal .role-select').append('<option>DA</option>');
		    	} else {
		    		$('#assign-role-modal .role-select').append('<option disabled>DA (배정됨)</option>');
		    	}
		    	if (data.projectInfo.UA == null) {
		    		$('#assign-role-modal .role-select').append('<option>UA</option>');
		    	} else {
		    		$('#assign-role-modal .role-select').append('<option disabled>UA (배정됨)</option>');
		    	}
		    	if (data.projectInfo.AA == null) {
		    		$('#assign-role-modal .role-select').append('<option>AA</option>');
		    	} else {
		    		$('#assign-role-modal .role-select').append('<option disabled>AA (배정됨)</option>');
		    	}
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
	  });
	  
	  $('#assign-role-modal').modal('show');
};

// 작업
$('#assign-role-modal .btn-add--event').on('click', function() {
	const selectedValue = $('#assign-role-modal .role-select').select2('val');
	const mem_id = var_mem_id;
	const project_no = '${param.project_no}';

	if (selectedValue == null) {
		Swal.fire(
		  '경고',
		  '배정할 역할을 선택해주세요.',
		  'warning'
		);
		
		return;
	}
	
	$.ajax({
	    url: '/CONNECTOR/user/interviewee/assignRole.do',
	    type: 'POST',
	    async: false,
	    data: {
	    	project_no: project_no,
	    	mem_id: mem_id,
	    	selectedValue: selectedValue
	    },
	    success: function (data) {
	    	if (data) {
	    		Swal.fire(
   				  '성공',
   				  '해당 면접자에게 역할이 배정되었습니다.',
   				  'info'
   				);
	    	} else {
	    		Swal.fire(
   				  '에러',
   				  '역할을 배정하는 중 에러 발생!',
   				  'danger'
   				);
	    	}
	    	
	    	loadSuccessIntervieweeList();
	    	$('#assign-role-modal').modal('hide');
	    },
	    error: function (xhr, err) {
	        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
	        alert("responseText: " + xhr.responseText);
	    }
	});
});

$('.div-apply-table-list .btn-end-hire').on('click', function() {
	Swal.fire({
	  title: '모집 마감',
	  text: "지원자 신청을 마감하시겠습니까?",
	  icon: 'info',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: '마감',
	  cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
		  location.href = '${pageContext.request.contextPath}/user/project/endHire.do?mem_id=${MEMBER_LOGININFO.mem_id }&project_no=${param.project_no }';
	  }
	});
});
</script>