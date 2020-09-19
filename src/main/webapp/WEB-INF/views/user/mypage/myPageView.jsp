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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/datatables.net-select-bs4/css/select.bootstrap4.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/select2/dist/css/select2.min.css">
<!-- Argon CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0"
	type="text/css">
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

.img-hover-css img:hover {
	animation-name: img-hover;
	animation-duration: 0.25s;
	animation-iteration-count: 2;
	animation-direction: alternate;
}

@keyframes img-hover {
  0% {
    transform: scale(1.0);
    opacity: 1.0;
  }
  100% {
    transform: scale(1.05);
    opacity: 0.8;
  }
}



.font-test {
	display: flex;
	justify-content: space-around;
	margin-top: 30px;
	margin-bottom: 20px;
}
/*    .mypage-about{
                display: flex;
                flex-direction: column;
            }*/
.perfect-center {
	display: flex;
	justify-content: center;
	align-items: center;
}

*,*::after,*::before {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

::-webkit-input-placeholder {
	opacity: 0.8;
	color: white;
}

::-moz-placeholder {
	opacity: 0.8;
	color: white;
}

:-moz-placeholder {
	opacity: 0.8;
	color: white;
}

:-ms-input-placeholder {
	opacity: 0.8;
	color: white;
}

body {
	font-size: 20px;
	line-height: 1.4;
	color: rgba(255, 255, 255, 0.8);
	background: #1d1f20;
}

.preview {
	display: block;
	width: 200px;
	height: 200px;
	margin: 20px auto;
	box-shadow: 0px 0px 0px 2px rgba(33, 122, 105, 1);
	border-radius: 50%;
	overflow: hidden;
}

.file-upload-wrapper {
	position: relative;
	z-index: 5;
	display: block;
	width: 250px;
	height: 30px;
	margin: 25px auto;
	border-radius: 0px;
	border-bottom: 1px dashed rgba(33, 122, 105, 1);
}

.file-upload-native,.file-upload-text {
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	width: 100%;
	height: 100%;
	cursor: pointer;
	color: bule;
}

input[type="file"]::-webkit-file-upload-button {
	cursor: pointer;
}

.file-upload-native:focus,.file-upload-text:focus {
	outline: none;
}

.file-upload-text {
	z-index: 10;
	padding: 5px 15px 8px;
	overflow: hidden;
	font-size: 14px;
	line-height: 1.4;
	cursor: pointer;
	text-align: center;
	letter-spacing: 1px;
	text-overflow: ellipsis;
	border: 0;
	background-color: transparent;
}

.file-upload-native {
	z-index: 15;
	opacity: 0;
}
</style>



<div class="row">
	<div class="col-md-4 order-xl-2">
		<div class="card card-profile">
			<img src="${pageContext.request.contextPath}/assets/img/theme/img-1-1000x600.jpg"
				alt="Image placeholder" class="card-img-top">
			<div class="row justify-content-center">
				<div class="col-lg-3 order-lg-2">
					<div class="card-profile-image">
						<a href="#"> <img class="rounded-circle"
							src="/${profileFileInfo.profile_savename}" alt="...">
						</a>
					</div>
				</div>
			</div>
			<div
				class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
				<div class="d-flex justify-content-between">
					<a href="#" class="btn btn-sm btn-info  mr-4 ">Connect</a> <a
						href="#" class="btn btn-sm btn-default float-right">Message</a>
				</div>
			</div>
			<div class="card-body pt-0">
				<div class="row">
					<div class="col">
						<div class="card-profile-stats d-flex justify-content-center">
							<div>
								<span class="heading">${portfolioNum}</span> <label
									class="col-form-label form-control-label">포트폴리오</label>
							</div>
							<div>
								<span class="heading">${projectNum }</span> <label
									class="col-form-label form-control-label">프로젝트</label>
							</div>
							<div>
								<c:if test="${empty memberAttribute.technologiesNum }">
									<span class="heading technologiesNum">0</span>
								</c:if>
								<c:if test="${!empty memberAttribute.technologiesNum }">
									<span class="heading technologiesNum">${memberAttribute.technologiesNum }</span>
								</c:if>

								<label class="col-form-label form-control-label">보유 기술</label>
							</div>
						</div>
					</div>
				</div>
				<div class="text-center">
					<h5 class="h3">${MEMBER_LOGININFO.mem_id }<span
							class="font-weight-light">, ${memberAttribute.MEM_AGE }</span>
					</h5>
					<div class="h5 font-weight-300">
						<c:if test="${mypageMemberInfo.category_no == 2 }">
							<span class="badge badge-default">developer</span>
						</c:if>
						<c:if test="${mypageMemberInfo.category_no == 1 }">
							<span class="badge badge-primary">Partners</span>
						</c:if>
					</div>
					<!-- 평점 -->
					<div
						style="display: flex; justify-content: center; align-items: center;">
						<i class="fas fa-star fa-2x" style="color: gold"></i> <i
							class="fas fa-star fa-2x" style="color: gold"></i> <i
							class="fas fa-star fa-2x" style="color: gold"></i> <i
							class="fas fa-star fa-2x"></i> <i class="fas fa-star fa-2x"></i>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="col-md-8">
		<div class="card">
			<div class="card-header">
				<div class="row align-items-center">
					<div class="col-8">
						<h3 class="mb-0 text-blue">활동 요약 정보</h3>
						<label class="col-form-label form-control-label text-muted">자신의
							정보를 간략하게 확인 할수 있는 마이페이지입니다.</label> <label style="color: tomato">*</label>
					</div>

					<div class="col-4 text-right">
						<button class="btn btn-icon btn-primary" type="button"
							data-toggle="modal" data-target="#modal-form2"
							style="margin: 15px 0px 0px 0px;">
							<span class="btn-inner--icon"><i class="ni ni-bag-17"></i></span>
							<span class="btn-inner--text">기본 프로필 업데이트하기</span>
						</button>
						<div class="modal fade" id="modal-form2" tabindex="-1"
							role="dialog" aria-labelledby="modal-form" aria-hidden="true">
							<div
								class="modal-dialog modal- modal-dialog-centered modal-sm modal-test"
								role="document">
								<div class="modal-content">

									<div class="modal-body p-0">
										<div class="card bg-secondary border-0 mb-0">
											<div class="card-body px-lg-5 py-lg-5">
												<div class="text-center text-muted mb-4">
													<small>대표 프로필 사진</small>
												</div>
												<form role="form" class="my-about-form"
													action="${pageContext.request.contextPath}/user/mypage/modifyMyabout.do"
													method="post" enctype="multipart/form-data">
													<input type="hidden" name="mem_id"
														value="${MEMBER_LOGININFO.mem_id }"> <input
														type="hidden" name="category_no"
														value="${MEMBER_LOGININFO.category_no }">

													<div class="form-group">
														<div class="preview img-wrapper"></div>
														<div class="file-upload-wrapper">
															<input type="file" name="files"
																class="file-upload-native" accept="image/*" /> <input
																type="text" disabled placeholder="upload image"
																class="file-upload-text" />
														</div>
													</div>
													<div class="text-center text-muted mb-4">
														<small>자기 소개</small>
													</div>
													<div class="form-group mb-3">
														<div
															class="input-group input-group-merge input-group-alternative">
															<div class="input-group-prepend">
																<span class="input-group-text"><i
																	class="far fa-file-alt"></i></span>
															</div>
															<textarea class="form-control mypage_aboutme"
																id="exampleFormControlTextarea2" rows="6"
																name="mypage_aboutme" placeholder="내용을 작성해주세요" required></textarea>
														</div>
													</div>

													<div class="text-center">
														<button type="submit"
															class="btn btn-info my-3 updateAbout"
															name="updateMypageInfo">수정하기</button>
														<button type="button" class="btn btn-warning my-4"
															data-dismiss="modal">취소</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row align-items-center">
					<div class="col-12" style="margin-top: 15px;"></div>
				</div>
			</div>
		</div>



		<div class="card-group">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h6 class="surtitle">프로젝트</h6>
						<h5 class="h3 mb-0">진행한 프로젝트</h5>
					</div>
					<div class="card-body">
						<h4 class="text-center">[ Angular :
							${projectChartInfo.Angular} | React : ${projectChartInfo.React} |
							Bootstrap : ${projectChartInfo.Bootstrap} | Vue :
							${projectChartInfo.Vue} ]</h4>
						<div class="chart">
							<!-- Chart wrapper -->
							<canvas id="pieChart" class="chart-canvas"></canvas>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h6 class="surtitle">전문성</h6>
						<h5 class="h3 mb-0">세부항목 평가</h5>
					</div>
					<div class="card-body">
						<h4 class="text-center">회원님의 전문성을 쉽게 확인해주세요.</h4>
						<div class="chart">
							<canvas id="chartjs-3" class="chartjs" width="undefined"
								height="undefined"></canvas>

						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="col-md-12">
			<div class="card">
				<!-- Card header -->
				<div class="card-header">
					<h3 class="mb-0">마이페이지 세부 정보</h3>
					<label class="col-form-label form-control-label text-muted">자신의
						정보를 구체적으로 확인 할수 있습니다.</label> <label style="color: tomato">*</label>
				</div>
				<!-- Card body -->
				<div class="card-body">
					<div class="accordion" id="accordionExample">

						<div class="card">
							<div class="card-header bg-success" id="headingTwo"
								data-toggle="collapse" data-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">
								<h5 class="mb-0 text-white">자기 소개</h5>
							</div>
							<div id="collapseTwo" class="collapse"
								aria-labelledby="headingTwo" data-parent="#accordionExample">
								<div class="card-body">
									<!-- 자기소개가 없으면 이미지 보여주기 -->
									<c:if test="${empty mypageMemberInfo.mypage_aboutme }">
										<div class="text-lg-center text-muted">
											<h1>등록된 자기소개가 없습니다.</h1>
										</div>
										<div
											style="display: flex; justify-content: center; align-items: center; margin: 10px 10px 10px 10px;">
											<button class="btn btn-icon btn-outline-primary"
												type="button" style="margin: 15px 0px 0px 0px;"
												data-toggle="modal" data-target="#modal-form2">
												<span class="btn-inner--icon"><i class="ni ni-bag-17"></i></span>
												<span class="btn-inner--text">자기소개 등록</span>
											</button>
										</div>
									</c:if>
									<c:if test="${!empty mypageMemberInfo.mypage_aboutme }">
										<div>
											<p>${mypageMemberInfo.mypage_aboutme }</p>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header bg-success" id="headingThree"
								data-toggle="collapse" data-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								<h5 class="mb-0 text-white">포트폴리오</h5>
							</div>
							<div id="collapseThree" class="collapse"
								aria-labelledby="headingThree" data-parent="#accordionExample">
								<div class="card-body">
									<div class="row">
										<c:forEach items="${mypagePortfolioList }" var="portfolioList">
											<div class="col-md-4">
												<div class="card">
													<!-- Card image -->
													<div class="modal-header img-hover-css"
														style="margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;"
														onclick="goPortfolioView(this);">
														<input type="hidden" name="portfolio_no"
															value="${portfolioList.PORTFOLIO_NO }"> <input
															type="hidden" name="mem_id"
															value="${portfolioList.MEM_ID }"> <img
															class="card-img-top img-center img-fluid"
															src="/${portfolioList.PORTFOLIO_THUMBNAILIMG }"
															alt="Image placeholder">
													</div>
													<!-- Card body -->
													<div class="card-body">
														<small class="text-muted">TITLE</small>
														<h5 class="h2 card-title mb-0">${portfolioList.PORTFOLIO_NAME }</h5>
														<small class="text-muted">${portfolioList.PORTFOLIO_REGDATE }</small>
													</div>
													<div class="card-footer">
														<div style="display: flex; justify-content: flex-end;">
															<c:if
																test="${portfolioList.PORTFOLIO_TECHNOLOGIES == '1' }">
																<span class="badge badge-pill badge-success">angular</span>
															</c:if>
															<c:if
																test="${portfolioList.PORTFOLIO_TECHNOLOGIES == '2' }">
																<span class="badge badge-pill badge-info">bootstrap</span>
															</c:if>
															<c:if
																test="${portfolioList.PORTFOLIO_TECHNOLOGIES == '3' }">
																<span class="badge badge-pill badge-danger">react</span>
															</c:if>
															<c:if
																test="${portfolioList.PORTFOLIO_TECHNOLOGIES == '4' }">
																<span class="badge badge-pill badge-primary">vue</span>
															</c:if>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
									<div
										style="display: flex; justify-content: flex-end; align-items: flex-end; margin: 10px 10px 10px 10px;">
										<button class="btn btn-icon btn-primary inserPortfolio"
											type="button">
											<span class="btn-inner--icon"><i class="far fa-file-powerpoint"></i></span>
											<span class="btn-inner--text">포트폴리오 등록</span>
										</button>
									</div>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header bg-success" id="headingOne"
								data-toggle="collapse" data-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne">
								<h5 class="mb-0 text-white">테크놀러지</h5>
							</div>
							<div id="collapseOne" class="collapse show"
								aria-labelledby="headingOne" data-parent="#accordionExample">
								<div class="card-body">
									<div class="accordion" id="faq1">
										<div class="card">
											<div class="card-header" id="faqHeading1-1"
												data-toggle="collapse" data-target="#faqcollapse1"
												aria-expanded="true" aria-controls="faqcollapse1-1">
												<h5 class="mb-0">보유 기술</h5>

											</div>
											<div id="faqcollapse1" class="collapse show"
												aria-labelledby="faqHeading1-1" data-parent="#faq1">
												<div class="card-body">
													<ul class="list-group list-group-flush list my--3">
														<li class="list-group-item px-0">
															<div class="row align-items-center">
																<div class="col-auto">
																	<!-- Avatar -->
																	<a href="#" class="avatar rounded-circle"> <img
																		alt="Image placeholder"
																		src="${pageContext.request.contextPath}/assets/img/theme/angular.jpg">
																	</a>
																</div>
																<div class="col">
																	<h5>Angular</h5>
																	<div class="progress progress-xs mb-0">
																		<div class="progress-bar bg-gradient-red angularBar" role="progressbar"
																			aria-valuenow="0" aria-valuemin="0"
																			aria-valuemax="100" ></div>
																	</div>
																</div>
															</div>
														</li>
														<li class="list-group-item px-0">
															<div class="row align-items-center">
																<div class="col-auto">
																	<!-- Avatar -->
																	<a class="avatar rounded-circle"> <img
																		alt="Image placeholder"
																		src="${pageContext.request.contextPath}/assets/img/theme/bootstrap.jpg">
																	</a>
																</div>
																<div class="col">
																	<h5>Bootstrap</h5>
																	<div class="progress progress-xs mb-0">
																		<div class="progress-bar bg-indigo bootstrapBar" role="progressbar"
																			aria-valuenow="60" aria-valuemin="0"
																			aria-valuemax="100"></div>
																	</div>
																</div>
															</div>
														</li>
														<li class="list-group-item px-0">
															<div class="row align-items-center">
																<div class="col-auto">
																	<!-- Avatar -->
																	<a href="#" class="avatar rounded-circle"> <img
																		alt="Image placeholder"
																		src="${pageContext.request.contextPath}/assets/img/theme/react.jpg">
																	</a>
																</div>
																<div class="col">
																	<h5>React</h5>
																	<div class="progress progress-xs mb-0">
																		<div class="progress-bar bg-teal reactBar" role="progressbar"
																			aria-valuenow="90" aria-valuemin="0"
																			aria-valuemax="100" ></div>
																	</div>
																</div>
															</div>
														</li>
														<li class="list-group-item px-0">
															<div class="row align-items-center">
																<div class="col-auto">
																	<!-- Avatar -->
																	<a href="#" class="avatar rounded-circle"> <img
																		alt="Image placeholder"
																		src="${pageContext.request.contextPath}/assets/img/theme/vue.jpg">
																	</a>
																</div>
																<div class="col">
																	<h5>Vue</h5>
																	<div class="progress progress-xs mb-0">
																		<div class="progress-bar bg-green vuebar" role="progressbar"
																			aria-valuenow="100" aria-valuemin="0"
																			aria-valuemax="100" ></div>
																	</div>
																</div>
															</div>
														</li>
													</ul>
													<div class="modal fade" id="technologiesModal" tabindex="-1"
														role="dialog" aria-labelledby="exampleModalLabel"
														aria-hidden="true">
														<div class="modal-dialog modal-dialog-centered"
															role="document">
															<div class="modal-content modal-position-center"
																style="width: 400px; height: 600px;">
																<div class="modal-header"
																	style="width: 400px; height: 25px; margin-bottom: 15px;">
																	<h5 class="text-dark modal-title"
																		id="exampleModalLabel">TECHNOLOGIES</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body bg-gradient-indigo"
																	style="width: 400px; height: 600px;">
																	<div class="card">
																		<div class="card-body">
																				<div class="form-group">
																					<label class="col-form-label form-control-label">보유 기술 등록</label> <label style="color: tomato">*</label>
																					<p class="text-muted" style="font-size: small">해당
																						기술의 숙련도을 입력해주세요</p>
																					<!-- Slider -->
																					<div class="row"
																						style="display: flex; justify-content: center; align-items: center;">
																						<h5 class="mb-0 bg-gradient-neutral">Angular</h5>
																					</div>
																					<div class="input-slider-container">
																						<div id="Angular-slider" class="input-slider"
																							data-range-value-min="0"
																							data-range-value-max="100"></div>
																						<div class="row mt-3">
																							<div class="col-6">
																								<span id="Angular-slider-value"
																									class="range-slider-value Angular"
																									data-range-value-low="0"></span>
																							</div>
																						</div>
																					</div>
																					<!-- Slider -->
																					<div class="row"
																						style="display: flex; justify-content: center; align-items: center;">
																						<h5 class="mb-0">Bootstrap</h5>
																					</div>
																					<div class="input-slider-container">
																						<div id="Bootstrap-slider" class="input-slider"
																							data-range-value-min="0"
																							data-range-value-max="100"></div>
																						<div class="row mt-3">
																							<div class="col-6">
																								<span id="Bootstrap-slider-value"
																									class="range-slider-value useability"
																									data-range-value-low="0"></span>
																							</div>
																						</div>
																					</div>
																					<!-- Slider -->
																							<!-- Slider -->
																					<div class="row"
																						style="display: flex; justify-content: center; align-items: center;">
																						<h5 class="mb-0">React</h5>
																					</div>
																					<div class="input-slider-container">
																						<div id="React-slider" class="input-slider"
																							data-range-value-min="0"
																							data-range-value-max="100"></div>
																						<div class="row mt-3">
																							<div class="col-6">
																								<span id="React-slider-value"
																									class="range-slider-value React"
																									data-range-value-low="0"></span>
																							</div>
																						</div>
																					</div>
																					<div class="row"
																						style="display: flex; justify-content: center; align-items: center;">
																						<h5 class="mb-0">Vue</h5>
																					</div>
																					<div class="input-slider-container">
																						<div id="Vue-slider" class="input-slider"
																							data-range-value-min="0"
																							data-range-value-max="100"></div>
																						<div class="row mt-3">
																							<div class="col-6">
																								<span id="Vue-slider-value"
																									class="range-slider-value"
																									data-range-value-low="0"></span>
																							</div>
																						</div>
																					</div>
																				</div>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn modalInsert"
																				id="modalButton" data-dismiss="modal">등 록</button>
																			<button type="button"
																				class="btn btn-link text-danger ml-auto closeModal"
																				data-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div
														style="display: flex; justify-content: flex-end; align-items: flex-end; margin: 10px 10px 10px 10px;">
														<button
															class="btn btn-icon btn-outline-primary technologiesUpdateBtn"
															type="button" style="margin: 15px 0px 0px 0px;" data-toggle="modal" onclick="modalClick(this);" >
															<span class="btn-inner--icon"><i class="fas fa-user-plus"></i></span> <span class="btn-inner--text">보유기술 등록</span>
														</button>
													</div>
												</div>
											</div>
										</div>
										<div class="card">
											<div class="card-header" id="faqHeading1-4"
												data-toggle="collapse" data-target="#faqcollapse1-4"
												aria-expanded="false" aria-controls="faqcollapse1-3">
												<h5 class="mb-0">이력 사항</h5>
											</div>
											<div id="faqcollapse1-4" class="collapse"
												aria-labelledby="faqHeading1-4" data-parent="#faq1">
												<div class="card-body">
												<!-- 작업 중! -->
													<div class="row career-table">
														<div class="col">
																<div class="table-responsive">
																	<table
																		class="table align-items-center table-danger table-flush">
																		<thead class="thead-light">
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
													<div
														style="display: flex; justify-content: flex-end; align-items: flex-end; margin: 10px 10px 10px 10px;">
														<button
															class="btn btn-icon btn-outline-primary carrerBtn"
															type="button" style="margin: 15px 0px 0px 0px;"
															data-toggle="modal" onclick="careerModalClick();">
															<span class="btn-inner--icon"><i class="fas fa-address-book"></i></span> <span class="btn-inner--text">이력사항 등록</span>
														</button>
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
		</div>
	</div>
</div>





		<!-- 작업중 -->
		<!-- MODAL -->
<div class="row">
  <div class="col-md-4">
    <div class="modal fade" id="modal-carrer-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
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
                        <!-- 작업 중 -->
                    <button type="button" class="btn btn-outline-primary btn-sm btn-career-insert">등록</button>
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
	src="${pageContext.request.contextPath}/assets/vendor/chart.js/dist/Chart.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/chart.js/dist/Chart.extension.js"></script>
   <script src="${pageContext.request.contextPath}/assets/vendor/nouislider/distribute/nouislider.min.js"></script>	
	
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.flash.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.print.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-select/js/dataTables.select.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	
	
	
<!-- Argon JS -->
<script
	src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.3.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

<script>
	//마이페이지 자기소개 글
	let mypage_aboutme = "${mypageMemberInfo.mypage_aboutme}";
	if(mypage_aboutme != ""){
		$('textarea[name=mypage_aboutme]').val("${mypageMemberInfo.mypage_aboutme}");
	}
		

			// 보유 기술 값 표현.
		let mypage_techexperience_ipt = ${mypage_techexperience};
		$('.angularBar').css('width', mypage_techexperience_ipt[0]+'%');
		$('.bootstrapBar').css('width', mypage_techexperience_ipt[1]+'%');
		$('.reactBar').css('width', mypage_techexperience_ipt[2]+'%');
		$('.vuebar').css('width', mypage_techexperience_ipt[3]+'%');
	
	
	var myChart = new Chart(document.getElementById("chartjs-3"), {
		"type" : "radar",
		"data" : {
			"labels" : [ "전문성", "의사소통", "긍정", "만족도", "협동심" ],
			"datasets" : [
					{
						"label" : "현재 점수",
						"data" : [ '${memberRate.professional}',
								'${memberRate.communication}',
								'${memberRate.positiveness}',
								'${memberRate.satisfaction}',
								'${memberRate.compliance}' ],
						"fill" : true,
						"backgroundColor" : "rgba(255, 99, 132, 0.2)",
						"borderColor" : "rgb(255, 99, 132)",
						"pointBackgroundColor" : "rgb(255, 99, 132)",
						"pointBorderColor" : "#fff",
						"pointHoverBackgroundColor" : "#fff",
						"pointHoverBorderColor" : "rgb(255, 99, 132)"
					},
					{
						"label" : "이전 점수",
						"data" : [ '${memberRate.professional_bef}',
								'${memberRate.communication_bef}',
								'${memberRate.positiveness_bef}',
								'${memberRate.satisfaction_bef}',
								'${memberRate.compliance_bef}' ],
						"fill" : true,
						"backgroundColor" : "rgba(54, 162, 235, 0.2)",
						"borderColor" : "rgb(54, 162, 235)",
						"pointBackgroundColor" : "rgb(54, 162, 235)",
						"pointBorderColor" : "#fff",
						"pointHoverBackgroundColor" : "#fff",
						"pointHoverBorderColor" : "rgb(54, 162, 235)"
					} ]
		},
		"options" : {
			"elements" : {
				"line" : {
					"tension" : 0,
					"borderWidth" : 3
				}
			},
		}
	});
	if("${projectChartInfo.Bootstrap}" == "0" && "${projectChartInfo.Vue}" == "0"
		&& "${projectChartInfo.Angular}" == "0" && "${projectChartInfo.React}" == "0"){
		const pieChart = new Chart(document.getElementById("pieChart"), {
			type : 'pie',
			data : {
				labels : [ '등록한 프로젝트가 없습니다.'

				],
				datasets : [ {
					data : [ "1"],
					backgroundColor : [Charts.colors.theme['info']],
					label : 'Dataset 2'
				} ],
			},
			options : {
				responsive : true,
				legend : {
					position : 'top',
				},
				animation : {
					animateScale : true,
					animateRotate : true
				}
			}
		});
	}else {
		const pieChart = new Chart(document.getElementById("pieChart"), {
			type : 'pie',
			data : {
				labels : [ 'Angular', 'Bootstrap', 'React', 'Vue'

				],
				datasets : [ {
					data : [ "${projectChartInfo.Angular}", "${projectChartInfo.Bootstrap}", "${projectChartInfo.React}", "${projectChartInfo.Vue}",

					],
					backgroundColor : [ Charts.colors.theme['danger'],
							Charts.colors.theme['warning'],
							Charts.colors.theme['success'],
							Charts.colors.theme['info'], ],
					label : 'Dataset 2'
				} ],
			},
			options : {
				responsive : true,
				legend : {
					position : 'top',
				},
				animation : {
					animateScale : true,
					animateRotate : true
				}
			}
		});
	}
	


	/* 업로드 스크립트 */
	$(function() {
		function maskImgs() {
			//$('.img-wrapper img').imagesLoaded({}, function() {
			$.each($('.img-wrapper img'), function(index, img) {
				var src = $(img).attr('src');
				var parent = $(img).parent();
				parent.css('background',
						'url(' + src + ') no-repeat center center').css(
						'background-size', 'cover');
				$(img).remove();
			});
			//});
		}

		var preview = {
			init : function() {
				preview.setPreviewImg();
				preview.listenInput();
			},
			setPreviewImg : function(fileInput) {
				var path = $(fileInput).val();
				var uploadText = $(fileInput).siblings('.file-upload-text');

				if (!path) {
					$(uploadText).val('');
				} else {
					path = path.replace(/^C:\\fakepath\\/, "");
					$(uploadText).val(path);

					preview.showPreview(fileInput, path, uploadText);
				}
			},
			showPreview : function(fileInput, path, uploadText) {
				var file = $(fileInput)[0].files;

				if (file && file[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {
						var previewImg = $(fileInput).parents(
								'.file-upload-wrapper').siblings('.preview');
						var img = $(previewImg).find('img');

						if (img.length == 0) {
							$(previewImg)
									.html(
											'<img src="' + e.target.result + '" alt=""/>');
						} else {
							img.attr('src', e.target.result);
						}

						uploadText.val(path);
						maskImgs();
					}

					reader.onloadstart = function() {
						$(uploadText).val('uploading..');
					}

					reader.readAsDataURL(file[0]);
				}
			},
			listenInput : function() {
				$('.file-upload-native').on('change', function() {
					preview.setPreviewImg(this);
				});
			}
		};
		preview.init();


		
		
		$('.inserPortfolio').on('click',function(){
			//기술을 등록하지 않으면 기술 입력하라고 말함.
			
			if(${empty memberAttribute.technologiesNum }){
				Swal.fire(
						  'Warning',
						  '포트폴리오 등록은 전문 기술을 등록하셔야 이용하실 수 있습니다.',
						  'warning'
						)
						return;
			}
			location.href ="${pageContext.request.contextPath}/user/portfolio/portfolioForm.do";
		});  
		
		$('#modalButton').on('click',function(){
			// 작업 중
			// 보유 기술 등록
			
			const angular_slider_value = $('#Angular-slider-value').text();
			const bootstrap_slider_value =$('#Bootstrap-slider-value').text();
			const react_slider_value = $('#React-slider-value').text();
			const vue_slider_value = $('#Vue-slider-value').text();
			
			// 디비에 넣을 소수점 삭제
			const angular_slider = Math.floor(angular_slider_value);
			const bootstrap_slider =Math.floor(bootstrap_slider_value);
			const react_slider =Math.floor(react_slider_value);
			const vue_slider = Math.floor(vue_slider_value);
			
			const CheckNum = angular_slider+bootstrap_slider+react_slider+vue_slider;
			if(CheckNum == 0){
				Swal.fire(
						  'Warning',
						  '최소한 하나의 보유 기술을 등록하셔야 합니다.',
						  'warning'
						)
						return;
			}
			
			// ajax로 성공시 입력한 값 확인할수 있게!
			$.ajax({
				url : "${pageContext.request.contextPath}/user/mypage/technologiesUpdate.do",
				type : "POST",
				data : {mem_id : "${MEMBER_LOGININFO.mem_id }", angular : angular_slider,
						bootstrap : bootstrap_slider , react : react_slider,  vue : vue_slider
						},
				dataType : "json",
				error : function(error){
					alert("에러");
				},
				success : function(result){
					console.log(result);
					console.log(mypage_techexperience_ipt);
					
					 mypage_techexperience_ipt = result.stringList;
					 console.log(result.integer);
					 $('.technologiesNum').text(result.integer);
					 
					$('.angularBar').css('width', mypage_techexperience_ipt[0]+'%');
					$('.bootstrapBar').css('width', mypage_techexperience_ipt[1]+'%');
					$('.reactBar').css('width', mypage_techexperience_ipt[2]+'%');
					$('.vuebar').css('width', mypage_techexperience_ipt[3]+'%');
				}
			})
		});
		
		
		
	}); // end jquery

	function modalClick(){
		// ajax 할 필요 없이 이미 View에 넘겨주기 때문에 전역변수로 설정했으니 그값만 변동해주면 수정해도 값이 보인다.
		const techexperience_1 = mypage_techexperience_ipt[0];
		const techexperience_2 = mypage_techexperience_ipt[1];
		const techexperience_3 = mypage_techexperience_ipt[2];
		const techexperience_4 = mypage_techexperience_ipt[3];
		
		// angular
        if (techexperience_1 == '100') {
     	   $('#Angular-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(1, 1)');
        } else {
     	   $('#Angular-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.' + techexperience_1 + ', 1)');

        }
        $('#Angular-slider .noUi-origin').css('transform', 'translate(-' + (100 - techexperience_1) + '%, 0px)');
        $('#Angular-slider .noUi-origin').css('z-index', '4');
      // bootstrap
        if (techexperience_2 == '100') {
     	   $('#Bootstrap-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(1, 1)');
        } else {
     	   $('#Bootstrap-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.' + techexperience_2 + ', 1)');

        }
        $('#Bootstrap-slider .noUi-origin').css('transform', 'translate(-' + (100 - techexperience_2) + '%, 0px)');
        $('#Bootstrap-slider .noUi-origin').css('z-index', '4');
     // react
        if (techexperience_3 == '100') {
     	   $('#React-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(1, 1)');
        } else {
     	   $('#React-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.' + techexperience_3 + ', 1)');

        }
        $('#React-slider .noUi-origin').css('transform', 'translate(-' + (100 - techexperience_3) + '%, 0px)');
        $('#React-slider .noUi-origin').css('z-index', '4');
     	// vue
        if (techexperience_4 == '100') {
     	   $('#Vue-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(1, 1)');
        } else {
     	   $('#Vue-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.' + techexperience_4 + ', 1)');

        }
        $('#Vue-slider .noUi-origin').css('transform', 'translate(-' + (100 - techexperience_4) + '%, 0px)');
        $('#Vue-slider .noUi-origin').css('z-index', '4');
     	//
     	
        $('#Angular-slider-value').text(techexperience_1+'.00');
      	$('#Bootstrap-slider-value').text(techexperience_2+'.00');
      	$('#React-slider-value').text(techexperience_3+'.00');
      	$('#Vue-slider-value').text(techexperience_4+'.00');
   
		
		$('#technologiesModal').modal('show');
	}
	
	
	
	
 	 function goPortfolioView(e) {
 		  const portfolio_no = $(e).find('input[name=portfolio_no]').val();
 		  const mem_id = $(e).find('input[name=mem_id]').val();
		
 		 location.href="${pageContext.request.contextPath}/user/portfolio/portfolioView.do?portfolio_no="+ portfolio_no +"&mem_id=" +mem_id;
 	  }
	
 	 <!-- 작업 중 -->
 	 function careerModalClick(){
 	    $('#modal-carrer-form .companyname').val('');
 	    $('#modal-carrer-form .department').val('');
 	    $('#modal-carrer-form .class').val('');
 	    $('#modal-carrer-form .startdate').val('');
 	    $('#modal-carrer-form .enddate').val('');
 	    $('#modal-carrer-form').modal('show');
 	 }
 	 
		// 이력 사항 등록 
		$('.btn-career-insert').on('click',function(){
	 	   const career_companyname = $('#modal-carrer-form .companyname').val();
	 	   const career_department = $('#modal-carrer-form .department').val();
	 	   const career_class = $('#modal-carrer-form .class').val();
	 	   const career_startdate = $('#modal-carrer-form .startdate').val();
	 	   const career_enddate = $('#modal-carrer-form .enddate').val();
	 	   
	 	   
	 	    $.ajax({
	 		    type: 'POST',
	 	  		url: '${pageContext.request.contextPath}/user/career/insertCareer.do',
	 	  		dataType: 'json',
	 	  		data: {
	 	  			mypage_no: '${mypageMemberInfo.mypage_no}',
	 	  			career_companyname: career_companyname,
	 	  			career_department: career_department,
	 	  			career_class: career_class,
	 	  			career_startdate: career_startdate,
	 	  			career_enddate : career_enddate
	 	  		},
	 	  		async: false,
	 	  		success: function(data) {
	 	  			if (data.result == 'Y') {
	 	  				loadCareer();
	 	  			} else {
	 					Swal.fire(
	 					  'DANGER',
	 					  '이력을 등록하는 과정에서 오류가 발생했습니다.',
	 					  'danger'
	 					)
	 	  			}
	 	  		},
	 	  		error: function (xhr, err) {
	 			        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
	 			        alert("responseText: " + xhr.responseText);
	 			    }
	 		  });

	 	    $('#modal-insert-form').modal('hide');
		});
 	 
		  // 이력서 내용 삭제
		  $(document).on('click', '.career-table tbody .trashcan-icon-area', function () {
			const career_seq = $(this).closest('tr').find('input[name=career_seq]').val();
			
			$.ajax({
			    type: 'POST',
		  		url: '${pageContext.request.contextPath}/user/career/deleteCareer.do',
		  		dataType: 'json',
		  		data: {
		  			career_seq: career_seq
		  		},
		  		async: false,
		  		success: function(data) {
		  			if (data.result == 'Y') {
		  				loadCareer();
		  			} else {
						Swal.fire(
						  'DANGER',
						  '이력을 삭제하는 과정에서 오류가 발생했습니다.',
						  'danger'
						)
		  			}
		  		},
		  		error: function (xhr, err) {
				        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
				        alert("responseText: " + xhr.responseText);
				    }
			  });
		  });	
		
		
		  loadCareer();
		  function loadCareer() {
			  $.ajax({
			    type: 'POST',
		  		url: '${pageContext.request.contextPath}/user/mypage/selectCareer.do',
		  		dataType: 'json',
		  		data: {
		  			mem_id: '${MEMBER_LOGININFO.mem_id }'
		  		},
		  		//async: false,
		  		success: function(data) {
		  			console.log(data);
		  			$('.career-table tbody').empty();
		  			let tableNO = 1;
		  			<!-- 작업 중-->
		  			$.each(data.CarrerList, function(index, item) {
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
		  	            
		  			    $('.career-table tbody').append(trHTML);
		  			    tableNO++;
		  			});
		  		},
		  		error: function (xhr, err) {
				        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
				        alert("responseText: " + xhr.responseText);
				    }
			  });
		  }
		  
		
 	 
</script>

