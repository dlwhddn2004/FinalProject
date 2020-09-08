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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/select2/dist/css/select2.min.css">
<!-- Argon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">

<style>
  .checklist-entry:hover .trashcan-icon-area::after {
    content: "\f1f8";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    color: #f5365c;
    margin-left: 10px;
    cursor: pointer;
  }

  .trashcan-icon-area {
    display: inline-block;
    width: 20px;
  }
</style>

<div class="row project-apply-big-div">
  <div class="col-md-12">
    <div class="card">
      <div class="card-header bg-default">
        <h3 class="text-white">프로젝트 신청</h3>
        <div>
          <small class="text-muted">파트너스가 요구한 입력 항목을 작성하여 프로젝트에 신청하세요.</small>
        </div>
      </div>
      <div class="card-body">
        <div class="form-group">
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
              </div>
              <div class="card-body pt-0">
                <div class="row">
                  <div class="col">
                    <div class="card-profile-stats d-flex justify-content-center">
                      <div>
                        <span class="heading">${successProjectCnt }</span>
                        <span class="description">Project</span>
                      </div>
                      <div>
                        <span class="heading">${insertPortfolioCnt }</span>
                        <span class="description">Portfolio</span>
                      </div>
                      <div>
                        <span class="heading">${CareerCnt }</span>
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
                          <div class="progress-bar bg-orange" role="progressbar" aria-valuenow="${techExperienceArr[0] }" aria-valuemin="0" aria-valuemax="100" style="width: ${techExperienceArr[0] }%;"></div>
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
                          <div class="progress-bar bg-green" role="progressbar" aria-valuenow="${techExperienceArr[1] }" aria-valuemin="0" aria-valuemax="100" style="width: ${techExperienceArr[1] }%;"></div>
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
                          <div class="progress-bar bg-red" role="progressbar" aria-valuenow="${techExperienceArr[2] }" aria-valuemin="0" aria-valuemax="100" style="width: ${techExperienceArr[2] }%;"></div>
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
                          <div class="progress-bar bg-teal" role="progressbar" aria-valuenow="${techExperienceArr[3] }" aria-valuemin="0" aria-valuemax="100" style="width: ${techExperienceArr[3] }%;"></div>
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
                <div class="card-header bg-default">
                  <h3 class="text-white mb-0">지원자 정보</h3>
                </div>
                <div class="card-body">
                  <div class="accordion" id="accordionExample">
                    <div class="card">
                      <div class="card-header bg-default" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <h5 class="text-white mb-0">기본 정보</h5>
                      </div>
                      <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <!-- 기본 정보 -->
                        <div class="card-body information-card1">
                          <div class="row row-name">
                            <div class="col-md-6">
                              <small class="text-muted">이름</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="이름을 입력하세요.">
                              </div>
                            </div>
                          </div>
                          <div class="row row-gender">
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
                            <div class="col-md-6 row-birth">
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
                      <div class="card-header bg-default" id="headingTwo" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        <h5 class="text-white mb-0">부가 정보</h5>
                      </div>
                      <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                        <!-- 부가 정보 -->
                        <div class="card-body information-card2">
                          <div class="row row-engname">
                            <div class="col-md-6">
                              <small class="text-muted">영문 이름</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="영문 이름을 입력하세요.">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6 row-hopesal">
                              <small class="text-muted">희망 연봉</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="희망 연봉을 입력하세요.">
                              </div>
                            </div>
                            <div class="col-md-6 row-presal">
                              <small class="text-muted">직전 연봉</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="직전 연봉을 입력하세요.">
                              </div>
                            </div>
                          </div>
                          <div class="row row-hoperole">
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
                      <div class="card-header bg-default" id="headingThree" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        <h5 class="text-white mb-0">인적 사항</h5>
                      </div>
                      <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                        <!-- 인적 사항 -->
                        <div class="card-body information-card3">
                          <div class="row">
                            <div class="col-md-6">
                              <small class="text-muted">국적</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="국적">
                              </div>
                            </div>
                            <div class="col-md-6 row-">
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
                            <div class="col-md-6 row-addr">
                              <small class="text-muted">주소</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="주소">
                              </div>
                            </div>
                          </div>
                          <div class="row row-region">
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
                          <div class="row row-bloodtype">
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
                          <div class="row row-hobby">
                            <div class="col-md-6">
                              <small class="text-muted">취미</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="취미">
                              </div>
                            </div>
                            <div class="col-md-6 row-height">
                              <small class="text-muted">신장</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="신장">
                              </div>
                            </div>
                          </div>
                          <div class="row row-bodyshape">
                            <div class="col-md-6">
                              <small class="text-muted">체형</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="체형">
                              </div>
                            </div>
                            <div class="col-md-6 row-vision">
                              <small class="text-muted">시력</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="시력">
                              </div>
                            </div>
                          </div>
                          <div class="row row-specialbodyproblem">
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
                      <div class="card-header bg-default" id="headingFour" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        <h5 class="text-white mb-0">학력 사항</h5>
                      </div>
                      <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                        <div class="card-body information-card4">
                          <div class="row">
                            <div class="col-md-6">
                              <small class="text-muted">상태</small>
                              <div class="form-group">
                                <div class="custom-control custom-radio custom-control-inline">
                                  <input type="radio" id="schoolStatus1" name="schoolStatus" class="custom-control-input school-graduate-status" value="고졸" checked>
                                  <label class="custom-control-label" for="schoolStatus1">고졸</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                  <input type="radio" id="schoolStatus2" name="schoolStatus" class="custom-control-input school-graduate-status" value="대졸">
                                  <label class="custom-control-label" for="schoolStatus2">대졸</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                  <input type="radio" id="schoolStatus3" name="schoolStatus" class="custom-control-input school-graduate-status" value="대학원졸">
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
                      <div class="card-header bg-default" id="headingFive" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                        <h5 class="text-white mb-0">어학/자격/기타</h5>
                      </div>
                      <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                        <div class="card-body information-card5">
                          <div class="row row-foreignexperience">
                            <div class="col-md-12">
                              <small class="text-muted">해외 경험</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="해외 경험">
                              </div>
                            </div>
                          </div>
                          <div class="row row-pricerecord">
                            <div class="col-md-12">
                              <small class="text-muted">수상 경험</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="수상 경험">
                              </div>
                            </div>
                          </div>
                          <div class="row row-educationrecord">
                            <div class="col-md-12">
                              <small class="text-muted">교육 이수 사항</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="교육 이수 사항">
                              </div>
                            </div>
                          </div>
                          <div class="row row-schoolrecord">
                            <div class="col-md-12">
                              <small class="text-muted">학내외활동</small>
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="학내외활동">
                              </div>
                            </div>
                          </div>
                          <div class="row row-volunteer">
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
          <div class="row career-table">
              <div class="col">
                <div class="card bg-default shadow">
                  <div class="card-header bg-transparent border-0" style="display: flex; justify-content: space-between;">
                    <div>
                      <h3 class="text-white mb-0">이력 사항</h3>
                    </div>
                    <div>
                      <button type="button" class="btn btn-secondary btn-sm btn-insert-modal-show">등록</button>
                    </div>
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
                      <tbody class="list">

                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
        </div>
      </div>
      <div class="card-footer">

      </div>
    </div>
  </div>
