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
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
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
<div class="row interview">
  <div class="col">
    <!-- 탭 -->
    <div class="nav-wrapper">
      <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
        <li class="nav-item">
          <a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true"><i class="ni ni-cloud-upload-96 mr-2"></i>면접 일정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-2-tab" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false"><i class="ni ni-bell-55 mr-2"></i>면접 설정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-3-tab" data-toggle="tab" href="#tabs-icons-text-3" role="tab" aria-controls="tabs-icons-text-3" aria-selected="false"><i class="ni ni-calendar-grid-58 mr-2"></i>신청자 명단</a>
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
          <div class="tab-pane fade" id="tabs-icons-text-2" role="tabpanel" aria-labelledby="tabs-icons-text-2-tab">
            <!-- 채용 설정 -->
            <div class="nav-wrapper">
              <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-interviewSet-text" role="tablist">
                <li class="nav-item">
                  <a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-interviewSet-text-1-tab" data-toggle="tab" href="#tabs-interviewSet-text-1" role="tab" aria-controls="tabs-interviewSet-text-1" aria-selected="true"><i class="ni ni-cloud-upload-96 mr-2"></i>기본 설정</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link mb-sm-3 mb-md-0" id="tabs-interviewSet-text-2-tab" data-toggle="tab" href="#tabs-interviewSet-text-2" role="tab" aria-controls="tabs-interviewSet-text-2" aria-selected="false"><i class="ni ni-bell-55 mr-2"></i>지원서 설정</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link mb-sm-3 mb-md-0" id="tabs-interviewSet-text-3-tab" data-toggle="tab" href="#tabs-interviewSet-text-3" role="tab" aria-controls="tabs-interviewSet-text-3" aria-selected="false"><i class="ni ni-calendar-grid-58 mr-2"></i>공고문 설정</a>
                </li>
              </ul>
            </div>
            <div class="card shadow">
              <div class="card-body">
                <div class="tab-content" id="myinterviewSetContent">
                  <div class="tab-pane fade show active" id="tabs-interviewSet-text-1" role="tabpanel" aria-labelledby="tabs-interviewSet-text-1-tab">
                    <!-- Input groups -->
                    <div class="card interview-basic-setting-area">
                      <!-- Card header -->
                      <div class="card-header">
                        <small class="text-muted">면접의 기본 내용들을 설정해주세요.</small>
                      </div>
                      <!-- Card body -->
                      <div class="card-body">
                        <form>
                          <!-- Input groups with icon -->
                          <div class="row">
                            <div class="col-md-6">
                              <small class="text-muted">공고명</small>
                              <div class="form-group">
                                <div class="input-group input-group-merge">
                                  <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-heading"></i></span>
                                  </div>
                                  <input class="form-control interview-title" placeholder="공고명" type="text">
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6">
                              <small>채용 형태</small>
                              <div class="form-group">
                                <div class="input-group input-group-merge interview-hire-shape">
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="interviewForm1" name="interviewForm" class="custom-control-input" value="일반 채용" checked>
                                    <label class="custom-control-label" for="interviewForm1">일반 채용</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="interviewForm2" name="interviewForm" class="custom-control-input" value="상시 채용">
                                    <label class="custom-control-label" for="interviewForm2">상시 채용</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="interviewForm3" name="interviewForm" class="custom-control-input" value="추천 채용">
                                    <label class="custom-control-label" for="interviewForm3">추천 채용</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="interviewForm4" name="interviewForm" class="custom-control-input" value="비공개 채용">
                                    <label class="custom-control-label" for="interviewForm4">비공개 채용</label>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6">
                              <small>채용 구분</small>
                              <div class="form-group">
                                <div class="input-group input-group-merge interview-division">
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="interviewDivision1" name="interviewDivision" class="custom-control-input" value="공채" checked>
                                    <label class="custom-control-label" for="interviewDivision1">공채</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="interviewDivision2" name="interviewDivision" class="custom-control-input" value="수시">
                                    <label class="custom-control-label" for="interviewDivision2">수시</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="interviewDivision3" name="interviewDivision" class="custom-control-input" value="상시">
                                    <label class="custom-control-label" for="interviewDivision3">상시</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="interviewDivision4" name="interviewDivision" class="custom-control-input" value="특별 채용">
                                    <label class="custom-control-label" for="interviewDivision4">특별 채용</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="interviewDivision5" name="interviewDivision" class="custom-control-input" value="추천 채용">
                                    <label class="custom-control-label" for="interviewDivision5">추천 채용</label>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6">
                              <small class="text-muted">채용 기술 분야</small>
                              <div class="form-group">
                                <div class="input-group input-group-merge">
                                  <select class="form-control interview-tech" data-toggle="select" multiple data-placeholder="기술 선택">
                                    <option value="1">ANGULAR</option>
                                    <option value="2">BOOTSTRAP</option>
                                    <option value="3">REACT</option>
                                    <option value="4">VUE</option>
                                  </select>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6">
                              <small class="text-muted">채용 인원</small>
                              <div class="form-group">
                                <div class="input-group input-group-merge">
                                  <input class="form-control interview-peoplenum" type="number" value="1" id="example-number-input">
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- Input groups with icon -->
                          <div class="row">
                            <div class="col-md-6">
                              <small class="text-muted">면접 방식</small>
                              <div class="form-group">
                                <div class="input-group input-group-merge">
                                  <select class="form-control interview-method" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="면접 방식">
                                    <option value="온라인">온라인</option>
                                    <option value="오프라인">오프라인</option>
                                  </select>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6">
                              <small class="text-muted">본인 인증</small>
                              <div class="form-group">
                                <div class="input-group input-group-merge interview-authentication">
                                  <label class="custom-toggle authToggleBtn">
                                    <input type="checkbox" value="on">
                                    <span class="custom-toggle-slider rounded-circle" data-label-off="No" data-label-on="Yes"></span>
                                  </label>
                                  <div class="custom-control custom-checkbox" style="margin: 0px 2px 0px 4px;">
                                    <input type="checkbox" class="custom-control-input" id="authMethod1" value="이메일 인증" disabled>
                                    <label class="custom-control-label" for="authMethod1">이메일 인증</label>
                                  </div>
                                  <div class="custom-control custom-checkbox" style="margin: 0px 2px 0px 4px;">
                                    <input type="checkbox" class="custom-control-input" id="authMethod2" value="SMS 인증" disabled>
                                    <label class="custom-control-label" for="authMethod2">SMS 인증</label>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-12" style="display: flex; justify-content: flex-end;">
                              <button class="btn btn-primary btn-save" type="button">저장</button>
                            </div>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane fade" id="tabs-interviewSet-text-2" role="tabpanel" aria-labelledby="tabs-interviewSet-text-2-tab">
                    <!-- Input groups -->
                    <div class="card">
                      <!-- Card header -->
                      <div class="card-header">
                        <div>
                          <small class="text-muted">면접 지원자에게서 입력받을 항목을 커스터마이징 하세요.</small>
                        </div>
                        <div>
                          <small class="text-muted">(*) 표시가 있는 항목은 필수 항목입니다.</small>
                        </div>
                      </div>
                      <!-- Card body -->
                      <div class="card-body">
                        <form>
                          <div class="row">
                            <div class="col-md-12">
                              <small class="text-muted">기본 정보</small>
                              <div class="form-group">
                                <div class="input-group input-group-merge">
                                  <div class="row customizing-btn-group">
                                    <button type="button" class="btn btn-primary" style="margin: 0px 10px 0px 15px;">이름 <text style="color: #ff6e6e;">*</text></button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">성별</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">생년월일</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-12">
                              <small class="text-muted">부가 정보</small>
                              <div class="form-group">
                                <div class="input-group input-group-merge">
                                  <div class="row customizing-btn-group">
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 15px;">영문이름</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">희망연봉</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">직전연봉</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">희망역할</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-12">
                              <small class="text-muted">인적 사항</small>
                              <div class="form-group">
                                <div class="input-group input-group-merge">
                                  <div class="row customizing-btn-group">
                                    <button type="button" class="btn btn-primary" style="margin: 0px 10px 0px 15px">국적 <text style="color: #ff6e6e;">*</text></button>
                                    <button type="button" class="btn btn-primary" style="margin: 0px 10px 0px 0px">기술 <text style="color: #ff6e6e;">*</text></button>
                                    <button type="button" class="btn btn-primary" style="margin: 0px 10px 0px 0px">연락처 <text style="color: #ff6e6e;">*</text></button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">주소</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">종교</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">혈액형</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">취미</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">신장</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">체형</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">시력</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">신체 특이사항</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-12">
                              <small class="text-muted">학력 사항</small>
                              <div class="form-group">
                                <div class="input-group input-group-merge">
                                  <div class="row customizing-btn-group">
                                    <button type="button" class="btn btn-primary" style="margin: 0px 10px 0px 15px;">고등학교 <text style="color: #ff6e6e;">*</text></button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">대학교</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">대학원</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-12">
                              <small class="text-muted">어학/자격/기타</small>
                              <div class="form-group">
                                <div class="input-group input-group-merge">
                                  <div class="row customizing-btn-group">
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 15px">해외경험</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">수상경력</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">교육이수사항</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">학내외활동</button>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="button" style="margin: 0px 10px 0px 0px">봉사활동</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row" style="display: flex; justify-content: flex-end;">
                            <button type="button" class="btn btn-primary">저장</button>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane fade" id="tabs-interviewSet-text-3" role="tabpanel" aria-labelledby="tabs-interviewSet-text-3-tab">
                    <div class="row">
                      <div class="col">
                        <div class="card">
                          <div class="card-header">
                            <div>
                              <small class="text-muted">동의 서약서를 공고에 맞게 작성하고 관리하세요.</small>
                            </div>
                          </div>
                          <div class="card-body">
                              <div class="row">
                                  <div class="col-md-12">
                                      <small>항목 명칭</small>
                                      <div class="form-group">
                                          <input class="form-control" type="text" id="example-text-input">
                                      </div>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-12">
                                      <small>항목 타입</small>
                                      <div class="form-group">
                                          <div>
                                              <div class="custom-control custom-radio custom-control-inline">
                                                  <input type="radio" id="agreeRadio1" name="agreeRadio" class="custom-control-input" checked>
                                                  <label class="custom-control-label" for="agreeRadio1">필수 동의</label>
                                              </div>
                                              <div class="custom-control custom-radio custom-control-inline">
                                                  <input type="radio" id="agreeRadio2" name="agreeRadio" class="custom-control-input">
                                                  <label class="custom-control-label" for="agreeRadio2">선택 동의</label>
                                              </div>
                                              <div class="custom-control custom-radio custom-control-inline">
                                                  <input type="radio" id="agreeRadio3" name="agreeRadio" class="custom-control-input">
                                                  <label class="custom-control-label" for="agreeRadio3">안내</label>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-12">
                                      <small>내용 설정</small>
                                      <div class="form-group">
                                          <div id="editor"></div>
                                      </div>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-12" style="display: flex; justify-content: flex-end;">
                                      <button class="btn btn-primary btn-submit" type="button">등록</button>
                                  </div>
                              </div>
                          </div>
                          <div class="card-footer">
                            <div>
                              <small class="text-muted">필수 동의 : 반드시 동의해야 지원서를 작성할 수 있습니다.</small>
                            </div>
                            <div>
                              <small class="text-muted">선택 동의 : 동의하지 않더라도 지원서 작성 및 제출에 영향이 없습니다.</small>
                            </div>
                            <div>
                              <small class="text-muted">안내 : 별도의 동의 란이 없습니다.</small>
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
                                            <span class="heading">22</span>
                                            <span class="description">Project</span>
                                        </div>
                                        <div>
                                            <span class="heading">10</span>
                                            <span class="description">Portfolio</span>
                                        </div>
                                        <div>
                                            <span class="heading">10</span>
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
                              <div class="card-body">
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">이름</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="이름을 입력하세요.">
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">성별</small>
                                    <div class="form-group">
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="modalGender1" name="customRadioInline1" class="custom-control-input" checked>
                                        <label class="custom-control-label" for="modalGender1">남</label>
                                      </div>
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="modalGender2" name="customRadioInline1" class="custom-control-input">
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
                                        <input class="form-control datepicker" placeholder="Select date" type="text" value="09/01/2020">
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
                              <div class="card-body">
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">영문 이름</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="영문 이름을 입력하세요.">
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">희망 연봉</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="희망 연봉을 입력하세요.">
                                    </div>
                                  </div>
                                  <div class="col-md-6">
                                    <small class="text-muted">직전 연봉</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="직전 연봉을 입력하세요.">
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">희망 역할</small>
                                    <div class="form-group">
                                      <select class="form-control" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="희망 역할">
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
                              <div class="card-body">
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">국적</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="국적">
                                    </div>
                                  </div>
                                  <div class="col-md-6">
                                    <small class="text-muted">기술</small>
                                    <div class="form-group">
                                      <select class="form-control" data-toggle="select" multiple data-placeholder="Select multiple options">
                                        <option>ANGULAR</option>
                                        <option>BOOTSTRAP</option>
                                        <option>REACT</option>
                                        <option>VUE</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">연락처</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="연락처">
                                    </div>
                                  </div>
                                  <div class="col-md-6">
                                    <small class="text-muted">주소</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="주소">
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">종교</small>
                                    <div class="form-group">
                                      <select class="form-control" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="Search ...">
                                        <option>기독교</option>
                                        <option>천주교</option>
                                        <option>불교</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">혈액형</small>
                                    <div class="form-group">
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="bloodtype1" name="bloodtype" class="custom-control-input" checked>
                                        <label class="custom-control-label" for="bloodtype1">A</label>
                                      </div>
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="bloodtype2" name="bloodtype" class="custom-control-input">
                                        <label class="custom-control-label" for="bloodtype2">AB</label>
                                      </div>
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="bloodtype3" name="bloodtype" class="custom-control-input">
                                        <label class="custom-control-label" for="bloodtype3">B</label>
                                      </div>
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="bloodtype4" name="bloodtype" class="custom-control-input">
                                        <label class="custom-control-label" for="bloodtype4">O</label>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">취미</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="취미">
                                    </div>
                                  </div>
                                  <div class="col-md-6">
                                    <small class="text-muted">신장</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="신장">
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">체형</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="체형">
                                    </div>
                                  </div>
                                  <div class="col-md-6">
                                    <small class="text-muted">시력</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="시력">
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-12">
                                    <small class="text-muted">신체 특이사항</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="신체 특이사항">
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
                              <div class="card-body">
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">상태</small>
                                    <div class="form-group">
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="schoolStatus1" name="schoolStatus" class="custom-control-input school-graduate-status" value="19" checked>
                                        <label class="custom-control-label" for="schoolStatus1">고졸</label>
                                      </div>
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="schoolStatus2" name="schoolStatus" class="custom-control-input school-graduate-status" value="20">
                                        <label class="custom-control-label" for="schoolStatus2">대졸</label>
                                      </div>
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="schoolStatus3" name="schoolStatus" class="custom-control-input school-graduate-status" value="21">
                                        <label class="custom-control-label" for="schoolStatus3">대학원졸</label>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6">
                                    <small class="text-muted">학교명</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control schoolStatus1-input" placeholder="고등학교">
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
                              <div class="card-body">
                                <div class="row">
                                  <div class="col-md-12">
                                    <small class="text-muted">해외 경험</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="해외 경험">
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-12">
                                    <small class="text-muted">수상 경험</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="수상 경험">
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-12">
                                    <small class="text-muted">교육 이수 사항</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="교육 이수 사항">
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-12">
                                    <small class="text-muted">학내외활동</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="학내외활동">
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-12">
                                    <small class="text-muted">봉사활동</small>
                                    <div class="form-group">
                                      <input type="text" class="form-control" placeholder="봉사활동">
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
                                        <th scope="col" colspan="3">이력 사항</th>
                                        <th scope="col">입사일</th>
                                        <th scope="col">퇴사일</th>
                                    </tr>
                                    </thead>
                                    <tbody class="list">
                                    <tr>
                                        <th scope="row">
                                            <div class="media align-items-center">
                                                <div class="media-body">
                                                    <span class="name mb-0 text-sm">1</span>
                                                </div>
                                            </div>
                                        </th>
                                        <td colspan="3">다음 카카오</td>
                                        <td>2000-09-10</td>
                                        <td>2018-10-01</td>
                                    </tr>
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
<script src="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

