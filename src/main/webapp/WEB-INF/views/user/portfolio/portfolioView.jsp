<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css/animate.min.css">
<!-- Argon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">

<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<style>
    .modal-position-center {
        transform: translate(0px, 0px) !important;
    }


.pie-chartTest {
	position: relative;
	width: 90px;
	height: 90px;
	border-radius: 50%;
	transition: 0.3s;
}

.centerTest {
	background:
		url('https://assets.awwwards.com/awards/media/cache/optimize/sites_of_the_day/2020/08/thanks-site.jpg');
	display: block;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 80px;
	height: 80px;
	border-radius: 50%;
	text-align: center;
	line-height: 40px;
	/*font-size:10px;*/
	color: bisque;
	transform: translate(-50%, -50%);
}

.pie-chartTestReview {
	position: relative;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	transition: 0.3s;
}

.centerTestReview {
	background:
		url('https://assets.awwwards.com/awards/media/cache/optimize/sites_of_the_day/2020/08/thanks-site.jpg');
	display: block;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	text-align: center;
	line-height: 40px;
	font-size:10px;
	color: bisque;
	transform: translate(-50%, -50%);
}

.perpectCenter {
	display: flex;
	justify-content: center;
	align-items: center;
}

.green-fill {
	border-color: #49c5b6;
	color: #fff;
	background-color: #49c5b6;
	font-weight: 500;
	border-radius: 20%;
	margin: 10px 10px 10px 10px;
}

	#image-image-Form .avatar-wrapper{
		position: relative;
		height: 200px;
		width: 200px;
		margin: 50px auto;
		border-radius: 50%;
		overflow: hidden;
		box-shadow: 1px 1px 15px -5px black;
		transition: all .3s ease;
	}
	#image-image-Form .avatar-wrapper:hover{
		transform: scale(1.05);
		cursor: pointer;
	}
	#image-image-Form .avatar-wrapper:hover .profile-pic{
		opacity: .5;
	}
	#image-image-Form .profile-pic {
	    height: 100%;
		width: 100%;
		transition: all .3s ease;
	}
	#image-image-Form .profile-pic:after{
		font-family: "Font Awesome 5 Free";
		content: "\f007";
		top: 0; left: 0;
		width: 100%;
		height: 100%;
		position: absolute;
		font-size: 120px;
		background: #ecf0f1;
		color: #34495e;
		text-align: center;
		cursor: pointer;
	}
	#image-image-Form .upload-button {
		position: absolute;
		top: 0; left: 0;
		height: 100%;
		width: 100%;
	}
	#image-image-Form .upload-button .fa-arrow-circle-up{
		position: absolute;
		font-size: 234px;
		top: -17px;
		left: -17px;
		text-align: center;
		opacity: 0;
		transition: all .3s ease;
		color: #34495e;
	}
	#image-image-Form .upload-button:hover .fa-arrow-circle-up{
		opacity: .9;
	}
	

