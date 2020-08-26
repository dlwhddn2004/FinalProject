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
    
<div class="row">
  <div class="col">
    <div class="card">
      <!-- Card header -->
      <div class="card-header border-0">
        <h3 class="mb-0">GANTT 차트</h3>
        <div class="accordion" id="accordionExample">
          <div style="display: flex; width: 400px; margin: 10px 0px 10px 0px;">
            <select class="form-control select-project" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="프로젝트 선택">
              <option>번호 : 1 이름 : ERP 프로젝트</option>
            </select>
            <div style="margin: 0px 0px 0px 10px;">
              <button type="button" class="btn btn-outline-primary btn-view" data-toggle="tooltip" data-placement="top" title="해당 프로젝트 상세 정보로 이동합니다.">VIEW</button>
            </div>
          </div>
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
                    <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input" value="전체" checked>
                    <label class="custom-control-label" for="customRadioInline1">전체</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input" value="신규">
                    <label class="custom-control-label" for="customRadioInline2">신규</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="customRadioInline3" name="customRadioInline1" class="custom-control-input" value="완료">
                    <label class="custom-control-label" for="customRadioInline3">완료</label>
                  </div>
                </div>
                <br>
                <small style="color: #2e2e2e; margin: 0px 10px 0px 0px">제목</small>
                <div class="form-group">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <div class="input-group-text">
                        <input type="checkbox" class="checkbox-title" aria-label="Checkbox for following text input">
                      </div>
                    </div>
                    <input type="text" class="form-control ipt-function-title" aria-label="Text input with checkbox" placeholder="제목을 입력해주세요.">
                  </div>
                </div>
                <small style="color: #2e2e2e; margin: 0px 10px 0px 0px">담당자</small>
                <div class="form-group">
                  <select class="form-control select-manager" data-toggle="select" title="Simple select" data-live-search="true" data-live-search-placeholder="담당자">
                    <option>조건 없음</option>
                    <option>김재석 (PL)</option>
                    <option>이종우 (DA)</option>
                    <option>김덕년 (TA)</option>
                    <option>신나라 (UA)</option>
                    <option>김태진 (AA)</option>
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
              <th scope="col" class="sort" data-sort="title">제목</th>
              <th scope="col" class="sort" data-sort="regdate">시작일</th>
              <th scope="col" class="sort" data-sort="enddate">마감일</th>
              <th scope="col">담당자</th>
              <th scope="col" class="sort" data-sort="progress" colspan="2">진척도</th>
            </tr>
          </thead>
          <tbody class="list">
            <tr>
              <th scope="row">
                <div class="media align-items-center">
                  <div class="media-body">
                    <span class="title mb-0 text-sm">캘린더의 특정 날짜에 일정을 추가 구현</span>
                  </div>
                </div>
              </th>
              <td class="regdate">
                2020-08-25
              </td>
              <td>
                2020-08-27
              </td>
              <td>
                <div class="avatar-group">
                  <a href="#" class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="iai6203">
                    <img alt="Image placeholder" src="../../assets/img/theme/team-1.jpg">
                  </a>
                </div>
              </td>
              <td colspan="2">
                <div class="d-flex align-items-center">
                  <span class="completion mr-2">60%</span>
                  <div>
                    <div class="progress">
                      <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                    </div>
                  </div>
                </div>
              </td>
            </tr>
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