<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Favicon -->
<link rel="icon" href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" type="image/png">
<!-- Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/nucleo/css/nucleo.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
<!-- Page plugins -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/datatables.net-select-bs4/css/select.bootstrap4.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/select2/dist/css/select2.min.css">
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

<!-- 면접 RTC -->
<div class="row">
  <div class="col-md-10">
    <div class="card-header">
      <div>
        <h2>면접</h2>
        <small class="text-muted">화상 채팅을 통해서 면접을 진행하세요.</small>
      </div>
    </div>
    <iframe src="${pageContext.request.contextPath}/interviewPage/RTCMain.html" frameborder="0" style="width: 100%; height: 930px;"></iframe>
  </div>
  <div class="col-md-2">
    <div class="card">
      <div class="card-header">
        <div class="text-center">
          <h5 class="text-center">현재 면접자</h5>
        </div>
        <div class="text-center">
          <small class="text-muted">면접자를 실시간으로 평가하세요.</small>
        </div>
      </div>
      <!-- Card body -->
      <div class="card-body">
        <a href="#!">
          <img src="${pageContext.request.contextPath}/assets/img/theme/team-1.jpg" class="rounded-circle img-center img-fluid shadow shadow-lg--hover mainImg" style="width: 140px;">
        </a>
        <div class="pt-4 text-center">
          <h5 class="h3 title">
            <span class="d-block mb-1 mem-name-here"></span>
            <small class="h4 font-weight-light text-muted">Web Developer</small>
          </h5>
          <div class="nav-wrapper">
          	<button type="button" class="btn btn-facebook btn-icon-only rounded-circle">
			    <span class="btn-inner--icon"><i class="fas fa-id-badge"></i></span>
			</button>
			<button type="button" class="btn btn-twitter btn-icon-only rounded-circle">
			    <span class="btn-inner--icon"><i class="fab fa-twitter"></i></span>
			</button>
			<button type="button" class="btn btn-google-plus btn-icon-only rounded-circle">
			    <span class="btn-inner--icon"><i class="fab fa-google-plus-g"></i></span>
			</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 인포그래픽 모달 -->
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
<!--                             <div class="d-flex justify-content-between"> -->
<!--                                 <a href="#" class="btn btn-sm btn-info mr-4 btn-hire">HIRE</a> -->
<!--                                 <a href="#" class="btn btn-sm btn-default float-right btn-cancel" data-dismiss="modal">CANCEL</a> -->
<!--                             </div> -->
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
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-select/js/dataTables.select.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/nouislider/distribute/nouislider.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

<script>
	/**
	 초기 설정 Init
	 */
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
		const
		interview_customizing = '${interviewInfo.INTERVIEW_CUSTOMIZING }';

		const
		customizing_arr = interview_customizing.split(',');

		let
		educationStatusChk = 0;
		$.each(customizing_arr, function(index, item) {
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
	
	//////////////////////////////
	
	$.ajax({
		url: '/CONNECTOR/user/interview/infographic.do',
	    type: 'POST',
	    async: false,
	    data: {
	    	mem_id: '${MEM_ID}'
	    },
	    success: function (data) {
	    	$('.mainImg').attr('src', '/' + data.PROFILE_SAVENAME);
	    	$('.mem-name-here').text(data.MEM_NAME + ', ' + data.MEM_AGE);
	    },
	    error: function (xhr, err) {
	        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
	        alert("responseText: " + xhr.responseText);
	    }
	  });
	
	$('.btn-facebook').on('click', function() {
	  // 로딩
	  // 1. 지금 선택한 사람의 정보로 교체!
	  let var_mem_id = '${MEM_ID}';
	  
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
		    	// 작업 중!
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
	});
</script>