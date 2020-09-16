<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" type="image/png">
<!-- Fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/nucleo/css/nucleo.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	type="text/css">
<!-- Page plugins -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fullcalendar/dist/fullcalendar.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.css">
<!-- Argon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0"
	type="text/css">

<!--  my style -->
<style>
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
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<!-- Image-Text card -->
			<div class="card mainDiv" style="background-image: url('/${MainportfolioInfo.PORTFOLIO_THUMBNAILIMG}'); height: 600px;">
				<!-- Card image -->
				<!--              <img class="card-img-top" src="https://assets.awwwards.com/awards/media/cache/optimize/sites_of_the_day/2020/08/thanks-site.jpg" alt="Image placeholder" style="height: 500px;">-->
				<!-- Chart wrapper -->
				<div style="margin: 100px 0px 0px 0px;">
					<div style="display: flex; justify-content: center; align-items: center;">
						<span class="h1 font-weight-bold text-white"
							style="font-size: 30px;">${MainportfolioInfo.PORTFOLIO_NAME }</span>
					</div>
					<div style="display: flex; justify-content: center; align-items: center;">
						<span class="h3 font-weight-light text-cyan"> by ${MainportfolioInfo.MEM_ID } FROM TotalScore ${maxportfolioAvg.TOTALAVG}</span>
					</div>
				</div>
				<div style="display: flex; justify-content: center; align-items: center;">
					<div>
						<div class="pie-chartTest pie-chart1" style="margin: 15px;">
							<span class="centerTest">
								<div style="margin: 16px 0px 0px 0px;">
									<span class="h1 text-white designSpan"></span> <small class="text-white designSmall"></small>
									
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
									<span class="h1 text-white useabilitySpan"></span> <small class="text-white useabilitySmall"></small>
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
									<span class="h1 text-white creativitySpan"></span> <small class="text-white creativitySmall"></small>
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
									<span class="h1 text-white contentSpan"></span> <small class="text-white contentSmall"></small>
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
									<span class="h1 text-white developSpan"></span> <small class="text-white developSmall"></small>
								</div>
							</span>
						</div>
						<div style="display: flex; justify-content: center;">
							<h3 class="text-white">DEVELOP</h3>
						</div>
					</div>

				</div>
				<div style="display: flex; align-items: flex-end; width: 100%; height: 100%;">
					<div style="margin: 0px 0px 20px 20px;">
						<button type="button" class="btn btn-outline-success" style="border-radius: 25px; color: white;">Visit Site</button>