</style>
</head>
<body>

	<div class="viewPage">
		<div class="row"> 
			<div class="col-md-12">
				<!-- Image-작업 중 --> 
			<!--  	<div class="card mainDiv"
					style="background-image: url('/${portfolioInfo.PORTFOLIO_THUMBNAILIMG}'); height: 600px;"> -->
				<div class="card mainDiv"
					style="background-image: url('/${portfolio_imgs[0]}'); height: 600px;">
					<div class="row">
						<div class="col-md-12">
							<div class="icon-actions"
								style="display: flex; justify-content: flex-end; margin: 10px 40px 10px 10px;">
								<a href='javascript:void(0);' onclick="portfolioLike();"> <i
									class="far fa-heart fa-4x" id="like-icon" style="color: tomato"></i>
									<span class="text-muted text-xl text-pink" id="like-Text">${portfolioInfo.PORTFOLIO_LIKE }</span>
	
									<!--   <i class="fas fa-heart fa-4x" style="color: tomato"></i>-->
								</a>
	
							</div>
						</div>
					</div>
	
					<div style="margin: 100px 0px 0px 0px;">
						<div class="perpectCenter">
							<span class="h1 font-weight-bold text-white"
								style="font-size: 30px;">${portfolioInfo.PORTFOLIO_NAME }</span>
						</div>
						<div class="perpectCenter">
							<span class="h1 font-weight-light text-cyan"> by
								${portfolioInfo.MEM_ID } FROM TotalScore ${chartInfo.TOTALAVG}</span>
						</div>
					</div>
					<div
						style="display: flex; justify-content: center; align-items: center; margin: 0px 0px 0px 0px;">
						<div>
							<div class="pie-chartTest pie-chart1" style="margin: 15px;">
								<span class="centerTest">
									<div style="margin: 16px 0px 0px 0px;">
										<span class="h1 text-white designSpan"></span><small
											class="text-white designSmall"></small>
	
									</div>
								</span>
							</div>
							<div style="display: flex; justify-content: center;">
								<h3 class="text-white">DESIGN</h3>
							</div>
						</div>
	
						<div>
							<div class="pie-chartTest pie-chart2" style="margin: 15px;">
								<span class="centerTest">
									<div style="margin: 16px 0px 0px 0px;">
										<span class="h1 text-white useabilitySpan"></span> <small
											class="text-white useabilitySmall"></small>
									</div>
								</span>
							</div>
							<div style="display: flex; justify-content: center;">
								<h3 class="text-white">USEABILITY</h3>
							</div>
						</div>
	
						<div>
							<div class="pie-chartTest pie-chart3" style="margin: 15px;">
								<span class="centerTest">
									<div style="margin: 16px 0px 0px 0px;">
										<span class="h1 text-white creativitySpan"></span> <small
											class="text-white creativitySmall"></small>
									</div>
								</span>
							</div>
							<div style="display: flex; justify-content: center;">
								<h3 class="text-white">CREATIVITY</h3>
							</div>
						</div>
	
						<div>
							<div class="pie-chartTest pie-chart4" style="margin: 15px;">
								<span class="centerTest">
									<div style="margin: 16px 0px 0px 0px;">
										<span class="h1 text-white contentSpan"></span> <small
											class="text-white contentSmall"></small>
									</div>
								</span>
							</div>
							<div style="display: flex; justify-content: center;">
								<h3 class="text-white">CONTENT</h3>
							</div>
						</div>
	
						<div>
							<div class="pie-chartTest pie-chart5" style="margin: 15px;">
								<span class="centerTest">
									<div style="margin: 16px 0px 0px 0px;">
										<span class="h1 text-white developSpan"></span> <small
											class="text-white developSmall"></small>
									</div>
								</span>
							</div>
							<div style="display: flex; justify-content: center;">
								<h3 class="text-white">DEVELOP</h3>
							</div>
						</div>
					</div>
					<div
						style="display: flex; align-items: flex-end; width: 100%; height: 100%;">
						<div style="margin: 0px 0px 20px 20px;">
							<a target="_ blank" href='${portfolioInfo.PORTFOLIO_URL}'>
								<button type="button" class="btn btn-outline-success"
									style="border-radius: 25px; color: white;">Visit Site</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	


	<div class="row">
		<div class="col-md-8">
			<div class="card" style="height: 600px;">
				<!-- title -->
				<div class="card-header">
					<div>
						<h1 class="mb-0">제목 : ${portfolioInfo.PORTFOLIO_NAME }</h1>
					</div>

					<div>
						<div class="progress-wrapper">
							<div class="progress-info">
								<div class="progress-label">
									<span class="badge-lg badge-default">참여율</span>
								</div>
								<div class="progress-percentage">
									<span>${portfolioInfo.PORTFOLIO_PARTICIPATIONRATE }%</span>
								</div>
							</div>
							<div class="progress">
								<div class="progress-bar bg-gradient-danger" role="progressbar"
									aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
									style="width: ${portfolioInfo.PORTFOLIO_PARTICIPATIONRATE}%;"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="card-body">
					<div class="row-cols-md-6" style="margin: 0px 0px 10px 0px;">
						<!-- 사용 기술에 따른 이미지 표현 -->
						<c:if test="${portfolioInfo.PORTFOLIO_TECHNOLOGIES == 1 }">
							<span class="mb-0" style="font-weight: bolder;"> <img
								alt="Image placeholder"
								src="${pageContext.request.contextPath}/assets/img/theme/angular.jpg"
								style="width: 48px; height: 48px;">angular
							</span>
						</c:if>

						<c:if test="${portfolioInfo.PORTFOLIO_TECHNOLOGIES == 2 }">
							<span class="mb-0" style="font-weight: bolder;"> <img
								alt="Image placeholder"
								src="${pageContext.request.contextPath}/assets/img/theme/bootstrap.jpg"
								style="width: 48px; height: 48px;">bootstrap
							</span>
						</c:if>
						<c:if test="${portfolioInfo.PORTFOLIO_TECHNOLOGIES == 3 }">
							<span class="mb-0" style="font-weight: bolder;"> <img
								alt="Image placeholder"
								src="${pageContext.request.contextPath}/assets/img/theme/react.jpg"
								style="width: 48px; height: 48px;">react
							</span>
						</c:if>
						<c:if test="${portfolioInfo.PORTFOLIO_TECHNOLOGIES == 4 }">
							<span class="mb-0" style="font-weight: bolder;"> <img
								alt="Image placeholder"
								src="${pageContext.request.contextPath}/assets/img/theme/vue.jpg"
								style="width: 48px; height: 48px;">vue
							</span>
						</c:if>

					</div>
					<div class="row">
						<div class="col">
							<div class="form-group">
								<h3 style="font-size: 1.2em;">포트 폴리오 소개</h3>
								<span>${portfolioInfo.PORTFOLIO_DESCRIPTION}</span>
							</div>
						</div>
					</div>

				
				</div>
				<div class="card-footer">
					<div class="row" style="display: flex; justify-content: space-between;">
						<div>
							<h3 style="font-size: 1.2em;">시작 날짜</h3>
							<i class="far fa-clock"></i><span>${portfolioInfo.PORTFOLIO_STARTDATE }
							</span>
						</div>
						<div>
							<h3 style="font-size: 1.2em;">마감 날짜</h3>
							<i class="far fa-clock"></i><span>${portfolioInfo.PORTFOLIO_ENDDATE }
							</span>
						</div>
						<div>
							<h3 style="font-size: 1.2em;">등록 날짜</h3>
							<i class="far fa-clock"></i><label>${portfolioInfo.PORTFOLIO_REGDATE }
							</label>
						</div>
					</div>
						<div class="row"
							style="display: flex; justify-content: flex-end; margin: 10px 0px 0px 0px;">
							<c:if test="${portfolioInfo.MEM_ID == MEMBER_LOGININFO.mem_id  }">
								<button class="btn btn-icon btn-success updateBtn" type="button">
									<span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
									<span class="btn-inner--text">수정</span>
								</button>
								<button class="btn btn-icon btn-danger deleteBtn" type="button">
									<span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
									<span class="btn-inner--text">삭제</span>
								</button>
							</c:if>
								<button class="btn btn-icon btn-primary portListBtn" type="button">
									<span class="btn-inner--icon"><i class="fas fa-list"></i></span>
									<span class="btn-inner--text">목록</span>
								</button>
						</div>
					
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card card-profile" style="height: 600px;">
				<img
					src="${pageContext.request.contextPath}/assets/img/theme/img-1-1000x600.jpg"
					alt="Image placeholder" class="card-img-top">
				<div class="row justify-content-center">
					<div class="col-lg-3 order-lg-2">
						<div class="card-profile-image">
							<a href="#"> <img src="/${portfolioInfo.PROFILE_SAVENAME}"
								class="rounded-circle">
							</a>
						</div>
					</div>
				</div>
				<div
					class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
					<div class="d-flex justify-content-between">
						<a href="${pageContext.request.contextPath}/user/projectsupport/sms1.do" class="btn btn-sm btn-info  mr-4 ">Contact</a> <a
							href="#" class="btn btn-sm btn-default float-right">Message</a>
					</div>
				</div>
				<div class="card-body pt-0">
					<div class="row">
						<div class="col">
							<div class="card-profile-stats d-flex justify-content-center">
								<div>
									<span class="heading">${projectAndportfolioNum.PROJECTNUM }</span>
									<span class="description">Project</span>
								</div>
								<div>
									<span class="heading">${projectAndportfolioNum.PORTFOLINUM }</span>
									<span class="description">Portfolio</span>
								</div>
								<div>
									<span class="heading">미정</span> <span class="description">Career</span>
								</div>
							</div>
						</div>
					</div>
					<div class="text-center">
						<h5 class="h3">
							${portfolioInfo.MEM_ID }<span class="font-weight-light">,
								${portfolioInfo.MEM_AGE }</span>
						</h5>
						<div class="h5 font-weight-300">
							<i class="ni location_pin mr-2"></i> <span
								class="badge badge-pill badge-warning">Developer</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--사진 이미지들 주자 -->
	<c:forEach var="portfolioInfo" items="${portfolio_imgs }">
		<div class="card">
			<div class="row">
				<div class="col-md-12">
					<img class="img-center img-fluid" src="/${portfolioInfo }" alt="">
				</div>
			</div>
		</div>
	</c:forEach>

