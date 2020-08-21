<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
	<meta name="author" content="Creative Tim">
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
	<!-- Argon CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">
</head>
<body>
	<div class="row">
        <div class="col">
          <!-- 진행 프로젝트 -->
          <div class="card">
            <!-- Card header -->
            <div class="card-header border-0">
              <h3 class="mb-0">진행 프로젝트</h3>
            </div>
            <!-- Light table -->
            <div class="table-responsive">
              <table class="table align-items-center table-flush datatable-buttons">
                <thead class="thead-light">
                  <tr>
                    <th scope="col" class="sort" data-sort="name">Project</th>
                    <th scope="col" class="sort" data-sort="budget">Budget</th>
                    <th scope="col" class="sort" data-sort="status">Status</th>
                    <th scope="col">Users</th>
                    <th scope="col">Completion</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody class="list">
                  <c:forEach items="${projectList }" var="item">
                  <tr>
                    <th scope="row">
                      <div class="media align-items-center">
                        <a href="#" class="avatar rounded-circle mr-3">
                          <img alt="Image placeholder" src="../../assets/img/theme/bootstrap.jpg">
                        </a>
                        <div class="media-body">
                          <span class="name mb-0 text-sm">${item.PROJECT_TITLE }</span>
                        </div>
                      </div>
                    </th>
                    <td class="budget">
                      ${item.PROJECT_BUDGET } KW
                    </td>
                    <td>
                      <span class="badge badge-dot mr-4">
                        <i class="bg-success"></i>
                        <span class="status">진행중</span>
                      </span>
                    </td>
                    <td>
                      <div class="avatar-group">
                        <c:if test="${!empty item.PL }">
                        <a class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="${item.PL }">
                          <img alt="Image placeholder" src="/team-1.jpg">
                        </a>
                        </c:if>
                        <c:if test="${empty item.PL }">
                        <a class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="모집 중">
                          <img alt="Image placeholder" src="/default-pic.png">
                        </a>
                        </c:if>
                        
                        <c:if test="${!empty item.TA }">
                        <a class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="${item.TA }">
                          <img alt="Image placeholder" src="/team-2.jpg">
                        </a>
                        </c:if>
                        <c:if test="${empty item.TA }">
                        <a class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="모집 중">
                          <img alt="Image placeholder" src="/default-pic.png">
                        </a>
                        </c:if>
                        
                        <c:if test="${!empty item.DA }">
                        <a class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="${item.DA }">
                          <img alt="Image placeholder" src="/team-3.jpg">
                        </a>
                        </c:if>
                        <c:if test="${empty item.DA }">
                        <a class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="모집 중">
                          <img alt="Image placeholder" src="/default-pic.png">
                        </a>
                        </c:if>
                        
                        <c:if test="${!empty item.UA }">
                        <a class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="${item.UA }">
                          <img alt="Image placeholder" src="/team-4.jpg">
                        </a>
                        </c:if>
                        <c:if test="${empty item.UA }">
                        <a class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="모집 중">
                          <img alt="Image placeholder" src="/default-pic.png">
                        </a>
                        </c:if>
                        
                        <c:if test="${!empty item.AA }">
                        <a class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="${item.AA }">
                          <img alt="Image placeholder" src="/team-5.jpg">
                        </a>
                        </c:if>
                        <c:if test="${empty item.AA }">
                        <a class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="모집 중">
                          <img alt="Image placeholder" src="/default-pic.png">
                        </a>
                        </c:if>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center">
                        <span class="completion mr-2">30%</span>
                        <div>
                          <div class="progress">
                            <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%;"></div>
                          </div>
                        </div>
                      </div>
                    </td>
                    <td class="text-right">

                    </td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>

          <!-- 완료 프로젝트 -->
          <div class="card">
            <!-- Card header -->
            <div class="card-header border-0">
              <h3 class="mb-0">완료 프로젝트</h3>
            </div>
            <!-- Light table -->
            <div class="table-responsive">
              <table class="table align-items-center table-flush datatable-buttons">
                <thead class="thead-light">
                <tr>
                  <th scope="col" class="sort" data-sort="name">Project</th>
                  <th scope="col" class="sort" data-sort="budget">Budget</th>
                  <th scope="col" class="sort" data-sort="status">Status</th>
                  <th scope="col">Users</th>
                  <th scope="col">Completion</th>
                  <th scope="col"></th>
                </tr>
                </thead>
                <tbody class="list">
                <tr>
                  <th scope="row">
                    <div class="media align-items-center">
                      <a href="#" class="avatar rounded-circle mr-3">
                        <img alt="Image placeholder" src="../../assets/img/theme/angular.jpg">
                      </a>
                      <div class="media-body">
                        <span class="name mb-0 text-sm">ERP 매니징</span>
                      </div>
                    </div>
                  </th>
                  <td class="budget">
                    1200 KW
                  </td>
                  <td>
                      <span class="badge badge-dot mr-4">
                        <i class="bg-danger"></i>
                        <span class="status">종료</span>
                      </span>
                  </td>
                  <td>
                    <div class="avatar-group">
                      <a href="#" class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="김재석">
                        <img alt="Image placeholder" src="../../assets/img/theme/team-1.jpg">
                      </a>
                      <a href="#" class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="이종우">
                        <img alt="Image placeholder" src="../../assets/img/theme/team-2.jpg">
                      </a>
                    </div>
                  </td>
                  <td>
                    <div class="d-flex align-items-center">
                      <span class="completion mr-2">100%</span>
                      <div>
                        <div class="progress">
                          <div class="progress-bar bg-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
                        </div>
                      </div>
                    </div>
                  </td>
                  <td class="text-right">

                  </td>
                </tr>
                </tbody>	
              </table>
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
	<!-- Argon JS -->
	<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
	
	<script type="text/javascript">
	
	</script>
</body>
</html>