<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.css">
    <!-- Argon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">
    
   <style>
        .pie-chartTest {
            position: relative;
            width: 90px;
            height: 90px;
            border-radius: 50%;
            transition: 0.3s;
        }

        .centerTest {
            background: url('https://assets.awwwards.com/awards/media/cache/optimize/sites_of_the_day/2020/08/thanks-site.jpg');
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
		<div class="col-md-12">
			<!-- Image-Text card -->
			<div class="card mainDiv"
				style="background-image: url('/${portfolioInfo.PORTFOLIO_THUMBNAILIMG}'); height: 600px;">
				<div class="row">
					<div class="col-md-12">
						<div class="icon-actions" style="display: flex; justify-content: flex-end; margin: 10px 40px 10px 10px;">
							<a href='javascript:void(0);' onclick="portfolioLike();"> 
							<i class="far fa-heart fa-4x" id="like-icon" style="color: tomato"></i> 
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
						<span class="h3 font-weight-light text-cyan"> by ${portfolioInfo.MEM_ID } FROM TotalScore ${chartInfo.TOTALAVG}</span>
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; align-items: center; margin: 0px 0px 0px 0px;">
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
						<a target="_ blank" href='${portfolioInfo.PORTFOLIO_URL}'>
	                          <button type="button" class="btn btn-outline-success" style="border-radius: 25px; color: white;">Visit Site</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>


        <div class="row">
            <div class="col-md-9">
                <div class="card">
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
                                    <div class="progress-bar bg-default" role="progressbar" aria-valuenow="60"
                                         aria-valuemin="0" aria-valuemax="100" style="width: ${portfolioInfo.PORTFOLIO_PARTICIPATIONRATE }%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="row-cols-md-6" style="margin: 0px 0px 10px 0px;">
							<!-- 사용 기술에 따른 이미지 표현 -->
                            <c:if test="${portfolioInfo.PORTFOLIO_TECHNOLOGIES == 1 }">
                            	<span class="mb-0" style="font-weight: bolder;">
                            	<img alt="Image placeholder" src="${pageContext.request.contextPath}/assets/img/theme/angular.jpg" style="width: 48px; height: 48px;">angular</span>
                            </c:if> 
                            
                            <c:if test="${portfolioInfo.PORTFOLIO_TECHNOLOGIES == 2 }">
                            	<span class="mb-0" style="font-weight: bolder;">
                            	<img alt="Image placeholder" src="${pageContext.request.contextPath}/assets/img/theme/bootstrap.jpg" style="width: 48px; height: 48px;">bootstrap</span>
                            </c:if> 
                            <c:if test="${portfolioInfo.PORTFOLIO_TECHNOLOGIES == 3 }">
                            	<span class="mb-0" style="font-weight: bolder;">
                            	<img alt="Image placeholder" src="${pageContext.request.contextPath}/assets/img/theme/react.jpg" style="width: 48px; height: 48px;">react</span>
                            </c:if> 
                            <c:if test="${portfolioInfo.PORTFOLIO_TECHNOLOGIES == 4 }">
                            	<span class="mb-0" style="font-weight: bolder;">
                            	<img alt="Image placeholder" src="${pageContext.request.contextPath}/assets/img/theme/vue.jpg" style="width: 48px; height: 48px;">vue</span>
                            </c:if> 
                            
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-control-label" for="exampleDatepicker">등록 날짜</label>
                                    <input class="form-control datepicker" id="exampleDatepicker"
                                           placeholder="Select date" type="text" value="${portfolioInfo.PORTFOLIO_REGDATE }" disabled="disabled">
                                </div>
                            </div>
                        </div>
                        <div class="row input-daterange datepicker align-items-center">
                            <div class="col">
                                <div class="form-group">
                                    <label class="form-control-label">시작 날짜</label>
                                    <input class="form-control" placeholder="Start date" type="text"
                                           value="${portfolioInfo.PORTFOLIO_STARTDATE }" disabled="disabled">
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label class="form-control-label">마감 날짜</label>
                                    <input class="form-control" placeholder="End date" type="text"
                                           value="${portfolioInfo.PORTFOLIO_ENDDATE }" disabled="disabled">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="form-control-label" for="portfolioText">포트폴리오 소개</label>
                                    <textarea class="form-control" id="portfolioText" rows="6" disabled="disabled">${portfolioInfo.PORTFOLIO_DESCRIPTION}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div>
                </div>

            </div>
            <div class="col-md-3">
                <div class="card card-profile">
                    <img src="${pageContext.request.contextPath}/assets/img/theme/img-1-1000x600.jpg" alt="Image placeholder" class="card-img-top">
                    <div class="row justify-content-center">
                        <div class="col-lg-3 order-lg-2">
                            <div class="card-profile-image">
                                <a href="#">
                                    <img src="/${portfolioInfo.PROFILE_SAVENAME}" class="rounded-circle">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
                        <div class="d-flex justify-content-between">
                            <a href="#" class="btn btn-sm btn-info  mr-4 ">Contact</a>
                            <a href="#" class="btn btn-sm btn-default float-right">Message</a>
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
                                        <span class="heading">미정</span>
                                        <span class="description">Career</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <h5 class="h3">
                                ${portfolioInfo.MEM_ID }<span class="font-weight-light">, ${portfolioInfo.MEM_AGE }</span>
                            </h5>
                            <div class="h5 font-weight-300">
                                <i class="ni location_pin mr-2"></i>
                                <span class="badge badge-pill badge-warning">Developer</span>
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
		
		<div class="card">
			<div class="row">
			 	<div class="col-md-12">
			 		<!-- 댓글 정보 추가해주자 -->
			 		
			 	</div>
			</div>
		</div>



<script src="${pageContext.request.contextPath}/assets/vendor/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js-cookie/js.cookie.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
<!-- Optional JS -->
	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/nouislider/distribute/nouislider.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/quill/dist/quill.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/dropzone/dist/min/dropzone.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('#datetimepicker1').datetimepicker({
            icons: {
                time: "fa fa-clock",
                date: "fa fa-calendar-day",
                up: "fa fa-chevron-up",
                down: "fa fa-chevron-down",
                previous: 'fa fa-chevron-left',
                next: 'fa fa-chevron-right',
                today: 'fa fa-screenshot',
                clear: 'fa fa-trash',
                close: 'fa fa-remove'
            }
        });
    });