<!--  댓글 작업 -->

		<div class="row">
            <div class="col-md-12">
                <div class="accordion" id="accordionExample">
                    <div class="card">
                        <div class="card-header bg-gradient-info" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            <h2 class="mb-0 text-white">PortfolioReview List</h2>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <div class="card">
                                <!-- Card header -->
                                <div class="border-0" style="display: flex; justify-content: flex-end; align-items: center; height: 50px; margin-right: 20px;">
                                    <div style="height: auto;">
                                    <!-- 작업중 -->
                                    	<c:if test="${!empty MEMBER_LOGININFO.mem_id }">
	                                    	<a class="btn btn-sm btn-neutral btn-round btn-icon" data-original-title="리뷰를 작성해 주세요"
	                                         data-toggle="modal" onclick="modalClick(this);" >
	                                            <span class="btn-inner--icon modal-insert-icon"><i class="fas fa-user-edit insert"></i></span>
	                                            <span class="btn-inner--text">Review 등록</span>
	                                        </a>
                                    	</c:if>
                                    	
                                    	<c:if test="${empty MEMBER_LOGININFO.mem_id }">
	                                    	<a  class="btn btn-sm btn-neutral btn-round" data-original-title="리뷰는 로그인 이후 작성이 가능합니다.">
	                                            <span class="btn-inner--icon"><i class="fas fa-user-plus"></i></span>
	                                            <span class="btn-inner--text">리뷰는 로그인 이후 가능</span>
	                                        </a>
                                    	</c:if>
                                    </div>
                                    
                                    <!-- 모달 -->
									<div class="modal fade" id="ReviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content modal-position-center" style="width: 400px; height: 800px;">
												<div class="modal-header" style="width: 400px; height: 25px; margin-bottom: 15px;">
													<h5 class="text-dark modal-title" id="exampleModalLabel">Review</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body bg-gradient-info" style="width: 400px; height: 500px;">
													<div class="card">
														<div class="card-body">
															<form method="post" name="reviewForm" id="reviewForm">
															<div class="row" style="margin-bottom: 20px;">
															<!-- 작업중 -->
																<input type="hidden" name="portfolio_writer" value="${MEMBER_LOGININFO.mem_id }">
																<input type="hidden" name="portfolio_no" value="${portfolioInfo.PORTFOLIO_NO }">
																<input type="text" class="form-control border-primary"
																	id="example2cols1Input" placeholder="한줄코멘트를 입력해주세요." name="portfolio_content" required>
															</div>
															<div class="form-group">
																<label class="col-form-label form-control-label">포트폴리오
																	평점</label> <label style="color: tomato">*</label>
																<p class="text-muted" style="font-size: small">해당 포트폴리오의
																	평점을 입력해주세요</p>
																	<!-- Slider -->
																<div class="row" style="display: flex; justify-content: center; align-items: center;">
																<h5 class="mb-0 bg-gradient-neutral">디자인</h5>
																</div>
															<div class="input-slider-container">
																<div id="design-slider" class="input-slider"
																	data-range-value-min="0" data-range-value-max="100"></div>
																<div class="row mt-3">
																	<div class="col-6">
																		<span id="design-slider-value"
																			class="range-slider-value design" data-range-value-low="50"></span>
																	</div>
																</div>
															</div>
															<!-- Slider -->
															<div class="row"
																style="display: flex; justify-content: center; align-items: center;">
																<h5 class="mb-0">사용성</h5>
															</div>
															<div class="input-slider-container">
																<div id="useability-slider" class="input-slider"
																	data-range-value-min="0" data-range-value-max="100"></div>
																<div class="row mt-3">
																	<div class="col-6">
																		<span id="useability-slider-value"
																			class="range-slider-value useability" data-range-value-low="50"></span>
																	</div>
																</div>
															</div>
															<!-- Slider -->
															<div class="row"
																style="display: flex; justify-content: center; align-items: center;">
																<h5 class="mb-0">창의성</h5>
															</div>
															<div class="input-slider-container">
																<div id="creativity-slider" class="input-slider"
																	data-range-value-min="0" data-range-value-max="100"></div>
																<div class="row mt-3">
																	<div class="col-6">
																		<span id="creativity-slider-value"
																			class="range-slider-value creativity" data-range-value-low="50"></span>
																	</div>
																</div>
															</div>
															<!-- Slider -->
															<div class="row"
																style="display: flex; justify-content: center; align-items: center;">
																<h5 class="mb-0">컨텐츠</h5>
															</div>
															<div class="input-slider-container">
																<div id="contentscore-slider" class="input-slider"
																	data-range-value-min="0" data-range-value-max="100"></div>
																<div class="row mt-3">
																	<div class="col-6">
																		<span id="contentscore-slider-value"
																			class="range-slider-value" data-range-value-low="50"></span>
																	</div>
																</div>
															</div>
															<!-- Slider -->
															<div class="row"
																style="display: flex; justify-content: center; align-items: center;">
																<h5 class="mb-0">완성도</h5>
															</div>
															<div class="input-slider-container">
																<div id="develop-slider" class="input-slider"
																	data-range-value-min="0" data-range-value-max="100"></div>
																<div class="row mt-3">
																	<div class="col-6">
																		<span id="develop-slider-value"
																			class="range-slider-value" data-range-value-low="50"></span>
																	</div>
																</div>
															</div>
															</div>
															</form>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn modalInsert" id="modalButton" data-dismiss="modal">Insert</button>
															<button type="button"
																class="btn btn-link text-danger ml-auto closeModal"
																data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>

											</div>
										</div>
									</div>

								</div>
                                <!-- Light table -->
                                <div class="table-responsive py-4">
                                    <table class="table align-items-center table-flush datatable-basic">
                                        <thead class="thead-light">
                                        <tr>
                                            <th>작 성 자</th>
                                            <th>리뷰 댓글</th>
                                            <th>점 수</th>
                                            <th>작성날짜</th>
                                        </tr>
                                        </thead>
                                        <!-- 작 업 중 -->
                                        <tbody class="reviewTbody">
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
	
	
	<div class="updateDiv">
		   <div class="row">
            <div class="col-md-12">
                <!-- Image-Text card -->
                <div class="card mainDiv" style="height: 600px;">
                    <div class="row">
                        <div class="col-md-12">
                        	<img class="img-center img-fluid testtesttesttest" alt="" src="/${portfolioInfo.PORTFOLIO_THUMBNAILIMG }" style="width: 1620px; height: 610px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<form action="${pageContext.request.contextPath }/user/portfolio/updateportfolio.do" name="portFolioForm" method="POST" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-8">
				<div class="card">
					<!-- title -->
					<div class="card-header">
						<h2 class="mb-0">포트폴리오 기본 정보 등록</h2>
						<small class="text-muted">(*)표시가 있는 항목은 필수 항목입니다.</small>
						<input type="hidden" name="mem_id" value="${MEMBER_LOGININFO.mem_id }">
						<input type="hidden" name="portfolio_no" value="${portfolioInfo.PORTFOLIO_NO }">
					</div>
					<div class="card-body">
						<div class="form-group">
							<label class="col-form-label form-control-label">포트폴리오 제목</label>
							<label style="color: tomato">*</label>
							<p class="text-muted" style="font-size: small">포트폴리오 제목을 30자
								이내로 적어주세요.</p>
							<div class="">
								<input class="form-control" type="search" name="portfolio_name"
									placeholder="ex) PortFolio Title" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-form-label form-control-label">사용 기술 정보</label>
							<label style="color: tomato">*</label>
							<p class="text-muted" style="font-size: small">포트폴리오에 사용한 기술을
								선택해 주세요</p>
							<div>
								<img
									src="${pageContext.request.contextPath}/assets/img/theme/angular.jpg"
									style="width: 48px; height: 48px;">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="portfolio_technologies1"
										name="portfolio_technologies_ipt" class="custom-control-input"
										value="1"> <label
										class="custom-control-label" for="portfolio_technologies1">angular</label>
								</div>
								<img
									src="${pageContext.request.contextPath}/assets/img/theme/bootstrap.jpg"
									style="width: 48px; height: 48px;">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="portfolio_technologies2"
										name="portfolio_technologies_ipt" class="custom-control-input"
										value="2"> <label class="custom-control-label"
										for="portfolio_technologies2">bootstrap</label>
								</div>
								<img
									src="${pageContext.request.contextPath}/assets/img/theme/react.jpg"
									style="width: 48px; height: 48px;">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="portfolio_technologies3"
										name="portfolio_technologies_ipt" class="custom-control-input"
										value="3"> <label class="custom-control-label"
										for="portfolio_technologies3">react</label>
								</div>
								<img
									src="${pageContext.request.contextPath}/assets/img/theme/vue.jpg"
									style="width: 48px; height: 48px;">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="portfolio_technologies4"
										name="portfolio_technologies_ipt" class="custom-control-input"
										value="4"> <label class="custom-control-label"
										for="portfolio_technologies4">vue</label>

								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="progress-wrapper">
								<div class="progress-info">
									<div class="progress-label">
										<span class="badge-lg badge-default">참여율</span>
									</div>
								</div>
								<div class="input-slider-container">
								<!--  작업2 -->
									<div id="input-slider" class="input-slider"
										data-range-value-min="0" data-range-value-max="100"></div>
									<div class="row mt-3">
										<div class="col-6">
											<span id="input-slider-value" class="range-slider-value portfolio_participationrate"
												data-range-value-low="0"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-form-label form-control-label">포트폴리오 작업
								일자</label> <label style="color: tomato">*</label>
							<p class="text-muted" style="font-size: small">포트폴리오 시작 일과 마감
								일을 선택해 주세요.</p>
							<div class="row input-daterange datepicker align-items-center">
								<div class="col">
									<div class="form-group">
										<label class="form-control-label">시작 날짜</label> <input
											class="form-control" placeholder="Start date" type="text"
											 name="portfolio_startdate" required>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label class="form-control-label">마감 날짜</label> <input
											class="form-control" placeholder="End date" type="text"
											 name="portfolio_enddate" required>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-form-label form-control-label">URL 링크</label> <label
								style="color: tomato">*</label>
							<p class="text-muted" style="font-size: small">포트폴리오에 등록된
								URL링크를 작성해주세요.</p>
							<div class="input-group mb-4">
								<div class="input-group-prepend">	
									<button class="btn btn-primary" type="button"
										id="button-addon1">Url</button>
								</div>
								<input type="text" class="form-control"
									placeholder="http://Url.link"
									aria-label="Example text with button addon"
									aria-describedby="button-addon1" name="portfolio_url"  required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-form-label form-control-label">포트 폴리오
								설명</label> <label style="color: tomato">*</label>
							<p class="text-muted" style="font-size: small">간단한 포트폴리오에 대한
								설명을 작성해주세요.</p>
						</div>
						<div id="editor" style="height: 250px;"
							name="portfolio_description"></div>

						<div class="form-group"
							style="display: flex; justify-content: flex-end; margin: 10px 0px 0px 0px;">
							<button class="btn btn-icon btn-primary updateBtnFinish" type="button">
								<span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
								<span class="btn-inner--text">수정완료</span>
							</button>
							<button class="btn btn-icon btn-primary listBtn" type="button">
								<span class="btn-inner--icon"><i class="fas fa-list"></i></span>
								<span class="btn-inner--text">취소</span>
							</button>
						</div>

					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="row">
					<div class="col-md-12">
						<div class="card" style="height: 435px;">
							<div class="card-header">
								<h2 class="mb-0">1. 썸네일 포트폴리오 사진 등록</h2>
								<label class="col-form-label form-control-label">썸네일
									포트폴리오 등록</label> <label style="color: tomato">*</label>
								<p class="text-muted" style="font-size: small">썸네일 포트폴리오는 반드시
									첫번째로 등록해주세요</p>
							</div>
							
							<div id="image-image-Form">
								<div class="avatar-wrapper">
									<img class="profile-pic main-profile" src="/${portfolioInfo.PORTFOLIO_THUMBNAILIMG }" />
									<div class="upload-button main-profile-upload-button">
										<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
									</div>
									<input class="file-upload file-upload-input1" type="file" accept="image/*" id="firstfiles" name="files"/>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card" style="height: 435px;">
							<div class="card-header">
								<h2 class="mb-0">2. 포트폴리오 사진 등록</h2>
								<label class="col-form-label form-control-label">포트폴리오
									등록</label>
								<p class="text-muted" style="font-size: small">포트폴리오를 등록해주세요</p>
							</div>
							<div id="image-image-Form">
								<div class="avatar-wrapper">
									<img class="profile-pic sub-profile1" src="/${portfolio_imgs[0]}" />
									<div class="upload-button sub-profile-upload-button1">
										<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
									</div>
									<input class="file-upload file-upload-input2" type="file" accept="image/*" name="files"/>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card" style="height: 435px;">
							<div class="card-header">
								<h2 class="mb-0">3. 포트폴리오 사진 등록</h2>
								<label class="col-form-label form-control-label">포트폴리오
									등록</label>
								<p class="text-muted" style="font-size: small">포트폴리오를 등록해주세요</p>
							</div>
							<div id="image-image-Form">
								<div class="avatar-wrapper">
									<img class="profile-pic sub-profile2" src="/${portfolio_imgs[1]}"/>
									<div class="upload-button sub-profile-upload-button2">
										<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
									</div>
									<input class="file-upload file-upload-input3" type="file" accept="image/*" name="files"/>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</form>
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
   
      <!-- 디비 -->   
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.flash.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-buttons/js/buttons.print.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/datatables.net-select/js/dataTables.select.min.js"></script>
  
  <script src="${pageContext.request.contextPath}/assets/test/quill.js"></script>
   <script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/vendor/moment.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datetimepicker.js"></script>
   <script src="${pageContext.request.contextPath}/assets/vendor/nouislider/distribute/nouislider.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

	<!-- Argon JS -->
	<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
	<!-- Demo JS - remove this in your project -->
	<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>	
		
		
		
	<script type="text/javascript">
		$(function() {
			$('#datetimepicker1').datetimepicker({
				icons : {
					time : "fa fa-clock",
					date : "fa fa-calendar-day",
					up : "fa fa-chevron-up",
					down : "fa fa-chevron-down",
					previous : 'fa fa-chevron-left',
					next : 'fa fa-chevron-right',
					today : 'fa fa-screenshot',
					clear : 'fa fa-trash',
					close : 'fa fa-remove'
				}
			});
		});
	</script>



	<script>
	
	let designScore;
	let useabilityScore;
	let creativityScore;
	let contentScore;
	let developScore;
	
	let var_portfolio_seq = '';
	
		$(function() {
			$('.updateDiv').hide();
			
			
			const quill = new Quill('#editor', {
				theme: 'snow'
			});
			
			reviewList();
			
			
			<!--메인 portfolio 부분 점수 -->
			if (${empty chartInfo}) {
				designScore = '00';
				useabilityScore = '00';
				creativityScore = '00';
				contentScore = '00';
				developScore = '00';

			} else {
				designScore = '${chartInfo.PORTFOLIO_DESIGN}';
				useabilityScore = '${chartInfo.PORTFOLIO_USEABILITY}';
				creativityScore = '${chartInfo.PORTFOLIO_CREATIVITY}';
				contentScore = '${chartInfo.PORTFOLIO_CONTENTSCORE}';
				developScore = '${chartInfo.PORTFOLIO_DEVELOP}';
			}

			$(window).ready(function() {

				if (${empty chartInfo}) {
					designScore = '00';
					useabilityScore = '00';
					creativityScore = '00';
					contentScore = '00';
					developScore = '00';

				} else {
					designScore = '${chartInfo.PORTFOLIO_DESIGN}';
					useabilityScore = '${chartInfo.PORTFOLIO_USEABILITY}';
					creativityScore = '${chartInfo.PORTFOLIO_CREATIVITY}';
					contentScore = '${chartInfo.PORTFOLIO_CONTENTSCORE}';
					developScore = '${chartInfo.PORTFOLIO_DEVELOP}';
				}

				
				
				draw(designScore, '.pie-chart1', '#11cdef');
				draw(useabilityScore, '.pie-chart2', '#fb6340');
				draw(creativityScore, '.pie-chart3', '#f5365c');
				draw(contentScore, '.pie-chart4', '#2dce89');
				draw(developScore, '.pie-chart5', '#770b93');

			});

			function draw(max, classname, colorname) {
				var i = 1;
				var func1 = setInterval(function() {
					if (i < max) {
						color1(i, classname, colorname);
						i++;
					} else {
						clearInterval(func1);
					}
				}, 10);
			}
			function color1(i, classname, colorname) {
				$(classname).css(
						{
							"background" : "conic-gradient(" + colorname
									+ " 0% " + i + "%, #ffffff " + i
									+ "% 100%)"
						});
			}
			// 만약 댓글이 없을경우 0점 처리 해줘야 한다.

			const designSpan = designScore.charAt(0) + '.';
			const designSmall = designScore.charAt(1);

			const useabilitySpan = useabilityScore.charAt(0) + '.';
			const useabilitySmall = useabilityScore.charAt(1);

			const creativitySpan = creativityScore.charAt(0) + '.';
			const creativitySmall = creativityScore.charAt(1);

			const contentSpan = contentScore.charAt(0) + '.';
			const contentSmall = contentScore.charAt(0);

			const developSpan = developScore.charAt(0) + '.';
			const developSmall = developScore.charAt(1);	

			$('.designSpan').text(designSpan);
			$('.designSmall').text(designSmall);
			$('.useabilitySpan').text(useabilitySpan);
			$('.useabilitySmall').text(useabilitySmall);
			$('.creativitySpan').text(creativitySpan);
			$('.creativitySmall').text(creativitySmall);
			$('.contentSpan').text(contentSpan);
			$('.contentSmall').text(contentSmall);
			$('.developSpan').text(developSpan);
			$('.developSmall').text(developSmall);

		
			
			$('.updateBtn').on('click',function(){
				//const portflio_no = '${portfolioInfo.PORTFOLIO_NO}';
				//location.href ='${pageContext.request.contextPath}/user/portfolio/updateportfolioForm.do?portflio_no=' + portflio_no;
				$('.viewPage').hide();
				$('.updateDiv').show();
				
				
			   let portfolio_participationrateRate =(Math.floor(${portfolioInfo.PORTFOLIO_PARTICIPATIONRATE}));
				
               let portfolio_participationrate = $('.portfolio_participationrate').text(portfolio_participationrateRate + '.0');
               
               if ('${portfolioInfo.PORTFOLIO_PARTICIPATIONRATE}'== '100') {
            	   $('.noUi-connect').css('transform', 'translate(0%, 0px) scale(' + portfolio_participationrateRate + ', 1)');
               } else {
            	   $('.noUi-connect').css('transform', 'translate(0%, 0px) scale(0.' + portfolio_participationrateRate + ', 1)');

               }
               
               $('.noUi-origin').css('transform', 'translate(-' + (100 - ${portfolioInfo.PORTFOLIO_PARTICIPATIONRATE}) + '%, 0px)');
               $('.noUi-origin').css('z-index', '4');
               
				quill.clipboard.dangerouslyPasteHTML('${portfolioInfo.PORTFOLIO_DESCRIPTION}');
				
				//포트폴리오 이름
				$('input[name="portfolio_name"]').val('${portfolioInfo.PORTFOLIO_NAME}');
				const portfolio_name = $('input[name="portfolio_name"]').val();
				
				// 포트폴리오 시작일
				$('input[name="portfolio_startdate"]').val('${portfolioInfo.PORTFOLIO_STARTDATE}');
				const portfolio_startdate=$('input[name="portfolio_startdate"]').val();
				
				//포트폴리오 마감일
				$('input[name="portfolio_enddate"]').val('${portfolioInfo.PORTFOLIO_ENDDATE}');
				const portfolio_enddate=$('input[name="portfolio_enddate"]').val();
				
				//참여율 값
				const input_slider_value_ipt = $('.portfolio_participationrate').text();
				
				
				
				if(${portfolioInfo.PORTFOLIO_TECHNOLOGIES == 1 }){
					$("input:radio[id='portfolio_technologies1']").prop("checked", true);
				}if(${portfolioInfo.PORTFOLIO_TECHNOLOGIES == 2 }){
					$("input:radio[id='portfolio_technologies2']").prop("checked", true);	
				}if(${portfolioInfo.PORTFOLIO_TECHNOLOGIES == 3 }){
					$("input:radio[id='portfolio_technologies3']").prop("checked", true);
				}if(${portfolioInfo.PORTFOLIO_TECHNOLOGIES == 4 }){
					$("input:radio[id='portfolio_technologies4']").prop("checked", true);
				}
				
				
				// 사용한 기술 채크 값
				const portfolio_technologies_ipt = $('input[name="portfolio_technologies_ipt"]:checked').val();
				
				//url 링크
				$('input[name="portfolio_url"]').val('${portfolioInfo.PORTFOLIO_URL}');
				const portfolio_url_ipt = $('input[name="portfolio_url"]').val();
				
				
			});
			
			$('.updateBtnFinish').on('click',function(){
				
				const portfolio_name = $('input[name="portfolio_name"]').val();
				const portfolio_startdate=$('input[name="portfolio_startdate"]').val();
				const portfolio_enddate=$('input[name="portfolio_enddate"]').val();
				const input_slider_value_ipt = $('.portfolio_participationrate').text();
				const portfolio_technologies_ipt = $('input[name="portfolio_technologies_ipt"]:checked').val();
				const portfolio_url_ipt = $('input[name="portfolio_url"]').val();
				const portfolio_description_ipt = quill.root.innerHTML;
				
				
				if (portfolio_name == "") {
					$.notify({
						// options
						message: '제목을 입력해주세요!' 
					},{
						// settings
						placement: {
							from: "top",
							align: "center"
						},
						type: 'info'
					});
					
					return;
				}
				//  시작 및 마감 날짜!
				if (portfolio_startdate == "" || portfolio_enddate == "" ) {
					$.notify({
						// options
						message: '시작날짜 및 마감날짜를 입력해주세요!' 
					},{
						// settings
						placement: {
							from: "top",
							align: "center"
						},
						type: 'info'
					});
					
					return;
				}
				
				
				if(portfolio_url_ipt == ""){
					$.notify({
						// options
						message: '포트폴리오 URL을 입력해주세요!' 
					},{
						// settings
						placement: {
							from: "top",
							align: "center"
						},
						type: 'info'
					});
					
					return;
				}
				
				// 내용을 입력하지 않았을 때!
				const text = quill.getText();
				
				if (text.length == 1) {
					$.notify({
						// options
						message: '내용을 입력해주세요!' 
					},{
						// settings
						placement: {
							from: "top",
							align: "center"
						},
						type: 'info'
					});
					
					return;
				}
				
				

				<!-- 작업 중 -->
				const mainImage =  "${portfolioInfo.PORTFOLIO_THUMBNAILIMG }";
				const sub_profile1 = "${portfolio_imgs[0]}";
				const sub_profile2 = "${portfolio_imgs[1]}";
				
				// 포트폴리오 내용
				const $portfolio_description = '<input type="hidden" name="portfolio_description" value="' +portfolio_description_ipt +'">';
				// 포트폴리오 참여율
				const $portfolio_participationrate1 =  '<input type="hidden" name="portfolio_participationrate" value="' + input_slider_value_ipt + '">';
				// 포트폴리오 사용한 기술 체크 값
				const $portfolio_technologies = '<input type="hidden" name="portfolio_technologies" value="' + portfolio_technologies_ipt + '">';
				
				const $portfolio_main = '<input type="hidden" name="mainImage" value="' + mainImage + '">';
				const $portfolio_sub1 = '<input type="hidden" name="sub_profile1" value="' + sub_profile1 + '">';
				const $portfolio_sub2 = '<input type="hidden" name="sub_profile2" value="' + sub_profile2 + '">';
				
				
 				$('form[name=portFolioForm]').append($portfolio_description);
 				$('form[name=portFolioForm]').append($portfolio_participationrate1);
 				$('form[name=portFolioForm]').append($portfolio_technologies);
 				
 				$('form[name=portFolioForm]').append($portfolio_main);
 				$('form[name=portFolioForm]').append($portfolio_sub1);
 				$('form[name=portFolioForm]').append($portfolio_sub2);
				
 				
 				
 				$('form[name=portFolioForm]').submit();
				
			});

			//뷰 페이지 처음 나오는 목록 버튼 
			$('.portListBtn').on('click',function(){
				location.href='${pageContext.request.contextPath}/user/portfolio/portfolioList.do';
			});
			
			<!-- 수정버튼 누르고 나오는 페이지의 목록 버튼-->
			$('.listBtn').on('click',function(){
				$('.updateDiv').hide();
				$('.testtesttesttest').hide();
				$('.viewPage').show();
			});
			
			<!-- 삭제-->
			$('.deleteBtn').on('click', function(){
				const mem_id = '${MEMBER_LOGININFO.mem_id}';
				const portfolio_no = '${portfolioInfo.PORTFOLIO_NO}';
				
				Swal.fire({
					  title: '정말 삭제하시겠습니까?',
					  text: "삭제를 클릭하면 되돌릴 수 없습니다.",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '삭제',
					  cancelButtonText: '취소'
					}).then((result) => {
					  if (result.value) { 
			     		location.href='${pageContext.request.contextPath}/user/portfolio/deleteportfolio.do?mem_id=' +mem_id +'&portfolio_no=' + portfolio_no;	
					  } 
					});
			});
			
		});


		function portfolioLike() {

			// 		if (${empty MEMBER_LOGININFO}) {
			// 			Swal.fire(
			// 			  'Warning',
			// 			  '좋아요 하트는 로그인 후 클릭할 수 있습니다.',
			// 			  'warning'
			// 			)

			// 			return;
			// 		}

			const portfolio_no = '${portfolioInfo.PORTFOLIO_NO}';
			
			$.ajax({
						type : 'POST',
						url : '${pageContext.request.contextPath}/user/portfolio/portfolioLike.do',
						dataType : 'json',
						data : {
							portfolio_no : portfolio_no
						},
						success : function(result) {

							$('#like-icon').attr('class', 'fas fa-heart fa-4x');
							const likeNum = ${portfolioInfo.PORTFOLIO_LIKE}+1;
							$('#like-Text').text(likeNum);

						},
						error : function(xhr, status, error) {
							alert(error);
						}
					});
				}
		
		// 파일 처리
		
			$(document).ready(
				function() {

					var readURL = function(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();

							reader.onload = function(e) {

								$('#image-image-Form .main-profile').attr('src',e.target.result);
								$('.testtesttesttest').show();
								$('.testtesttesttest').attr('src',e.target.result);
							}

							reader.readAsDataURL(input.files[0]);
						}
					}
					
					var readURL2 = function(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();

							reader.onload = function(e) {

								$('#image-image-Form .sub-profile1').attr('src',e.target.result);
								$('.testtesttesttest').attr('src',e.target.result);
							}

							reader.readAsDataURL(input.files[0]);
						}
					}
					
					var readURL3 = function(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();

							reader.onload = function(e) {

								$('#image-image-Form .sub-profile2').attr('src',e.target.result);
								$('.testtesttesttest').attr('src',e.target.result);
							}

							reader.readAsDataURL(input.files[0]);
						}
					}

					
					
					$(".file-upload-input1").on('change', function() {
						readURL(this);
					});
					
					$(".file-upload-input2").on('change', function() {
						readURL2(this);
					});
					
					$(".file-upload-input3").on('change', function() {
						readURL3(this);
					});
					

					// 메인 사진 등록 버튼 이벤트
					$(".main-profile-upload-button").on('click', function() {
						$(".file-upload-input1").click();
					});
					// 서브사진 등록 1
					$(".sub-profile-upload-button1").on('click', function() {
						$(".file-upload-input2").click();
					});
					// 서즈 사진 등록 2
					$(".sub-profile-upload-button2").on('click', function() {
						$(".file-upload-input3").click();
					});
				});
		
		
		/////리뷰 ////////
		function modalClick(info){
			const currentSelectedButton = $(info).attr('data-original-title');
			
			if (currentSelectedButton.indexOf('작성') != -1) {
				const slider_reset = "50";
				$('input[name="portfolio_content"]').val("");
				 
	            $('#design-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.5 , 1)');
	            $('#design-slider .noUi-origin').css('transform', 'translate(-' + (100 - slider_reset) + '%, 0px)');
	            $('#design-slider .noUi-origin').css('z-index', '4');
	            $('#design-slider-value').text(slider_reset + ".00");
	            
	            $('#useability-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.5 , 1)');
	            $('#useability-slider .noUi-origin').css('transform', 'translate(-' + (100 - slider_reset) + '%, 0px)');
	            $('#useability-slider .noUi-origin').css('z-index', '4');
	            $('#useability-slider-value').text(slider_reset + ".00");
	            
	            $('#creativity-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.5 , 1)');
	            $('#creativity-slider .noUi-origin').css('transform', 'translate(-' + (100 - slider_reset) + '%, 0px)');
	            $('#creativity-slider .noUi-origin').css('z-index', '4');
	            $('#creativity-slider-value').text(slider_reset + ".00");
	            
	            $('#contentscore-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.5 , 1)');
	            $('#contentscore-slider .noUi-origin').css('transform', 'translate(-' + (100 - slider_reset) + '%, 0px)');
	            $('#contentscore-slider .noUi-origin').css('z-index', '4');
	            $('#contentscore-slider-value').text(slider_reset + ".00");
	            
	            $('#develop-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.5 , 1)');
	            $('#develop-slider .noUi-origin').css('transform', 'translate(-' + (100 - slider_reset) + '%, 0px)');
	            $('#develop-slider .noUi-origin').css('z-index', '4');
	            $('#develop-slider-value').text(slider_reset + ".00");
	            
	            $('#modalButton').text('insert');
	            $('#modalButton').attr('class','btn modalInsert');
	            
			} else if (currentSelectedButton.indexOf('수정') != -1) {
				$('#modalButton').attr('class','btn btn-default updateModalBtn');
				$('#modalButton').text('Update');
				buttonName ="update";
				const portfolio_seq =$(info).find('input').val();
				var_portfolio_seq = portfolio_seq;
					$.ajax({
						url: '${pageContext.request.contextPath}/user/portfolio/portfolioReviewInfo.do',
						Type : 'POST',
						data : { portfolio_seq : portfolio_seq},
						dataType : 'json',
						error: function(xhr, status, error){
			                alert(error);
			            },
			            <!-- 작 업 중 --> 
			            success : function(result){
			            	console.log(result);
			            	const portfolio_seq= result.reviewInfo.PORTFOLIO_SEQ;
			            	const portfolio_no=result.reviewInfo.PORTFOLIO_NO;
			            	const portfolio_writer=result.reviewInfo.PORTFOLIO_WRITER;
			            	const portfolio_design=result.reviewInfo.PORTFOLIO_DESIGN;
			            	const portfolio_useability=result.reviewInfo.PORTFOLIO_USEABILITY;
			            	const portfolio_creativity=result.reviewInfo.PORTFOLIO_CREATIVITY;
			            	const portfolio_contentscore=result.reviewInfo.PORTFOLIO_CONTENTSCORE;
			            	const portfolio_develop=result.reviewInfo.PORTFOLIO_DEVELOP;
			            	const portfolio_content=result.reviewInfo.PORTFOLIO_CONTENT;
			            	$('input[name=portfolio_content]').val(portfolio_content);
			            	$('#design-slider-value').text(portfolio_design+'.00');
			            	$('#useability-slider-value').text(portfolio_useability+'.00');
			            	$('#creativity-slider-value').text(portfolio_creativity+'.00');
			            	$('#contentscore-slider-value').text(portfolio_contentscore+'.00');
			            	$('#develop-slider-value').text(portfolio_develop+'.00');
			            	
			              //디자인
			               if (portfolio_design == '100') {
			            	   $('#design-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(1, 1)');
			               } else {
			            	   $('#design-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.' + portfolio_design + ', 1)');
	
			               }
			               $('#design-slider .noUi-origin').css('transform', 'translate(-' + (100 - portfolio_design) + '%, 0px)');
			               $('#design-slider .noUi-origin').css('z-index', '4');
			             // 사용성	
			               if (portfolio_useability == '100') {
			            	   $('#useability-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(1, 1)');
			               } else {
			            	   $('#useability-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.' + portfolio_useability + ', 1)');
	
			               }
			               $('#useability-slider .noUi-origin').css('transform', 'translate(-' + (100 - portfolio_useability) + '%, 0px)');
			               $('#useability-slider .noUi-origin').css('z-index', '4');
			            // 창의성
			               if (portfolio_creativity == '100') {
			            	   $('#creativity-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(1, 1)');
			               } else {
			            	   $('#creativity-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.' + portfolio_creativity + ', 1)');
	
			               }
			               $('#creativity-slider .noUi-origin').css('transform', 'translate(-' + (100 - portfolio_creativity) + '%, 0px)');
			               $('#creativity-slider .noUi-origin').css('z-index', '4');
			            	// 컨텐츠
			               if (portfolio_contentscore == '100') {
			            	   $('#contentscore-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(1, 1)');
			               } else {
			            	   $('#contentscore-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.' + portfolio_contentscore + ', 1)');
	
			               }
			               $('#contentscore-slider .noUi-origin').css('transform', 'translate(-' + (100 - portfolio_contentscore) + '%, 0px)');
			               $('#contentscore-slider .noUi-origin').css('z-index', '4');
			            	// 
			               if (portfolio_develop == '100') {
			            	   $('#develop-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(1, 1)');
			               } else {
			            	   $('#develop-slider .noUi-connect').css('transform', 'translate(0%, 0px) scale(0.' + portfolio_develop + ', 1)');
	
			               }
			               $('#develop-slider .noUi-origin').css('transform', 'translate(-' + (100 - portfolio_develop) + '%, 0px)');
			               $('#develop-slider .noUi-origin').css('z-index', '4');
			            }
					});
			}
			$('#ReviewModal').modal('show');
		}
		
		

		function reviewList(){
			const portfolio_no = '${portfolioInfo.PORTFOLIO_NO }';
			
			$.ajax({
				url :'${pageContext.request.contextPath}/user/portfolio/reviewList.do', 
				type : 'POST',
				dataType : 'json',
				data : {portfolio_no : portfolio_no},
				error: function(xhr, status, error){
	                alert(error);
	            },
	            <!-- 작 업 중 --> 
	            success : function(result){
	            	let str = "";
                	
                	const id_check = '${MEMBER_LOGININFO.mem_id}';
	            	// 차트 리스트 테이블 만드는 중
	            	$.each(result.reviewList, function(index, item){
	            		str += "<tr><td class='table-user'><img src='/"
	            		str += item.PROFILE_SAVENAME + "' class='avatar rounded-circle mr-3'> ";
	            		str += "<b>" + item.MEM_ID + "</b></td>";
	            		str += "<td><span class='text-muted'>" + item.PORTFOLIO_CONTENT +"</span></td>";
	            		str += "<td>" + 
	            		"<div style='display: flex; justify-content: center; align-items: center; margin: 0px 0px 0px 0px;'>"+
		                    "<div data-toggle='tooltip' data-placement='bottom' title='Tooltip on bottom'>"+
		                        "<div class='pie-chartTestReview review1" +index +"'style='margin: 15px;'>"+
		                            "<span class='centerTestReview'>"+
		                                "<div style='margin: 0px 0px 5px 0px;'>" +
		                                    "<span class='h3 text-white designReviewSpan" +index + "'></span>" +
		                                    "<small class='text-white designReviewSmall" +index +"'></small>" +
		                                "</div>"+
		                            "</span>"+
		                        "</div>"+
		                        "<div style='display: flex; justify-content: center;'>"+
		                            "<h6 class='text-info'>DESIGN</h6>" +
		                        "</div>"+
		                    "</div>"+
		                    "<div>"+
		                        "<div class='pie-chartTestReview review2" +index +"'style='margin: 15px;'>"+
		                            "<span class='centerTestReview'>"+
		                                "<div style='margin: 0px 0px 5px 0px;'>" +
		                                    "<span class='h3 text-white useabilityReviewSpan" +index +"'></span>"+
		                                    "<small class='text-white useabilityReviewSmall" +index +"'></small>" +
		                                "</div>" +
		                            "</span>" +
		                        "</div>" +
		                        "<div style='display: flex; justify-content: center;'>"+
		                            "<h6 class='text-warning'>USEABILITY</h6>" +
		                        "</div>" +
		                    "</div>" +
		                    "<div>" +
		                        "<div class='pie-chartTestReview review3"+ index +"' + style='margin: 15px;'>" +
		                            "<span class='centerTestReview'>" +
		                                "<div style='margin: 0px 0px 5px 0px;'>" +
		                                    "<span class='h3 text-white creativityReviewSpan" + index + "'></span>" +
		                                    "<small class='text-white creativityReviewSmall" +index + "'></small>" +
		                                "</div>" +
		                            "</span>" +
		                        "</div>" +
		                        "<div style='display: flex; justify-content: center;'>" +
		                            "<h6 class='text-danger'>CREATIVITY</h6>"+
		                        "</div>" +
		                    "</div>" +
		                    "<div>" +
		                        "<div class='pie-chartTestReview review4"+ index +"' style='margin: 15px;'>" +
		                            "<span class='centerTestReview'>" +
		                                "<div style='margin: 0px 0px 5px 0px;'>" +
		                                    "<span class='h3 text-white contentReviewSpan" +index + "'></span>" +
		                                    "<small class='text-white contentReviewSmall" +index + "'></small>" +
		                            "</div>"+
		                            "</span>"+
		                        "</div>"+
		                        "<div style='display: flex; justify-content: center;'>" +
		                            "<h6 class='text-success'>CONTENT</h6>" +
		                        "</div>" +
		                    "</div>" +
		                    "<div>" +
		                        "<div class='pie-chartTestReview review5" +index +  "'style='margin: 15px;'>" +
		                            "<span class='centerTestReview'>" +
		                                "<div style='margin: 0px 0px 5px 0px;'>" +
		                                    "<span class='h3 text-white developReviewSpan"+ index + "'></span>" +
		                                    "<small class='text-white developReviewSmall" + index + "'></small>" +
		                                "</div>" +
		                            "</span>"+
		                        "</div>" +
		                        "<div style='display: flex; justify-content: center;'>" +
		                            "<h6 class='text-indigo'>DEVELOP</h6>" +
		                        "</div>"+
		                    "</div>" +
		                "</div>"+ "</td>";
	            		str += "<td class='table-actions'><span>" + item.PORTFOLIO_REGDATE +"</span>&nbsp;&nbsp;&nbsp;";
	            		if(item.MEM_ID ==  id_check){
	            			str += "<a onclick='modalClick(this);' class='table-action reviewUpdate' data-toggle='tooltip' data-original-title='리뷰 수정'>";
	            			str += "<input name='portfolio_seq' value='" + item.PORTFOLIO_SEQ + "' type='hidden'>";
	            			str += "<i class='fas fa-user-edit update'></i></a>";
	            			str += "<a onclick='deleteReview(this);' class='table-action table-action-delete' data-toggle='tooltip' data-original-title='리뷰 삭제'>";
	            			str += "<input name='portfolio_seq' value='" + item.PORTFOLIO_SEQ + "' type='hidden'>";
	            			str += "<i class='fas fa-trash'></i></a>";
	            		}
	            		str += "</td></tr>";
	            	});
	            	
	            	// tbody 아래 값만 지우기
	            	$('.reviewTbody').empty();
	            	$('.reviewTbody').append(str);
	            	//$('.datatable-basic').append(str);
	            	// 차트 값 채워서 넣어주자.
	            	
	            		function drawReview(max, classname, colorname) {
	    					var i = 1;
	    					var func1 = setInterval(function() {
	    						if (i < max) {
	    							colorReview(i, classname, colorname);
	    							i++;
	    						} else {
	    							clearInterval(func1);
	    						}
	    					}, 10);
	    				}
	    				function colorReview(i, classname, colorname) {
	    					$(classname).css(
	    							{
	    								"background" : "conic-gradient(" + colorname
	    										+ " 0% " + i + "%, #ffffff " + i
	    										+ "% 100%)"
	    							});
	    				}
	    				
	            	//각 리뷰에 차트 넣어주기
	            	$.each(result.reviewList, function(index, item){
	            		let designReview = String(item.PORTFOLIO_DESIGN);
	            		let useabilityReview = String(item.PORTFOLIO_USEABILITY);
	            		let creativityReview = String(item.PORTFOLIO_CREATIVITY);
	            		let contentReview = String(item.PORTFOLIO_CONTENTSCORE);
	            		let developReview = String(item.PORTFOLIO_DEVELOP);
	            		
	            		let review1 = ".review1"+index;
	            		let review2 = ".review2"+index;
	            		let review3 = ".review3"+index;
	            		let review4 = ".review4"+index;
	            		let review5 = ".review5"+index;
	            		
	            		drawReview(designReview, review1, '#11cdef');
	            		drawReview(useabilityReview, review2, '#fb6340');
	            		drawReview(creativityReview, review3, '#f5365c');
	            		drawReview(contentReview, review4, '#2dce89');
	            		drawReview(developReview, review5, '#770b93');
	    				
	            		
	    				let designSpanReview = designReview.charAt(0) + '.';
	    				let designSmallReview = designReview.charAt(1);

	    				let useabilitySpanReview = useabilityReview.charAt(0) + '.';
	    				let useabilitySmallReview = useabilityReview.charAt(1);

	    				let creativitySpanReview = creativityReview.charAt(0) + '.';
	    				let creativitySmallReview = creativityReview.charAt(1);

	    				let contentSpanReview = contentReview.charAt(0) + '.';
	    				let contentSmallReview = contentReview.charAt(0);

	    				let developSpanReview = developReview.charAt(0) + '.';
	    				let developSmallReview = developReview.charAt(1);
	    				
	    				//차트에 넣을 클래스 이름 설정
	    				let designReviewSpanClass = ".designReviewSpan"+index;
	    				let designReviewSmallClass =".designReviewSmall"+index;
	    				
	    				let useabilityReviewSpanClass = ".useabilityReviewSpan"+index;
	    				let useabilityReviewSmallClass =".useabilityReviewSmall"+index;
	    				
	    				let creativityReviewSpanClass = ".creativityReviewSpan"+index;
	    				let creativityReviewSmallClass =".creativityReviewSmall"+index;

	    				let contentReviewSpanClass = ".contentReviewSpan"+index;
	    				let contentReviewSmallClass =".contentReviewSmall"+index;
	    				
	    				let developReviewSpanClass = ".developReviewSpan"+index;
	    				let developReviewSmallClass =".developReviewSmall"+index;
	    				
	    				

	    				$(designReviewSpanClass).text(designSpanReview);
	    				$(designReviewSmallClass).text(designSmallReview);
	    				
	    				$(useabilityReviewSpanClass).text(useabilitySpanReview);
	    				$(useabilityReviewSmallClass).text(useabilitySmallReview);
	    				
	    				$(creativityReviewSpanClass).text(creativitySpanReview);
	    				$(creativityReviewSmallClass).text(creativitySmallReview);
	    				
	    				$(contentReviewSpanClass).text(contentSpanReview);
	    				$(contentReviewSmallClass).text(contentSmallReview);
	    				
	    				$(developReviewSpanClass).text(developSpanReview);
	    				$(developReviewSmallClass).text(developSmallReview);
	                });
	            }
	        });
	    }
		
		
		function deleteReview(info){
			Swal.fire({
				  title: '정말 삭제하시겠습니까?',
				  text: "삭제를 클릭하면 되돌릴 수 없습니다.",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '삭제',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.value) { 
						const portfolio_seq =$(info).find('input').val();
						$.ajax({
							url : "${pageContext.request.contextPath}/user/portfolio/portfolioReviewDelete.do",
							type: 'POST',
							data : {portfolio_seq : portfolio_seq},
							dataType : 'json',
							error: function(xhr, status, error){
				                alert(error);
				            },
				            success : function(result){
				                Swal.fire(
				                        'success',
				                        '리뷰 삭제 완료.',
				                        'success'
				                      )
			            	reviewList();
			            }
					});
			 	 } 
			});
		}
		
		
		
		$('#modalButton').on('click', function() {
			let modalName = $('#modalButton').text();
			
			
			if(modalName == 'insert'){
					const portfolio_writer = $('input[name="portfolio_writer"]').val();
					const portfolio_no =$('input[name="portfolio_no"]').val();
					const portfolio_content = $('input[name="portfolio_content"]').val();
					const design_slider_value = $('#design-slider-value').text();
					const useability_slider_value =$('#useability-slider-value').text();
					const creativity_slider_value = $('#creativity-slider-value').text();
					const contentscore_slider_value = $('#contentscore-slider-value').text();				
					const develop_slider_value =$('#develop-slider-value').text();
					// 디비에 넣을 소수점 삭제
					const design_slider = Math.floor(design_slider_value);
					const useability_slider =Math.floor(useability_slider_value);
					const creativity_slider =Math.floor(creativity_slider_value);
					const contentscore_slider = Math.floor(contentscore_slider_value);
					const develop_slider = Math.floor(develop_slider_value);
					
					$.ajax({
						url :'${pageContext.request.contextPath}/user/portfolio/InsertPortfolioReview.do', 
						type : 'POST',
						dataType : 'json',
						data : {portfolio_writer : portfolio_writer, 
							portfolio_no : portfolio_no, portfolio_content : portfolio_content,
							portfolio_design : design_slider ,  portfolio_useability :useability_slider,
							portfolio_creativity : creativity_slider , portfolio_contentscore: contentscore_slider,
							portfolio_develop : develop_slider},
						error: function(xhr, status, error){
			                alert(error);
			            },
			            success : function(result){
			                Swal.fire(
			                        'success',
			                        '리뷰 등록 완료.',
			                        'success'
			                      )
			            	reviewList();
			            }
					}); 
			}else if(modalName == 'Update'){
				const portfolio_writer = $('input[name="portfolio_writer"]').val();
				const portfolio_no =$('input[name="portfolio_no"]').val();
				const portfolio_content = $('input[name="portfolio_content"]').val();
				const design_slider_value = $('#design-slider-value').text();
				const useability_slider_value =$('#useability-slider-value').text();
				const creativity_slider_value = $('#creativity-slider-value').text();
				const contentscore_slider_value = $('#contentscore-slider-value').text();				
				const develop_slider_value =$('#develop-slider-value').text();
				// 디비에 넣을 소수점 삭제
				const design_slider = Math.floor(design_slider_value);
				const useability_slider =Math.floor(useability_slider_value);
				const creativity_slider =Math.floor(creativity_slider_value);
				const contentscore_slider = Math.floor(contentscore_slider_value);
				const develop_slider = Math.floor(develop_slider_value);
				
				$.ajax({
					url :'${pageContext.request.contextPath}/user/portfolio/updatePortfolioReview.do', 
					type : 'POST',
					dataType : 'json',
					data : {portfolio_writer : portfolio_writer, portfolio_seq : var_portfolio_seq,
						portfolio_no : portfolio_no, portfolio_content : portfolio_content,
						portfolio_design : design_slider ,  portfolio_useability :useability_slider,
						portfolio_creativity : creativity_slider , portfolio_contentscore: contentscore_slider,
						portfolio_develop : develop_slider},
					error: function(xhr, status, error){
		                alert(error);
		            },
		            success : function(result){
		                Swal.fire(
		                        'success',
		                        '리뷰 수정 완료.',
		                        'success'
		                      )
		            	reviewList();
		            }
				}); 
			}
		});
		
		

	</script>
</body>
</html>