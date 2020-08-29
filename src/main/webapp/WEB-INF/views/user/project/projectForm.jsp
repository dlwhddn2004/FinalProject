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


<style>
.projectForm .btn-processStatus {
	font-family: inherit;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.25;
	display: inline-block;
	width: 100%;
	margin: 0;
	margin: .5rem 0;
	padding: 1.5rem;
	cursor: pointer;
	text-align: left;
	vertical-align: middle;
	text-decoration: none;
	color: #32325d;
	border-radius: .375rem;
	border-color: #5e72e4;
	background-color: #fff;
	-moz-appearance: none;
}

.projectForm .btn-processStatus:hover {
	background-color: #fff;
	box-shadow: rgba(0, 0, 0, .1) 0 0 0 1px, rgba(0, 0, 0, .1) 0 4px 16px;
}

.projectForm .btn-processStatus>div {
	display: flex;
	align-items: center;
}

.projectForm .btn-processStatus i {
	font-size: 1.5rem;
	box-sizing: content-box;
	vertical-align: middle;
	color: #5e72e4;
}

.projectForm .btn-processStatus span {
	font-size: .875rem;
	line-height: 1.5;
	display: inline-block;
	overflow: hidden;
	margin-left: 16px;
	vertical-align: middle;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>

<div class="projectForm">
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					<h3 class="mb-0">프로젝트 등록</h3>
					<p class="text-sm mb-0">100만여 명의 디벨로퍼를 대상으로 프로젝트를 등록하고, 견적과
						지원서를 무료로 받아보세요.</p>
				</div>
				<div class="card-body"></div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-4">
			<div class="card">
				<!-- Card image -->
				<img class="card-img-top" src="${pageContext.request.contextPath}/assets/img/theme/projectForm.jpg"
					alt="Image placeholder">
				<!-- List group -->
				<ul class="list-group list-group-flush">
					<li class="list-group-item">프로젝트 정보 등록</li>
					<li class="list-group-item">프로젝트 등록 완료</li>
					<!--              <li class="list-group-item">Vestibulum at eros</li>-->
				</ul>
				<!-- Card body -->
				<!--            <div class="card-body">
              <h3 class="card-title mb-3">Card title</h3>
              <p class="card-text mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis non dolore est fuga nobis ipsum illum eligendi nemo iure repellat, soluta, optio minus ut reiciendis voluptates enim impedit veritatis officiis.</p>
              <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>-->
			</div>
		</div>
		<div class="col-lg-8">
			<div class="card">
				<!-- Card header -->
				<div class="card-header">
					<h3 class="mb-0">프로젝트 정보 등록</h3>
				</div>
				<!-- Card body -->
				<div class="card-body">
					<form>
						<div class="form-group flex-column">
							<label class="col-form-label form-control-label">프로젝트 진행
								방식</label> <label style="color: tomato">*</label>
							<p class="text-muted" style="font-size: small">프로젝트에 적합한 작업자를
								모집하기 위해 프로젝트 진행 방식을 선택해주세요</p>
							<div class="row">
								<!--                    <input class="form-control" type="text" value="John Snow" id="example-text-input">-->
								<div class="col-lg-3 col-md-6">
									<button name="processStatus" type="button"
										class="btn-processStatus" value="외주">
										<div>
											<i class="ni ni-chart-pie-35"></i> <span>외주</span>
										</div>
									</button>
								</div>
								<div class="col-lg-3 col-md-6">
									<button name="processStatus" type="button"
										class="btn-processStatus" value="상주">
										<div>
											<i class="ni ni-chart-pie-35"></i> <span>상주</span>
										</div>
									</button>
								</div>
							</div>
						</div>
						<div class="form-group flex-column">
							<label class="col-form-label form-control-label">프로젝트 진행
								분류</label> <label style="color: tomato">*</label>
							<div class="custom-control custom-radio mb-3">
								<input type="radio" id="customRadio1" name="customRadio"
									class="custom-control-input" value="신규"> <label
									class="custom-control-label" for="customRadio1">신규 프로젝트</label>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio2" name="customRadio"
									class="custom-control-input" value="유지보수"> <label
									class="custom-control-label" for="customRadio2">운영 중인
									서비스의 리뉴얼 or 유지보수</label>
							</div>
						</div>
						<div align="right" style="padding: 15px 15px 0px 0px;">
							<button type="button" class="btn btn-primary btn-write">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script
	src="${pageContext.request.contextPath }/assets/vendor/jquery/dist/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/js-cookie/js.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
<!-- Optional JS -->
<script
	src="${pageContext.request.contextPath }/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/datatables.net-buttons/js/buttons.print.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/datatables.net-select/js/dataTables.select.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<!-- Argon JS -->
<script
	src="${pageContext.request.contextPath }/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath }/assets/js/demo.min.js"></script>