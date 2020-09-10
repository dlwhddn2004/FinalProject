<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Start your development with a Dashboard for Bootstrap 4.">
<meta name="author" content="CONNECTOR">
<title>Insert title here</title>

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
<!-- Sweet Alerts -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.css">

<!-- My CSS -->
<style type="text/css">
.table-row-data:hover {
	background-color: #5e72e4;
	color: white;
	cursor: pointer;
	transition: 0.5s;
}
.projectForm .text {
	padding: 5px 0px 5px 80px;
}

.projectlist {
	padding: 5px 0px 5px 30px;
}

.box1 {
	display: flex;
	  margin-left: 5%;
	
}

 .application-status-box{
 display: flex;
 justfy-content : flex-end;
}
.flex{
	  margin-top : 100px;
	  margin-left: 20%;
} 
.pp{
perpectCenter
        display: flex;
        justify-content: center;
        align-items: center;
    }
.bb{
perpectCenter
        display: flex;
        justify-content: center;
        align-items: center;
    


}
.btn1{
	   margin: auto;
        width: 90%;
       
}
</style>

<!-- My JavaScript -->
<script type="text/javascript">




function viewBoardInfo(e) {
	const project_no = $(e).find('input[name=project_no]').val();
	const mem_id = $(e).find('input[name=mem_id]').val();
	
	location.href = "${pageContext.request.contextPath}/user/projectsearch/projectview.do?project_no=" + project_no + "&mem_id=" + mem_id ;
}

</script>
</head>
<body>
<div class="projectForm">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<!--                   카드헤더                     -->
				<div class="card-header">
					<h3 class="mb-0">프로젝트 찾기</h3>
					
					<p class="text-sm mb-0"></p>
				</div>
				<div class="card-body">
					<div>
						<small class="text-muted">등록된 프로젝트를 조회할 수 있습니다.</small>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--                  카드 메뉴랑 폼 묶는 곳                -->
	<div class="row">

		<!--소메뉴 -->
		<div class="col-lg-4">
			<div class="card">
				<div class="text">
 	<form action="${pageContext.request.contextPath }/user/projectsearch/projectsearch.do" method="post" >
					
					<div>
						<br> <label class="form-control-label" for="input-username">프로젝트
							진행 방식</label> <br> <label><input type="checkbox"
							name="project_processstatus"  value="외주"> 외주</label>&nbsp;&nbsp; <label><input
							type="checkbox" name="project_processstatus"   value="상주"> 상주</label>
					</div>
					<br>
					<div>
						<label class="form-control-label" for="input-username">클라이언트
							위치</label><br> <label><input type="checkbox"
							name="project_clientlocation" value="서울">서울특별시</label>&nbsp;&nbsp;<br> <label><input
							type="checkbox" name="project_clientlocation" value="경기도"> 경기도</label>&nbsp;&nbsp;<br>
						<label><input type="checkbox" name="project_clientlocation" value="부산">
							부산광역시</label>
					</div>
					<br>
					<div>
						<label class="form-control-label" for="input-username">프로젝트
							예상 금액</label><br> <label> <select name="project_budget" 
							style="width: 150px;" class="form-control" style="width: 120px;">
								<option value="금액선택">금액선택</option>
								<option value="100만원">100만원</option>
								<option value="200만원">200만원</option>
								<option value="300만원">300만원</option>
								<option value="400만원">400만원</option>
								<option value="500만원">500만원</option>
								<option value="600만원">600만원</option>
								<option value="700만원">700만원</option>
								<option value="800만원">800만원</option>
								<option value="900만원">900만원</option>
								<option value="1000만원">1000만원</option>
								<option value="2000만원">2000만원</option>
								<option value="3000만원">3000만원</option>
								<option value="4000만원">4000만원</option>
								<option value="5000만원">5000만원</option>
								<option value="6000만원">6000만원</option>
								<option value="7000만원">7000만원</option>
								<option value="8000만원">8000만원</option>
								<option value="9000만원">9000만원</option>
								<option value="10,000만원">10,000만원</option>
								<option value="50,000만원">50,000만원</option>
						</select></label> <label> <select name="project_budget"  value="MONEY2" class="form-control"
							style="width: 150px;">
								<option value="금액선택">금액선택</option>
								<option value="100만원">100만원</option>
								<option value="200만원">200만원</option>
								<option value="300만원">300만원</option>
								<option value="400만원">400만원</option>
								<option value="500만원">500만원</option>
								<option value="600만원">600만원</option>
								<option value="700만원">700만원</option>
								<option value="800만원">800만원</option>
								<option value="900만원">900만원</option>
								<option value="1000만원">1000만원</option>
								<option value="2000만원">2000만원</option>
								<option value="3000만원">3000만원</option>
								<option value="4000만원">4000만원</option>
								<option value="5000만원">5000만원</option>
								<option value="6000만원">6000만원</option>
								<option value="7000만원">7000만원</option>
								<option value="8000만원">8000만원</option>
								<option value="9000만원">9000만원</option>
								<option value="10,000만원">10,000만원</option>
								<option value="50,000만원">50,000만원</option>
						</select></label>
					</div>
					<br>
					<div>
						<label class="form-control-label" for="input-username">프로젝트
							예상 기간</label><br>
						<!-- <input type='reset' class="img-button"> -->
						<label> <select value="TERM1" name="search_keyword2" class="form-control"
							style="width: 150px;" style="width: 120px;">
								<option value="기간선택">기간선택</option>
								<option value="7일">7일</option>
						</select></label> <label> <select name="search_keyword2" value="TERM2" class="form-control"
							style="width: 150px;" style="width: 120px;">
								<option value="기간선택">기간선택</option>
								<option value="7일">7일</option>
						</select></label>
					</div>
					<br>

					<div>
						<label class="form-control-label" for="input-username">관련
							기술</label><br>
						<!-- <input type='reset' class="img-button"> -->
						<label> <select name="search_keyword3"  value="TECH" class="form-control"
							style="width: 150px;" style="width: 120px;">
								<option value="기술선택">기술선택</option>
								<option value="angular">angular</option>
								<option value="bootstrap">bootstrap</option>
								<option value="react">react</option>
								<option value="vue">vue</option>
						</select></label>
					</div>
				
				<br>
	
	    <button type="submit"  class="btn btn-primary btn1">검색</button>
