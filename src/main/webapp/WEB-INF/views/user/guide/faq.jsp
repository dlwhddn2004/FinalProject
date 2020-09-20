<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<!-- Argon CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0"
	type="text/css">

<div class="row">
        <div class="col">
          <div class="card">
            <!--                   카드헤더                     -->
            <div class="card-header">
              <h3 class="mb-0">가이드</h3>
              <p class="text-sm mb-0">커넥터의 이용을 도와드립니다.</p>
            </div>
            <div class="card-body"></div>
          </div>
        </div>
      </div>
      <!--                  카드 메뉴랑 폼 묶는 곳                -->
      <div class="row">
      <!--                  소메뉴                              -->
        <div class="col-lg-4">
          <div class="card">
            <!-- Card image -->
            <img class="card-img-top" src="../../assets/img/theme/guide.png" alt="Image placeholder">
            <!-- List group -->
            <ul class="list-group list-group-flush">
              <li class="list-group-item">서비스 소개</li>
              <li class="list-group-item">디벨로퍼 이용방법</li>
              <li class="list-group-item">파트너스 이용방법</li>
              <li class="list-group-item bg-gradient-success text-white">자주 묻는 질문</li>
            </ul>
          </div>
        </div>
<!--                              form                                              -->
        <div class="col-lg-8">
          <div class="card">
            <!-- Card header -->
            <div class="card-header">
              <h3 class="mb-0">FAQ</h3>
            </div>
            <!-- Card body -->
            <div class="card-body">
              <div class="accordion" id="accordionExample">
                <div class="card">
                  <div class="card-header bg-success" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    <h5 class="mb-0 text-white">파트너스 질문</h5>
                  </div>
                  <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                      <div class="accordion" id="faq1">
                        <div class="card">
                          <div class="card-header" id="faqHeading1-1" data-toggle="collapse" data-target="#faqcollapse1" aria-expanded="true" aria-controls="faqcollapse1-1">
                            <h5 class="mb-0">프로젝트를 의뢰하려면 파트너스/디벨로퍼 중 어떤 유형으로 가입해야 하나요?</h5>
                          </div>
                          <div id="faqcollapse1" class="collapse show" aria-labelledby="faqHeading1-1" data-parent="#faq1">
                            <div class="card-body">
                              <p>커넥터는 '클라이언트'와 '파트너스' 각 계정을 따로 가입해 활동할 수 있습니다.</p>
                              <p>'클라이언트'로 가입하시면 프로젝트를 의뢰하고 작업자를 찾으실 수 있습니다.</p>
                            </div>
                          </div>
                        </div>
                        <div class="card">
                          <div class="card-header" id="faqHeading1-2" data-toggle="collapse" data-target="#faqcollapse1-2" aria-expanded="false" aria-controls="faqcollapse1-2">
                            <h5 class="mb-0">서비스 이용 절차를 알려주세요.</h5>
                          </div>
                          <div id="faqcollapse1-2" class="collapse" aria-labelledby="faqHeading2" data-parent="#faq1">
                            <div class="card-body">
                              <p>프로젝트 등록 > 검수 > 지원자 모집 > 미팅 > 계약 > 프로젝트 시작

                              <p>1. 프로젝트를 등록하시면, 검수 과정을 거친 후 파트너에게 프로젝트가 공개됩니다.</p>
                              <p>2. 지원자 중에 가장 적합한 파트너를 선정하신 후 온/오프라인 미팅을 진행하게 됩니다.</p>
                              <p>3. 협의가 끝난 업무 범위를 바탕으로 계약하고, 프로젝트를 진행합니다.</p>
                            </div>
                          </div>
                        </div>
                        <div class="card">
                          <div class="card-header" id="faqHeading1-3" data-toggle="collapse" data-target="#faqcollapse1-3" aria-expanded="false" aria-controls="faqcollapse1-3">
                            <h5 class="mb-0">프로젝트 등록 전, 디벨로퍼에게 연락하거나 프로젝트 의뢰를 할 수 있나요?</h5>
                          </div>
                          <div id="faqcollapse1-3" class="collapse" aria-labelledby="faqHeading1-3" data-parent="#faq1">
                            <div class="card-body">
                              <p>직접적으로 디벨로퍼와 컨택하거나 프로젝트를 의뢰할 수 있는 기능은 없습니다.</p>
                              <p>다만, 프로젝트 등록 후, '포트폴리오 찾기' 페이지를 통해 마음에 드는 디벨로퍼에게 지원 요청을 하실 수 있습니다.</p>

                              <p>먼저 프로젝트를 등록하여 디벨로퍼님께 지원을 요청하는 건 어떠실까요?</p>
                            </div>
                          </div>
                        </div>
                        <div class="card">
                          <div class="card-header" id="faqHeading1-3" data-toggle="collapse" data-target="#faqcollapse1-3" aria-expanded="false" aria-controls="faqcollapse1-3">
                            <h5 class="mb-0">'지원 요청'은 어떤 기능인가요?</h5>
                          </div>
                          <div id="faqcollapse1-3" class="collapse" aria-labelledby="faqHeading1-3" data-parent="#faq1">
                            <div class="card-body">
                              <p>마음에 드는 디벨로퍼에게 직접 프로젝트 지원을 요청할 수 있는 기능입니다.</p>
                              <p>해당 기능을 사용함으로써 더 많은 디벨로퍼와 연결이 가능합니다.</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header bg-success" id="headingTwo" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <h5 class="mb-0 text-white">디벨로퍼 질문</h5>
                  </div>
                  <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                      <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header bg-success" id="headingThree" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    <h5 class="mb-0 text-white">계정 관련</h5>
                  </div>
                  <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                    <div class="card-body">
                      <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
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
<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="../../assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>