<!-- 						<a href="https://twks.ch/" data-identifier="twks" -->
<!-- 							class="bt-default green-fill" target="_blank" -->
<!-- 							rel="noopener nofollow">Visit Site</a> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="bg-secondary">
		<div style="display: flex; justify-content: space-between; margin: 10px 10px 20px 10px;">
			<div>
				<span class="h1 text-black">Category</span>
				<span class="h2 text-black-50" style="margin: 1px 0px 0px 10px;">angular</span>
			</div>
			<div>
				<button class="btn btn-icon btn-primary inserBtn" type="button">
					<span class="btn-inner--icon"><i class="ni ni-bag-17"></i></span>
				    <span class="btn-inner--text">포트폴리오 등록</span>
				</button>
			</div>
		</div>

		<div class="row">
			<!--여기서 for문 시작  -->
			<c:forEach items="${portfolioList }" var="portfolioList">
			<c:if test="${portfolioList.PORTFOLIO_TECHNOLOGIES == 1 }">
				<div class="col-md-4">
					<div class="card">
						<!-- Card image -->
						<div class="card-header img-hover-css" style="margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;" onclick="goPortfolioView(this);">
							<input type="hidden" name="portfolio_no" value="${portfolioList.PORTFOLIO_NO }">
							<input type="hidden" name="mem_id" value="${portfolioList.MEM_ID }">
							<img class="card-img-top img-center img-fluid"
								src="/${portfolioList.PORTFOLIO_THUMBNAILIMG }"
								alt="Image placeholder">
						</div>
						<!-- Card body -->
						<div class="card-body">
							<small class="text-muted">TITLE</small>
							<h5 class="h2 card-title mb-0">${portfolioList.PORTFOLIO_NAME }</h5>
							<small class="text-muted">${portfolioList.PORTFOLIO_REGDATE }</small>
						</div>
						<div class="card-footer"
							style="display: flex; justify-content: space-between; align-items: center;">
							<div style="display: flex;">
								<div>
									<img alt="Image placeholder"
										src="/${portfolioList.PROFILE_SAVENAME }"
										class="avatar rounded-circle">
								</div>
								<div style="margin: 0px 0px 0px 10px;">
									<h5 style="margin: 10px 0px 0px 0px;"
										class="text-lg text-lg-center">${portfolioList.MEM_ID }</h5>
								</div>
							</div>
							<div>
								<span class="badge badge-pill badge-success">angular</span>
							</div>
						</div>
					</div>
				</div>		
			</c:if>
			</c:forEach>
		</div>
	</div>


	<div class="bg-secondary">
		<div style="display: block; width: 100%; margin: 10px 10px 20px 10px;">
			<span class="h1 text-black">Category</span> 
			<span class="h2 text-black-50" style="margin: 1px 0px 0px 10px;">bootstrap</span>
		</div>

		<div class="row">
		<!--여기서 for문 시작  -->
		<c:forEach items="${portfolioList }" var="portfolioList">
		<c:if test="${portfolioList.PORTFOLIO_TECHNOLOGIES == 2 }">
			<div class="col-md-4">
				<!-- 작업중 -->
				<!-- Image-Text card -->
				<div class="card">
					<!-- Card image -->
					<div class="card-header img-hover-css" style="margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;" onclick="goPortfolioView(this);">
						<input type="hidden" name="portfolio_no" value="${portfolioList.PORTFOLIO_NO }">
						<input type="hidden" name="mem_id" value="${portfolioList.MEM_ID }">
						<img class="card-img-top img-center img-fluid"
							src="/${portfolioList.PORTFOLIO_THUMBNAILIMG }"
							alt="Image placeholder">
					</div>
					<!-- Card body -->
					<div class="card-body">
						<small class="text-muted">TITLE</small>
						<h5 class="h2 card-title mb-0">${portfolioList.PORTFOLIO_NAME }</h5>
						<small class="text-muted">${portfolioList.PORTFOLIO_REGDATE }</small>
					</div>
					<div class="card-footer"
						style="display: flex; justify-content: space-between; align-items: center;">
						<div style="display: flex;">
							<div>
								<img alt="Image placeholder"
									src="/${portfolioList.PROFILE_SAVENAME }"
									class="avatar rounded-circle">
							</div>
							<div style="margin: 0px 0px 0px 10px;">
								<h5 style="margin: 10px 0px 0px 0px;"
									class="text-lg text-lg-center">${portfolioList.MEM_ID }</h5>
							</div>
						</div>
						<div>
							<span class="badge badge-pill badge-info">bootstrap</span>
						</div>
					</div>
				</div>
			</div>		
		</c:if>

		</c:forEach>
		</div>
	</div>


	<div class="bg-secondary">
		<div style="display: block; width: 100%; margin: 10px 10px 20px 10px;">
			<span class="h1 text-black">Category</span>
			<span class="h2 text-black-50" style="margin: 1px 0px 0px 10px;">react</span>
		</div>

		<div class="row">
		<!--여기서 for문 시작  -->
		<c:forEach items="${portfolioList }" var="portfolioList">
		<c:if test="${portfolioList.PORTFOLIO_TECHNOLOGIES == 3 }">
			<div class="col-md-4">
				<div class="card">
					<!-- Card image -->
					<div class="card-header img-hover-css" style="margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;" onclick="goPortfolioView(this);">
						<input type="hidden" name="portfolio_no" value="${portfolioList.PORTFOLIO_NO }">
						<input type="hidden" name="mem_id" value="${portfolioList.MEM_ID }">
						<img class="card-img-top img-center img-fluid"
							src="/${portfolioList.PORTFOLIO_THUMBNAILIMG }"
							alt="Image placeholder">
					</div>
					<!-- Card body -->
					<div class="card-body">
						<small class="text-muted">TITLE</small>
						<h5 class="h2 card-title mb-0">${portfolioList.PORTFOLIO_NAME }</h5>
						<small class="text-muted">${portfolioList.PORTFOLIO_REGDATE }</small>
					</div>
					<div class="card-footer"
						style="display: flex; justify-content: space-between; align-items: center;">
						<div style="display: flex;">
							<div>
								<img alt="Image placeholder"
									src="/${portfolioList.PROFILE_SAVENAME }"
									class="avatar rounded-circle">
							</div>
							<div style="margin: 0px 0px 0px 10px;">
								<h5 style="margin: 10px 0px 0px 0px;"
									class="text-lg text-lg-center">${portfolioList.MEM_ID }</h5>
							</div>
						</div>
						<div>
							<span class="badge badge-pill badge-danger">react</span>
						</div>
					</div>
				</div>
			</div>		
		</c:if>

		</c:forEach>
		</div>
	</div>

	<div class="bg-secondary">
		<div style="display: block; width: 100%; margin: 10px 10px 20px 10px;">
			<span class="h1 text-black">Category</span>
			<span class="h2 text-black-50" style="margin: 1px 0px 0px 10px;">vue</span>
		</div>

		<div class="row">
		<!--여기서 for문 시작  -->
		<c:forEach items="${portfolioList }" var="portfolioList">
		<c:if test="${portfolioList.PORTFOLIO_TECHNOLOGIES == 4 }">
			<div class="col-md-4">
				<div class="card">
					<!-- Card image -->
					<div class="card-header img-hover-css" style="margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;" onclick="goPortfolioView(this);">
						<input type="hidden" name="portfolio_no" value="${portfolioList.PORTFOLIO_NO }">
						<input type="hidden" name="mem_id" value="${portfolioList.MEM_ID }">
						<img class="card-img-top img-center img-fluid"
							src="/${portfolioList.PORTFOLIO_THUMBNAILIMG }"
							alt="Image placeholder">
					</div>
					<!-- Card body -->
					<div class="card-body">
						<small class="text-muted">TITLE</small>
						<h5 class="h2 card-title mb-0">${portfolioList.PORTFOLIO_NAME }</h5>
						<small class="text-muted">${portfolioList.PORTFOLIO_REGDATE }</small>
					</div>
					<div class="card-footer"
						style="display: flex; justify-content: space-between; align-items: center;">
						<div style="display: flex;">
							<div>
								<img alt="Image placeholder"
									src="/${portfolioList.PROFILE_SAVENAME }"
									class="avatar rounded-circle">
							</div>
							<div style="margin: 0px 0px 0px 10px;">
								<h5 style="margin: 10px 0px 0px 0px;"
									class="text-lg text-lg-center">${portfolioList.MEM_ID }</h5>
							</div>
						</div>
						<div>
							<span class="badge badge-pill badge-primary">vue</span>
						</div>
					</div>
				</div>
			</div>		
		</c:if>

		</c:forEach>
		</div>
		
	</div>
  <script src="${pageContext.request.contextPath}/assets/vendor/jquery/dist/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/js-cookie/js.cookie.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
  <!-- Optional JS -->
  <script src="${pageContext.request.contextPath}/assets/vendor/moment/min/moment.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/fullcalendar/dist/fullcalendar.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/jvectormap-next/jquery-jvectormap.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/vendor/jvectormap/jquery-jvectormap-world-mill.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/chart.js/dist/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/chart.js/dist/Chart.extension.js"></script>
  
  <!-- Optional JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/moment.min.js"></script>
  
  <!-- Argon JS -->
  <script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
  <!-- Demo JS - remove this in your project -->
  <script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
  <script type="text/javascript">
  $(function (){

	    $(window).ready(function(){
	      draw('${mainScoreChart.PORTFOLIO_DESIGN}', '.pie-chart1', '#11cdef');
	      draw('${mainScoreChart.PORTFOLIO_USEABILITY}', '.pie-chart2', '#fb6340');
	      draw('${mainScoreChart.PORTFOLIO_CREATIVITY}', '.pie-chart3','#f5365c');
	      draw('${mainScoreChart.PORTFOLIO_CONTENTSCORE}', '.pie-chart4','#2dce89');
	      draw('${mainScoreChart.PORTFOLIO_DEVELOP}', '.pie-chart5','#770b93');

	    });

	    function draw(max, classname, colorname){
	      var i=1;
	      var func1 = setInterval(function(){
	        if(i<max){
	          color1(i,classname,colorname);
	          i++;
	        } else{
	          clearInterval(func1);
	        }
	      },10);
	    }
	    function color1(i, classname,colorname){
	      $(classname).css({
	        "background":"conic-gradient("+colorname+" 0% "+i+"%, #ffffff "+i+"% 100%)"
	      });
	    }

	    const designScore =  '${mainScoreChart.PORTFOLIO_DESIGN}';
	    const useabilityScore= '${mainScoreChart.PORTFOLIO_USEABILITY}';
	    const creativityScore = '${mainScoreChart.PORTFOLIO_CREATIVITY}';
	    const contentScore = '${mainScoreChart.PORTFOLIO_CONTENTSCORE}';
	    const developScore = '${mainScoreChart.PORTFOLIO_DEVELOP}';
	    
	      const designSpan = designScore.charAt(0)+'.';	
	      const designSmall = designScore.charAt(1);
 	      
	      const useabilitySpan =  useabilityScore.charAt(0)+'.';
	      const useabilitySmall = useabilityScore.charAt(1);
	      
	      const creativitySpan =creativityScore.charAt(0)+'.';
	      const creativitySmall = creativityScore.charAt(1);
	      
	      const contentSpan = contentScore.charAt(0)+'.';
	      const contentSmall = contentScore.charAt(0);
	      
	      const developSpan = developScore.charAt(0)+'.';
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
	    
	    let skill_check = 0;
	    
		$('.inserBtn').on('click',function(){
			
			if(${empty MEMBER_LOGININFO}){
				Swal.fire(
						  'Warning',
						  '포트폴리오 작성은 로그인 후 이용하실 수 있습니다.',
						  'warning'
						)
						
						return;
			}
			
			if(${!empty MEMBER_LOGININFO}){
				$.ajax({
					url : "${pageContext.request.contextPath}/user/mypage/mypageTechnologiesCheck.do",
					data : {mem_id : "${MEMBER_LOGININFO.mem_id}" },
					dataType: "json",
					type : "POST",
					error : function(error){
						alert(error);
					},
					success : function(result){
						console.log(result);
						if(result.MYPAGE_TECHNOLOGIES == null){
							 skill_check = 1;
						}
					}
				});
			}
			
			if(skill_check == 1){
				Swal.fire(
						  'Warning',
						  '포트폴리오 작성은 보유 기술 등록 후 이용하실 수 있습니다.',
						  'warning'
						)
						return;
			}
			
			
			location.href ="${pageContext.request.contextPath}/user/portfolio/portfolioForm.do";
		});  
	
	  });
  
  	  // 사진 눌렀을 때 View 페이지로 이동
  	 function goPortfolioView(e) {
  		  const portfolio_no = $(e).find('input[name=portfolio_no]').val();
  		  const mem_id = $(e).find('input[name=mem_id]').val();

  		 location.href="${pageContext.request.contextPath}/user/portfolio/portfolioView.do?portfolio_no="+ portfolio_no +"&mem_id=" +mem_id;
  	  }

  </script>


</body>
</html>