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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/datatables.net-select-bs4/css/select.bootstrap4.min.css">
<!-- Argon CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0"
	type="text/css">

<!-- My CSS -->
<style type="text/css">
.project .table-row-data:hover {
	background-color: #5e72e4;
	color: white;
	cursor: pointer;
	transition: 0.5s;
}
</style>

<div class="row project">
	<div class="col">
		<!-- 진행 프로젝트 -->
		<div class="card" style="padding-bottom: 20px;">
			<!-- Card header -->
			<div class="card-header border-0">
				<h3 class="mb-0">진행 프로젝트</h3>
			</div>
			<!-- Light table -->
			<div class="table-responsive">
				<table
					class="table align-items-center table-flush datatable-buttons">
					<thead class="thead-light">
						<tr>
							<th scope="col">Project</th>
							<th scope="col">Budget</th>
							<th scope="col">Status</th>
							<th scope="col">Users</th>
							<th scope="col">Completion</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody class="list">
						<c:forEach items="${notProjectList }" var="item">
							<tr class="table-row-data">
								<input type="hidden" name="project_no" value="${item.PROJECT_NO }">
								<th scope="row">
									<div class="media align-items-center">
										<a href="#" class="avatar rounded-circle mr-3"> <img
											alt="Image placeholder" src="/${item.TECH_NAME }.jpg">
										</a>
										<div class="media-body">
											<span class="name mb-0 text-sm">${item.PROJECT_TITLE }</span>
										</div>
									</div>
								</th>
								<td class="budget">${item.PROJECT_BUDGET } KW</td>
								<td><span class="badge badge-dot mr-4"> <i
										class="bg-success"></i> <span class="status">진행중</span>
								</span></td>
								<td>
									<div class="avatar-group">
										<c:if test="${!empty item.PL }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="${item.PL } (PL)">
												<img alt="Image placeholder" src="/${item.PL_PIC_SAVENAME }">
											</a>
										</c:if>
										<c:if test="${empty item.PL }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="모집 중 (PL)"> <img
												alt="Image placeholder" src="/default-pic.png">
											</a>
										</c:if>

										<c:if test="${!empty item.TA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="${item.TA } (TA)">
												<img alt="Image placeholder" src="/${item.TA_PIC_SAVENAME }">
											</a>
										</c:if>
										<c:if test="${empty item.TA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="모집 중 (TA)"> <img
												alt="Image placeholder" src="/default-pic.png">
											</a>
										</c:if>

										<c:if test="${!empty item.DA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="${item.DA } (DA)">
												<img alt="Image placeholder" src="/${item.DA_PIC_SAVENAME }">
											</a>
										</c:if>
										<c:if test="${empty item.DA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="모집 중 (DA)"> <img
												alt="Image placeholder" src="/default-pic.png">
											</a>
										</c:if>

										<c:if test="${!empty item.UA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="${item.UA } (UA)">
												<img alt="Image placeholder" src="/${item.UA_PIC_SAVENAME }">
											</a>
										</c:if>
										<c:if test="${empty item.UA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="모집 중 (UA)"> <img
												alt="Image placeholder" src="/default-pic.png">
											</a>
										</c:if>

										<c:if test="${!empty item.AA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="${item.AA } (AA)">
												<img alt="Image placeholder" src="/${item.AA_PIC_SAVENAME }">
											</a>
										</c:if>
										<c:if test="${empty item.AA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="모집 중 (AA)"> <img
												alt="Image placeholder" src="/default-pic.png">
											</a>
										</c:if>
									</div>
								</td>
								<td>
									<div class="d-flex align-items-center">
										<span class="completion mr-2">${item.AVERAGE }%</span>
										<div>
											<div class="progress">
												<c:if test="${item.AVERAGE != '100' }">
													<div class="progress-bar bg-danger" role="progressbar"
														aria-valuenow="${item.AVERAGE }" aria-valuemin="0"
														aria-valuemax="100" style="width: ${item.AVERAGE }%;"></div>
												</c:if>
												<c:if test="${item.AVERAGE == '100' }">
													<div class="progress-bar bg-success" role="progressbar"
														aria-valuenow="${item.AVERAGE }" aria-valuemin="0"
														aria-valuemax="100" style="width: ${item.AVERAGE }%;"></div>
												</c:if>
											</div>
										</div>
									</div>
								</td>
								<td class="text-right">
									<div class="dropdown">
										<button type="button" class="btn btn-sm btn-Secondary"
											data-toggle="tooltip" data-placement="left"
											title="해당 프로젝트 캘린더로 이동합니다.">
											<i class="far fa-calendar-alt"></i>
										</button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!-- 완료 프로젝트 -->
		<div class="card" style="padding-bottom: 20px;">
			<!-- Card header -->
			<div class="card-header border-0">
				<h3 class="mb-0">완료 프로젝트</h3>
			</div>
			<!-- Light table -->
			<div class="table-responsive">
				<table
					class="table align-items-center table-flush datatable-buttons">
					<thead class="thead-light">
						<tr>
							<th scope="col">Project</th>
							<th scope="col">Budget</th>
							<th scope="col">Status</th>
							<th scope="col">Users</th>
							<th scope="col">Completion</th>
						</tr>
					</thead>
					<tbody class="list">
						<c:forEach items="${finishProjectList }" var="item">
							<input type="hidden" name="project_no" value="${item.PROJECT_NO }">
							<tr class="table-row-data">
								<th scope="row">
									<div class="media align-items-center">
										<a href="#" class="avatar rounded-circle mr-3"> <img
											alt="Image placeholder" src="/${item.TECH_NAME }.jpg">
										</a>
										<div class="media-body">
											<span class="name mb-0 text-sm">${item.PROJECT_TITLE }</span>
										</div>
									</div>
								</th>
								<td class="budget">${item.PROJECT_BUDGET } KW</td>
								<td><span class="badge badge-dot mr-4"> <i
										class="bg-danger"></i> <span class="status">완료</span>
								</span></td>
								<td>
									<div class="avatar-group">
										<c:if test="${!empty item.PL }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="${item.PL } (PL)">
												<img alt="Image placeholder" src="/${item.PL_PIC_SAVENAME }">
											</a>
										</c:if>
										<c:if test="${empty item.PL }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="없음 (PL)"> <img
												alt="Image placeholder" src="/default-pic.png">
											</a>
										</c:if>

										<c:if test="${!empty item.TA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="${item.TA } (TA)">
												<img alt="Image placeholder" src="/${item.TA_PIC_SAVENAME }">
											</a>
										</c:if>
										<c:if test="${empty item.TA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="없음 (TA)"> <img
												alt="Image placeholder" src="/default-pic.png">
											</a>
										</c:if>

										<c:if test="${!empty item.DA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="${item.DA } (DA)">
												<img alt="Image placeholder" src="/${item.DA_PIC_SAVENAME }">
											</a>
										</c:if>
										<c:if test="${empty item.DA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="없음 (DA)"> <img
												alt="Image placeholder" src="/default-pic.png">
											</a>
										</c:if>

										<c:if test="${!empty item.UA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="${item.UA } (UA)">
												<img alt="Image placeholder" src="/${item.UA_PIC_SAVENAME }">
											</a>
										</c:if>
										<c:if test="${empty item.UA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="없음 (UA)"> <img
												alt="Image placeholder" src="/default-pic.png">
											</a>
										</c:if>

										<c:if test="${!empty item.AA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="${item.AA } (AA)">
												<img alt="Image placeholder" src="/${item.AA_PIC_SAVENAME }">
											</a>
										</c:if>
										<c:if test="${empty item.AA }">
											<a class="avatar avatar-sm rounded-circle"
												data-toggle="tooltip" data-original-title="없음 (AA)"> <img
												alt="Image placeholder" src="/default-pic.png">
											</a>
										</c:if>
									</div>
								</td>
								<td>
									<div class="d-flex align-items-center">
										<span class="completion mr-2">30%</span>
										<div>
											<c:if test="${item.AVERAGE != '100' }">
												<div class="progress-bar bg-danger" role="progressbar"
													aria-valuenow="${item.AVERAGE }" aria-valuemin="0"
													aria-valuemax="100" style="width: ${item.AVERAGE }%;"></div>
											</c:if>
											<c:if test="${item.AVERAGE == '100' }">
												<div class="progress-bar bg-success" role="progressbar"
													aria-valuenow="${item.AVERAGE }" aria-valuemin="0"
													aria-valuemax="100" style="width: ${item.AVERAGE }%;"></div>
											</c:if>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
	src="${pageContext.request.contextPath}/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.print.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/datatables.net-select/js/dataTables.select.min.js"></script>
<!-- Argon JS -->
<script
	src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

<script type="text/javascript">
	$('.project .table-row-data').on('click', function() {
		const project_no = $(this).find('input[name=project_no]').val();
		
		location.href = '${pageContext.request.contextPath}/user/project/projectView.do?project_no=' + project_no + '&mem_id=${MEMBER_LOGININFO.mem_id }';
	})
</script>