</div>


<!-- MODAL -->
<div class="row">
  <div class="col-md-4">
    <div class="modal fade" id="modal-insert-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
      <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-body p-0">
            <div class="card border-0 mb-0">
              <div class="card-header bg-secondary">
                <h3>이력 등록</h3>
                <div>
                  <small class="text-muted">이력서에 등록할 내용을 작성하세요.</small>
                </div>
              </div>
              <div class="card-body">
                <div class="form-group">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1"><i class="fas fa-building"></i></span>
                    </div>
                    <input type="text" class="form-control companyname" placeholder="회사명">
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control department" placeholder="부서명">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control class" placeholder="직책명">
                </div>
                <div class="input-daterange datepicker row align-items-center">
                  <div class="col">
                    <small class="text-muted">입사일</small>
                    <div class="form-group">
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                        </div>
                        <input class="form-control startdate" placeholder="Start date" type="text">
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <small class="text-muted">퇴사일</small>
                    <div class="form-group">
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                        </div>
                        <input class="form-control enddate" placeholder="End date" type="text">
                      </div>
                    </div>
                  </div>
                </div>
                <div style="display: flex; justify-content: flex-end;">
                  <div style="margin: 0px 10px 0px 0px;">
                    <button type="button" class="btn btn-outline-primary btn-sm btn-insert">등록</button>
                  </div>
                  <div style="margin: 0px 0px 10px 0px;">
                    <button type="button" class="btn btn-outline-danger btn-sm" data-dismiss="modal">취소</button>
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <div>
                  <small class="text-muted">자신이 다녔던 회사의 정보를 입력하세요.</small>
                </div>
                <div>
                  <small class="text-muted">모든 내용을 빠짐없이 작성해주세요.</small>
                </div>
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
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