<script>
  // Quill Init
  const quill = new Quill('#editor', {
    theme: 'snow'
  });
  
  /**
      초기 설정 Init
  */
  loadApplyList();
  
  // < 면접 설정 >
  // 1. 기본 설정

  // 본인 인증
  $('.interview .authToggleBtn').on('change', function () {
    // 체크 : on , 미체크 : undefined
    const currentToggleStatus = $('.interview .authToggleBtn').find('input:checked').val();

    if (currentToggleStatus !== undefined) {
      $('#authMethod1').removeAttr('disabled');
      $('#authMethod2').removeAttr('disabled');
    } else {
      $('#authMethod1').attr('disabled', 'disabled');
      $('#authMethod2').attr('disabled', 'disabled');
    }
  });
  
  // 2. 기본 설정 저장
  $('.interview-basic-setting-area .btn-save').on('click', function() {
	 const interview_title = $('.interview-basic-setting-area .interview-title').val();
	 const interview_hire_shape = $('.interview-basic-setting-area .interview-hire-shape input[name=interviewForm]:checked').val();
	 const interview_division = $('.interview-basic-setting-area .interview-division input[name=interviewDivision]:checked').val();
	 const interview_tech = $('.interview-basic-setting-area .interview-tech').select2('val');
	 const interview_peoplenum = $('.interview-basic-setting-area .interview-peoplenum').val();
	 const interview_method = $('.interview-basic-setting-area .interview-method').select2('val');
	 const status_auth = $('.interview-basic-setting-area .interview-authentication .authToggleBtn input[type=checkbox]:checked').val();
	 const email_auth = $('#authMethod1:checked').val();
	 const SMS_auth = $('#authMethod2:checked').val();
	 
// 	 alert('interview_title : ' + interview_title);
// 	 alert('interview_hire_shape : ' + interview_hire_shape);
// 	 alert('interview_division : ' + interview_division);
// 	 alert('interview_tech : ' + interview_tech);
// 	 alert('interview_peoplenum : ' + interview_peoplenum);
// 	 alert('interview_method : ' + interview_method);
	 alert('status_auth : ' + status_auth);
	 alert('email_auth : ' + email_auth);
	 alert('SMS_auth : ' + SMS_auth);
	 
	 if (interview_title == '') {
		 $.notify({
				// options
				message: '공고명을 입력해주세요!' 
			},{
				// settings
				placement: {
					from: "top",
					align: "center"
				},
				type: 'info'
			});
			
			return;
	 }
	 if (interview_tech == '') {
		 $.notify({
				// options
				message: '채용 기술 분야를 입력해주세요!' 
			},{
				// settings
				placement: {
					from: "top",
					align: "center"
				},
				type: 'info'
			});
			
			return;
	 }
	 if (status_auth == 'on' && email_auth == undefined && SMS_auth == undefined) {
		 $.notify({
				// options
				message: '본인 인증 방식을 선택해주세요.' 
			},{
				// settings
				placement: {
					from: "top",
					align: "center"
				},
				type: 'info'
			});
			
			return;
	 }
	 
	 let interview_authentication = '';
	 if (status_auth == undefined) {
		 interview_authentication == '없음';
	 } else {
		 interview_authentication = email_auth + ',' + SMS_auth;
		 interview_authentication = interview_authentication.substr(0, interview_authentication.length - 1);
	 }
	 
	 const project_no = '${param.project_no}';
	 
	 // DB
	 $.ajax({
		 url: '/CONNECTOR/user/interview/insertInterview.do',
	     type: 'POST',
	     async: false,
	     data: {
	    	 interview_title: interview_title,
	    	 interview_hire_shape: interview_hire_shape,
	    	 interview_division: interview_division,
	    	 interview_tech: interview_tech,
	    	 interview_peoplenum: interview_peoplenum,
	    	 interview_method: interview_method,
	    	 interview_authentication: interview_authentication,
	    	 project_no: proeject_no
	     },
	     success: function (data) {
	    	 // 작업 중!
	     },
	     error: function (xhr, err) {
	        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
	        alert("responseText: " + xhr.responseText);
	     }
	 });
  });

  // <신청자 명단>
  
  let var_mem_id = '';
  
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
	  
      $('#infographic').modal('show');
  }

  // 인포그래픽 하위 메뉴 (학력 사항)
  // 1. 고졸(19), 대졸(20), 대학원졸(21)
  $('.school-graduate-status').on('change', function() {
    const currentChecked = $('.school-graduate-status:checked').val();

    if (currentChecked === '19') {
      $('.schoolStatus1-input').removeAttr('disabled');
      $('.schoolStatus2-input').attr('disabled', 'disabled');
      $('.schoolStatus3-input').attr('disabled', 'disabled');
    } else if (currentChecked === '20') {
      $('.schoolStatus1-input').removeAttr('disabled');
      $('.schoolStatus2-input').removeAttr('disabled');
      $('.schoolStatus3-input').attr('disabled', 'disabled');
    } else if (currentChecked === '21') {
      $('.schoolStatus1-input').removeAttr('disabled');
      $('.schoolStatus2-input').removeAttr('disabled');
      $('.schoolStatus3-input').removeAttr('disabled');
    }
  });
  
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
  
  // 
</script>