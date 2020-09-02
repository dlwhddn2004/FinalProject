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
.img-hover-css {
	width: 510px;
	height: 364px;
	overflow: hidden;
}

.img-hover-css img:hover {
	animation-name: img-hover;
	animation-duration: 0.25s;
	animation-iteration-count: 2;
	animation-direction: alternate;
}

@
keyframes img-hover { 0% {
	transform: scale(1.0);
	opacity: 1.0;
}

100%
{
transform
:
 
scale
(1
.05
);

        
opacity
:
 
0
.8
;

      
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
</style>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<!-- Image-Text card -->
			<div class="card mainDiv"
				style="background-image: url('/${MainportfolioInfo.PORTFOLIO_THUMBNAILIMG}'); height: 500px;">
				<!-- Card image -->
				<!--              <img class="card-img-top" src="https://assets.awwwards.com/awards/media/cache/optimize/sites_of_the_day/2020/08/thanks-site.jpg" alt="Image placeholder" style="height: 500px;">-->
				<!-- Chart wrapper -->
				<div style="margin: 100px 0px 0px 0px;">
					<div class="perpectCenter">
						<span class="h1 font-weight-bold text-white"
							style="font-size: 30px;">${MainportfolioInfo.PORTFOLIO_NAME }</span>
					</div>
					<div class="perpectCenter">
						<span class="h3 font-weight-light text-cyan"> by ${MainportfolioInfo.MEM_ID } FROM TotalScore ${maxportfolioAvg.TOTALAVG}</span>
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; align-items: center; margin: 0px 0px 0px 0px;">
					<div>
						<div class="pie-chartTest pie-chart1" style="margin: 15px;">
							<span class="centerTest">
								<div style="margin: 16px 0px 0px 0px;">
									<span class="h1 text-white">7.</span> <small class="text-white">34</small>

									
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
									<span class="h1 text-white">5.</span> <small class="text-white">55</small>
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
									<span class="h1 text-white">8.</span> <small class="text-white">15</small>
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
									<span class="h1 text-white">3.</span> <small class="text-white">55</small>
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
									<span class="h1 text-white">9.</span> <small class="text-white">99</small>
								</div>
							</span>
						</div>
						<div style="display: flex; justify-content: center;">
							<h3 class="text-white">DEVELOP</h3>
						</div>
					</div>

				</div>
				<div>
					<a href="https://twks.ch/" data-identifier="twks"
						class="bt-default green-fill" target="_blank"
						rel="noopener nofollow">Visit Site</a>
				</div>
			</div>
		</div>
	</div>
	<div class="bg-secondary row">
		<div class="perpectCenter" style="margin: 10px 10px 20px 10px;">
			<span class="h1 text-black">Category</span>&nbsp;&nbsp;&nbsp; <span
				class="h2 text-black-50" style="margin: 1px 0px 0px 0px;">Bootstrap</span>
		</div>

		<div class="row">
			<div class="col-lg-4">
				<!-- 작업중 -->
				<!-- Image-Text card -->
				<div class="card">
					<!-- Card image -->
					<div class="img-hover-css">
						<img class="card-img-top"
							src="https://assets.awwwards.com/awards/media/cache/thumb_417_299/submissions/2020/07/5f1f21298046d903081377.jpg"
							alt="Image placeholder">
					</div>
					<!-- Card body -->
					<div class="card-body">
						<small class="text-muted">TITLE</small>
						<h5 class="h2 card-title mb-0">MILL3 STUDIO</h5>
						<small class="text-muted">2020-08-30</small>
					</div>
					<div class="card-footer"
						style="display: flex; justify-content: space-between; align-items: center;">
						<div style="display: flex;">
							<div>
								<img alt="Image placeholder"
									src="${pageContext.request.contextPath}/assets/img/theme/team-1.jpg"
									class="avatar rounded-circle">
							</div>
							<div style="margin: 0px 0px 0px 10px;">
								<h5 style="margin: 10px 0px 0px 0px;"
									class="text-lg text-lg-center">iai6203</h5>
							</div>
						</div>
						<div>
							<span class="badge badge-primary">angular</span>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4">
				<!-- Image-Text card -->
				<div class="card">
					<!-- Card image -->
					<div class="img-hover-css">
						<img class="card-img-top"
							src="https://assets.awwwards.com/awards/media/cache/thumb_417_299/submissions/2020/07/5f1f21298046d903081377.jpg"
							alt="Image placeholder">
					</div>
					<!-- Card body -->
					<div class="card-body">
						<small class="text-muted">TITLE</small>
						<h5 class="h2 card-title mb-0">MILL3 STUDIO</h5>
						<small class="text-muted">2020-08-30</small>
					</div>
					<div class="card-footer"
						style="display: flex; justify-content: space-between; align-items: center;">
						<div style="display: flex;">
							<div>
								<img alt="Image placeholder"
									src="${pageContext.request.contextPath}/assets/img/theme/team-1.jpg"
									class="avatar rounded-circle">
							</div>
							<div style="margin: 0px 0px 0px 10px;">
								<h5 style="margin: 10px 0px 0px 0px;"
									class="text-lg text-lg-center">iai6203</h5>
							</div>
						</div>
						<div>
							<span class="badge badge-primary">angular</span>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4">
				<!-- Image-Text card -->
				<div class="card">
					<!-- Card image -->
					<div class="img-hover-css">
						<img class="card-img-top"
							src="https://assets.awwwards.com/awards/media/cache/thumb_417_299/submissions/2020/07/5f1f21298046d903081377.jpg"
							alt="Image placeholder">
					</div>
					<!-- Card body -->
					<div class="card-body">
						<small class="text-muted">TITLE</small>
						<h5 class="h2 card-title mb-0">MILL3 STUDIO</h5>
						<small class="text-muted">2020-08-30</small>
					</div>
					<div class="card-footer"
						style="display: flex; justify-content: space-between; align-items: center;">
						<div style="display: flex;">
							<div>
								<img alt="Image placeholder"
									src="${pageContext.request.contextPath}/assets/img/theme/team-1.jpg"
									class="avatar rounded-circle">
							</div>
							<div style="margin: 0px 0px 0px 10px;">
								<h5 style="margin: 10px 0px 0px 0px;"
									class="text-lg text-lg-center">iai6203</h5>
							</div>
						</div>
						<div>
							<span class="badge badge-primary">angular</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bg-secondary row">
				<div class="perpectCenter" style="margin: 10px 10px 20px 10px;">
			<span class="h1 text-black">Category</span>&nbsp;&nbsp;&nbsp; <span
				class="h2 text-black-50" style="margin: 1px 0px 0px 0px;">angular</span>
		</div>
		<div class="row">
			<div class="col-lg-4">
				<!-- Image-Text card -->
				<div class="card">
					<!-- Card image -->
					<div class="img-hover-css">
						<img class="card-img-top"
							src="https://assets.awwwards.com/awards/media/cache/thumb_417_299/submissions/2020/07/5f1f21298046d903081377.jpg"
							alt="Image placeholder">
					</div>
					<!-- Card body -->
					<div class="card-body">
						<small class="text-muted">TITLE</small>
						<h5 class="h2 card-title mb-0">MILL3 STUDIO</h5>
						<small class="text-muted">2020-08-30</small>
					</div>
					<div class="card-footer"
						style="display: flex; justify-content: space-between; align-items: center;">
						<div style="display: flex;">
							<div>
								<img alt="Image placeholder"
									src="${pageContext.request.contextPath}/assets/img/theme/team-1.jpg"
									class="avatar rounded-circle">
							</div>
							<div style="margin: 0px 0px 0px 10px;">
								<h5 style="margin: 10px 0px 0px 0px;"
									class="text-lg text-lg-center">iai6203</h5>
							</div>
						</div>
						<div>
							<span class="badge badge-primary">angular</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<!-- Image-Text card -->
				<div class="card">
					<!-- Card image -->
					<div class="img-hover-css">
						<img class="card-img-top"
							src="https://assets.awwwards.com/awards/media/cache/thumb_417_299/submissions/2020/07/5f1f21298046d903081377.jpg"
							alt="Image placeholder">
					</div>
					<!-- Card body -->
					<div class="card-body">
						<small class="text-muted">TITLE</small>
						<h5 class="h2 card-title mb-0">MILL3 STUDIO</h5>
						<small class="text-muted">2020-08-30</small>
					</div>
					<div class="card-footer"
						style="display: flex; justify-content: space-between; align-items: center;">
						<div style="display: flex;">
							<div>
								<img alt="Image placeholder"
									src="${pageContext.request.contextPath}/assets/img/theme/team-1.jpg"
									class="avatar rounded-circle">
							</div>
							<div style="margin: 0px 0px 0px 10px;">
								<h5 style="margin: 10px 0px 0px 0px;"
									class="text-lg text-lg-center">iai6203</h5>
							</div>
						</div>
						<div>
							<span class="badge badge-primary">angular</span>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4">
				<!-- Image-Text card -->
				<div class="card">
					<!-- Card image -->
					<div class="img-hover-css">
						<img class="card-img-top"
							src="https://assets.awwwards.com/awards/media/cache/thumb_417_299/submissions/2020/07/5f1f21298046d903081377.jpg"
							alt="Image placeholder">
					</div>
					<!-- Card body -->
					<div class="card-body">
						<small class="text-muted">TITLE</small>
						<!-- 제목 -->
						<h5 class="h2 card-title mb-0">MILL3 STUDIO</h5>
						<!-- 등록날짜 -->
						<small class="text-muted">2020-08-30</small>
					</div>
					<div class="card-footer"
						style="display: flex; justify-content: space-between; align-items: center;">
						<div style="display: flex;">
							<div>
								<img alt="Image placeholder"
									src="${pageContext.request.contextPath}/assets/img/theme/team-1.jpg"
									class="avatar rounded-circle">
							</div>
							<div style="margin: 0px 0px 0px 10px;">
								<!--유저 아이디 -->
								<h5 style="margin: 10px 0px 0px 0px;"
									class="text-lg text-lg-center">iai6203</h5>
							</div>
						</div>
						<div>
							<!--관련기술 넣기-->
							<span class="badge badge-primary">angular</span>
						</div>
					</div>
				</div>
			</div>

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
  <script src="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/jvectormap-next/jquery-jvectormap.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/vendor/jvectormap/jquery-jvectormap-world-mill.js"></script>

  <script src="${pageContext.request.contextPath}/assets/vendor/chart.js/dist/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/chart.js/dist/Chart.extension.js"></script>
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

	  });

  </script>


</body>
</html>