<script>
  $('input[name=schoolStatus]').on('change', function () {
    const currentSelected = $('input[name=schoolStatus]:checked').val();

    if (currentSelected === '고졸') {
      $('.schoolStatus1-input').attr('disabled', false);
      $('.schoolStatus2-input').attr('disabled', true);
      $('.schoolStatus3-input').attr('disabled', true);
    } else if (currentSelected === '대졸') {
      $('.schoolStatus1-input').attr('disabled', false);
      $('.schoolStatus2-input').attr('disabled', false);
      $('.schoolStatus3-input').attr('disabled', true);
    } else if (currentSelected === '대학원졸') {
      $('.schoolStatus1-input').attr('disabled', false);
      $('.schoolStatus2-input').attr('disabled', false);
      $('.schoolStatus3-input').attr('disabled', false);
    }
   });

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



  // 이력서 모달 초기화 및 띄우기
  $('.project-apply-big-div .career-table .btn-insert-modal-show').on('click', function () {
    // 모달창 초기화
    $('#modal-insert-form .companyname').val('');
    $('#modal-insert-form .department').val('');
    $('#modal-insert-form .class').val('');
    $('#modal-insert-form .startdate').val('09/01/2020');
    $('#modal-insert-form .enddate').val('09/01/2020');

    $('#modal-insert-form').modal('show');
  });

  // 이력서 내용 등록
  let tableNO = 1;
  $('#modal-insert-form .btn-insert').on('click', function () {
    // 모달창에서 입력값 추출
    const career_companyname = $('#modal-insert-form .companyname').val();
    const career_department = $('#modal-insert-form .department').val();
    const career_class = $('#modal-insert-form .class').val();
    const career_startdate = $('#modal-insert-form .startdate').val();
    const career_enddate = $('#modal-insert-form .enddate').val();

    // career-table tbody에 append
    const trHTML = '<tr class="checklist-entry">\n' +
            '                              <th scope="row">\n' +
            '                                <div class="media align-items-center">\n' +
            '                                  <div class="media-body">\n' +
            '                                    <span class="name mb-0 text-sm">' + tableNO + '</span>\n' +
            '                                  </div>\n' +
            '                                </div>\n' +
            '                              </th>\n' +
            '                              <td>' + career_companyname + '</td>\n' +
            '                              <td>' + career_department + '</td>\n' +
            '                              <td>' + career_class + '</td>\n' +
            '                              <td>' + career_startdate + '</td>\n' +
            '                              <td>' + career_enddate + '</td>\n' +
            '                              <td><a class="trashcan-icon-area"></a></td>' +
            '                            </tr>';

    $('.career-table tbody').append(trHTML);
    tableNO++;
    $('#modal-insert-form').modal('hide');
  });

  // 이력서 내용 삭제
  $(document).on('click', '.career-table tbody .trashcan-icon-area', function () {

  });
</script>