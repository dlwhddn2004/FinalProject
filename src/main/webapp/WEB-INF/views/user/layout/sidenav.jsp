<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <script src="${pageContext.request.contextPath}/assets/vendor/jquery/dist/jquery.min.js"></script>
  <script>
  	$(function() {
  		$('.link-project-regist---').on('click', function() {
  	  		if(${empty MEMBER_LOGININFO }){
  	  			Swal.fire(
	                  'Warning',
	                  '로그인 후 이용할 수 있습니다.',
	                  'warning'
	                )
	           	return;	
  	  		}
  	  		
  	  		if (${MEMBER_LOGININFO.category_no != '1' }) {
  	  			Swal.fire(
	                  'Warning',
	                  '파트너스 회원만 사용할 수 있습니다.',
	                  'warning'
	                )
	           	return;
  	  		} else {
  	  			$(location).attr('href', '${pageContext.request.contextPath }/user/projectRegist/project_1.do?mem_id=${MEMBER_LOGININFO.mem_id}');
  	  		}
  	  	});
  	});
  </script>

<!-- Sidenav -->
  <nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
    <div class="scrollbar-inner">
      <!-- Brand -->
      <div class="sidenav-header  d-flex  align-items-center">
        <a class="navbar-brand" href="${pageContext.request.contextPath }">
          <img src="${pageContext.request.contextPath }/assets/img/brand/logo_blue.png" class="navbar-brand-img" alt="...">
        </a>
        <div class=" ml-auto ">
          <!-- Sidenav toggler -->
          <div class="sidenav-toggler d-none d-xl-block" data-action="sidenav-unpin" data-target="#sidenav-main">
            <div class="sidenav-toggler-inner">
              <i class="sidenav-toggler-line"></i>
              <i class="sidenav-toggler-line"></i>
              <i class="sidenav-toggler-line"></i>
            </div>
          </div>
        </div>
      </div>
      <div class="navbar-inner">
        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="sidenav-collapse-main">
          <!-- Nav items -->
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" href="#navbar-dashboards" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="navbar-dashboards">
                <i class="ni ni-shop text-primary"></i>
                <span class="nav-link-text">프로젝트</span>
              </a>
              <div class="collapse show" id="navbar-dashboards">
                <ul class="nav nav-sm flex-column">
                  <li class="nav-item">
                    <a class="nav-link link-project-regist---" style="cursor: pointer;">
                      <span class="sidenav-mini-icon"> 등록 </span>
                      <span class="sidenav-normal"> 프로젝트 등록 </span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="${pageContext.request.contextPath }/user/projectsearch/projectsearch.do?mem_id=${MEMBER_LOGININFO.mem_id}" class="nav-link ">
                      <span class="sidenav-mini-icon"> 찾기 </span>
                      <span class="sidenav-normal"> 프로젝트 찾기 </span>
                    </a>
                  </li>
                  <c:if test="${!empty MEMBER_LOGININFO }">
                  <li class="nav-item">
                    <a href="#navbar-multilevel" class="nav-link" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="navbar-multilevel">
                      <span class="sidenav-mini-icon"> 관리 </span>
                      <span class="sidenav-normal"> 프로젝트 관리 </span>
                    </a>
                    <div class="collapse show" id="navbar-multilevel" style="">
                      <ul class="nav nav-sm flex-column">
                        <li class="nav-item">
                          <a href="${pageContext.request.contextPath }/user/project/project.do?mem_id=${MEMBER_LOGININFO.mem_id}" class="nav-link ">프로젝트</a>
                        </li>
                        <li class="nav-item">
                          <a href="${pageContext.request.contextPath }/user/project/project_timeline.do?mem_id=${MEMBER_LOGININFO.mem_id}" class="nav-link ">작업 내역</a>
                        </li>
                        <li class="nav-item">
                          <a href="${pageContext.request.contextPath }/user/task/task.do?mem_id=${MEMBER_LOGININFO.mem_id}" class="nav-link ">일감</a>
                        </li>
                        <li class="nav-item">
                          <a href="${pageContext.request.contextPath }/user/gantt/ganttChart.do?mem_id=${MEMBER_LOGININFO.mem_id }" class="nav-link ">Gantt 차트</a>
                        </li>
                      </ul>
                    </div>
                  </li>
                  </c:if>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#navbar-examples" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-examples">
                <i class="ni ni-ungroup text-orange"></i>
                <span class="nav-link-text">포트폴리오</span>
              </a>
              <div class="collapse" id="navbar-examples">
                <ul class="nav nav-sm flex-column">
                  <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/user/portfolio/portfolioList.do" class="nav-link">
                      <span class="sidenav-mini-icon"> 찾기 </span>
                      <span class="sidenav-normal"> 포트폴리오 찾기 </span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="../../pages/examples/login.html" class="nav-link">
                      <span class="sidenav-mini-icon"> 등록 </span>
                      <span class="sidenav-normal"> 포트폴리오 등록 </span>
                    </a>
                  </li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#navbar-components" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-components">
                <i class="ni ni-ui-04 text-info"></i>
                <span class="nav-link-text">가이드</span>
              </a>
              <div class="collapse" id="navbar-components">
                <ul class="nav nav-sm flex-column">
                  <li class="nav-item">
                    <a href="../../pages/components/buttons.html" class="nav-link">
                      <span class="sidenav-mini-icon"> 소개 </span>
                      <span class="sidenav-normal"> 서비스 소개 </span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="../../pages/components/cards.html" class="nav-link">
                      <span class="sidenav-mini-icon"> 이용 </span>
                      <span class="sidenav-normal"> 디벨로퍼 이용 방법 </span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="../../pages/components/grid.html" class="nav-link">
                      <span class="sidenav-mini-icon"> 이용 </span>
                      <span class="sidenav-normal"> 파트너스 이용 방법 </span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/user/guide/faq.do" class="nav-link">
                      <span class="sidenav-mini-icon"> 질문 </span>
                      <span class="sidenav-normal"> 자주 묻는 질문 </span>
                    </a>
                  </li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#navbar-forms" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-forms">
                <i class="ni ni-single-copy-04 text-pink"></i>
                <span class="nav-link-text">뉴스 센터</span>
              </a>
              <div class="collapse" id="navbar-forms">
                <ul class="nav nav-sm flex-column">
                  <li class="nav-item">
                    <a href="${pageContext.request.contextPath }/user/noticeboard/noticeboardList.do?mem_id=${MEMBER_LOGININFO.mem_id}" class="nav-link">
                      <span class="sidenav-mini-icon"> 공지 </span>
                      <span class="sidenav-normal"> 공지 사항 </span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="${pageContext.request.contextPath }/user/reviewboard/reviewboardList.do" class="nav-link">
                      <span class="sidenav-mini-icon"> 후기 </span>
                      <span class="sidenav-normal"> 이용 후기 </span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="${pageContext.request.contextPath }/user/jobsboard/jobsBoardList.do" class="nav-link">
                      <span class="sidenav-mini-icon"> 채용 </span>
                      <span class="sidenav-normal"> 채용 공고 </span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="${pageContext.request.contextPath }/user/successboard/successboardList.do" class="nav-link">
                      <span class="sidenav-mini-icon"> 성공 </span>
                      <span class="sidenav-normal"> 프로젝트 성공 사례 </span>
                    </a>
                  </li>
                </ul>
              </div>
            </li>
        </div>
      </div>
    </div>
  </nav>