</form>


				</div>
			</div>
		</div>
	<!-- Page content -->
	<!-- Table -->
	
		
		<div class="col-lg-8">
			<div class="card">
				<!-- Card header -->
				<div class="card-header">
					<!-- <h3 class="mb-0">성공 사례 게시판</h3>
					<p class="text-sm mb-0">우수한 프로젝트 사례 게시판입니다.</p> -->
				</div>
				<div class="table-responsive py-4">
					<table class="table table-flush datatable-basic">
						<thead class="thead-light">
							<tr>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th></th>
								<th></th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach items="${projectList}" var="item">
						
							
													<p class="body-2-medium estimated estimated-price">
								<tr class="table-row-data" onclick="javascript:viewBoardInfo(this)">
									<td><div class="box1">
										
												<div class="estimated-box" style="">
													<p class="body-2-medium estimated estimated-price">
														
									                    <span class="badge badge-success">진행중</span> <span
										                   class="badge badge-default">new</span>
											<h3 class="mb-0">${item.project_title }</h3>
											
											<input type="hidden" name="project_no" value="${item.project_no }">
											<input type="hidden" name="mem_id" value="${item.mem_id }">
											<br>
														<i class="fas fa-won-sign"></i> <span style = "font-size : 1.3em;">예상 금액</span> <span
															class="mb-0" style = "font-size : 1.3em;">${item.project_budget }원</span>
													</p>
													<p class="mb-0">
														<i class="far fa-clock"></i> <span>예상 기간</span> <span
															class="mb-0">${item.project_duration }일 </span> <br>
											
													 <label class="form-control-label"
														for="input-username">${item.project_note } </label><br>
													<span class="badge badge-info">${item.project_processstatus } </span> | <span
														class="badge badge-primary">${item.tech_name }</span> | <i
														class="fas fa-map-marker-alt"></i><span class="mb-0"
														style="font-size: 0.8em;"> ${item.project_clientlocation }</span> | <span
														class="mb-0" style="font-size: 0.8em;">${item.project_startdate }</span>

													</p>
													
												</div>
												</div>

											</td>
									<td><div class="flex">
													<div class="pp">

														<div class="application-status">
															<i class="fas fa-user"></i>
																		
															 <span
																class="body-2 text600 applicant-status" >총 <strong>${item.project_applyCnt }명</strong>
																지원
															</span>
														</div>
														<br>
														 <div class="bb">
												 
														<span class="deadline-date body-2 text600">마감 <strong>${item.project_time }일전</strong>
														
														</span>
													</div>
													</div>
												</div>
											</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div align="right" style="padding: 15px 15px 0px 0px;">
						<button type="button" class="btn btn-primary btn-write">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- Argon Scripts -->
	<!-- Core -->
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
	<script src="${pageContext.request.contextPath }/assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
	<!-- Argon JS -->
	<script
		src="${pageContext.request.contextPath }/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath }/assets/js/demo.min.js"></script>
</body>
</html>