</script>


<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
<script>

    $(function () {
    	
	    let designScore;
	    let useabilityScore;
	    let creativityScore;
	    let contentScore;
	    let developScore;
	    
		if( '${empty chartInfo}'){
		     designScore =  '00';
		     useabilityScore= '00';
		     creativityScore = '00';
		     contentScore = '00';
		     developScore = '00';
		     
		}else{
		     designScore =  '${chartInfo.PORTFOLIO_DESIGN}';
		     useabilityScore= '${chartInfo.PORTFOLIO_USEABILITY}';
		     creativityScore = '${chartInfo.PORTFOLIO_CREATIVITY}';
		     contentScore = '${chartInfo.PORTFOLIO_CONTENTSCORE}';
		     developScore = '${chartInfo.PORTFOLIO_DEVELOP}';
		}
   

	    $(window).ready(function(){

	    	
		      draw(designScore, '.pie-chart1', '#11cdef');
		      draw(useabilityScore, '.pie-chart2', '#fb6340');
		      draw(creativityScore, '.pie-chart3','#f5365c');
		      draw(contentScore, '.pie-chart4','#2dce89');
		      draw(developScore, '.pie-chart5','#770b93');

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
			// 만약 댓글이 없을경우 0점 처리 해줘야 한다.
			

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
		    
		    
		    $('.fas fa-heart fa-4x').on('click',function(){
		    	alert('good');
		 		 $('#like-ion').attr('class','far fa-heart fa-4x');
		 	 });
		  });
	  

    function portfolioLike(){
    	
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
		    	type:'POST',
			 url:'${pageContext.request.contextPath}/user/portfolio/portfolioLike.do',
			 dataType:'json',
			 data: {portfolio_no : portfolio_no},
			 success : function(result){

				$('#like-icon').attr('class','fas fa-heart fa-4x');
				const likeNum = ${portfolioInfo.PORTFOLIO_LIKE} + 1;
				$('#like-Text').text(likeNum);
				
			
				
			 },
			 error: function(xhr,status,error){
				 alert(error);
			 }
		 });	
    }


</script>
</body>
</html>