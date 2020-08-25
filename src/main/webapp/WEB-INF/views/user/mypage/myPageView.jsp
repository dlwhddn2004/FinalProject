<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
    <meta name="author" content="Creative Tim">
    <title>view</title>
    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" type="image/png">
    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <!-- Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/nucleo/css/nucleo.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
    <!-- Page plugins -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/select2/dist/css/select2.min.css">
    <!-- Argon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.2.0" type="text/css">
    <style>
            .font-test{
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
    </style>
</head>


<body>
    <!-- Page content -->
    <!--왼쪽 사진 넣기-->


    <div class="card-group" style=" margin: 15px 15px 15px 15px;">
        <!--* Card header *-->
        <!--* Card body *-->
        <!--* Card init *-->
        <div class="card chart-info">
            <!-- Card header -->
            <div class="card-header test1" style="display: flex; justify-content: space-around">
                <!-- Surtitle -->
                <h6 class="surtitle">활동 요약 정보</h6>
                <!-- Title -->

                <div class="card-mypage-info" style="display: flex">
                    <h1 class="h1 mb-0" style="margin: 10px 10px 10px 10px;">${MEMBER_LOGININFO.mem_id }</h1>
                    <!--<a class="btn btn-success" style="width: 100px; margin-left: 10px;">활동가능</a>-->
                    <div style=" margin-top: 25px;">
                        <span class="btn-inner--text btn-comment-cancel"
                              style="background: #2dce89; color: white; border-radius: 5px 5px 5px 5px; font-weight: bold; width: 200px;">활동가능</span>
                    </div>
                </div>

                <div class="card-body">
                    <a class="btn-icon write-tooltip" data-toggle="tooltip" data-original-title="MYPAGE"
                       style="display: flex; justify-content: space-around">
                       <c:if test="${MEMBER_LOGININFO.category_no == 1 }">
                       		<i class="fas fa-user-tie"> 파트너스 </i>
                       		<i class="fas fa-users">법인 사업자</i>
                       		<i class="fas fa-tasks"> 계약한 프로젝트 : ${projectNum}건</i> 
                       </c:if>
                       
                       <c:if test="${MEMBER_LOGININFO.category_no == 2 }">
                       		<i class="fas fa-keyboard"> 개발자</i>
                       		<i class="fas fa-user"> 개인</i>
                       	    <i class="fas fa-tasks"> 계약한 프로젝트 : ${projectNum}건</i>
                            <i class="fas fa-list"> 등록한 포트폴리오 : ${projectNum}건</i>
                       </c:if>
                       

                    </a>
                </div>


            </div>
            <!-- Card body -->
            <div class="chart aboutMe" style="display: flex; justify-content: space-around">

                <div class="profileInfo">

                    <div class="perfect-center">
                        <h3 class="card-title mb-3 font-test">대표 프로필 사진</h3>
                    </div>
                    <div class="dropzone dropzone-single" data-toggle="dropzone" data-dropzone-url="http://">
                        <div class="fallback">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="dropzoneBasicUpload" name="files">
                                <label class="custom-file-label" for="dropzoneBasicUpload">Choose file</label>
                            </div>
                        </div>

                        <div class="dz-preview dz-preview-single">
                            <div class="dz-preview-cover">
                                <img class="dz-preview-img" src="${pageContext.request.contextPath}/assets/img/theme/team-1.jpg" alt="..."
                                     data-dz-thumbnail>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="aboutMe">
                    <div class="aboutMe-info" style="width: 600px;">
                        <div class="perfect-center">
                            <h3 class="card-title mb-3 font-test" style="position: center;">자기 소개</h3>
                        </div>
                        <img src="/MYPAGE_ABOUTME.PNG" style="width: 800px;" name="abuutImg">

                        <div class="write-area">
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="mypage_aboutme" placeholder="내용을 입력해주세요" style="width: 600px;"></textarea>
                            <div class="perfect-center">
                                <button class="btn btn-primary about-insert" style="margin-top: 10px;" onclick="insertAboutMe();">등록</button>
                                <button class="btn btn-primary about-cansle" style="margin-top: 10px;">취소</button>
                            </div>
                        </div>


                        <div class="write-area-update">
                            <textarea class="form-control" id="exampleFormControlTextarea2" rows="3" name="mypage_aboutme" placeholder="내용을 입력해주세요" style="width: 600px;"></textarea>
                            <div class="perfect-center">
                                <button class="btn btn-primary about-update" style="margin-top: 10px;" >수정</button>
                                <button class="btn btn-primary about-cansle" style="margin-top: 10px;">취소</button>
                            </div>
                        </div>


                        <div class="perfect-center" style="display: flex; justify-content: flex-end";>
                            <button class="btn btn-primary mypage-about" style="margin-top: 10px;">업데이트 하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="card-group">
        <div class="col-xl-6">
            <!--* Card header *-->
            <!--* Card body *-->
            <!--* Card init *-->
            <div class="card">
                <!-- Card header -->
                <div class="card-header">
                    <!-- Surtitle -->
                    <h6 class="surtitle">프로젝트</h6>
                    <!-- Title -->
                    <h5 class="h3 mb-0">진행한 프로젝트</h5>
                </div>
                <!-- Card body -->
                <div class="card-body">
                    <div class="chart">
                        <!-- Chart wrapper -->
                        <canvas id="pieChart" class="chart-canvas"></canvas>
<%--                          <canvas id="chart-doughnut" class="chart-canvas"></canvas> --%>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-6">
            <!--* Card header *-->
            <!--* Card body *-->
            <!--* Card init *-->
            <div class="card">
                <!-- Card header -->
                <div class="card-header">
                    <!-- Surtitle -->
                    <h6 class="surtitle">전문성</h6>
                    <!-- Title -->
                    <h5 class="h3 mb-0">세부항목 평가</h5>
                </div>
                <!-- Card body -->
                <div class="card-body">
                    <div class="chart">
                        <!-- Chart wrapper -->
                        <%-- <canvas id="chart-bars" class="chart-canvas"></canvas --%>
                        <%--  <canvas id="testradarchart" class="chart-canvas"></canvas> --%>
                         
                        <canvas id="chartjs-3" class="chartjs" width="undefined" height="undefined"></canvas>
                      
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer pt-0">
        <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6">
                <div class="copyright text-center  text-lg-left  text-muted">
                    &copy; 2020 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative
                    Tim</a>
                </div>
            </div>
            <div class="col-lg-6">
                <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                    <li class="nav-item">
                        <a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a>
                    </li>
                    <li class="nav-item">
                        <a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About
                            Us</a>
                    </li>
                    <li class="nav-item">
                        <a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a>
                    </li>
                    <li class="nav-item">
                        <a href="https://www.creative-tim.com/license" class="nav-link" target="_blank">License</a>
                    </li>
                </ul>
            </div>
        </div>
    </footer>
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
<script src="${pageContext.request.contextPath}/assets/vendor/dropzone/dist/min/dropzone.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/chart.js/dist/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/chart.js/dist/Chart.extension.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

<script>
        /* 자기소개 수정 */
    $('.write-area-update').hide();
        /*자기소개 등록*/
    $('.write-area').hide();

    $(function (){
        $('.mypage-about').on('click',function (){
           $('img[name=abuutImg]').hide();

            $('.write-area').show();
            $('.mypage-about').hide();
        });
    });

    /*자기소개 등록 취소*/
       $('.about-cansle').on('click',function(){
           $('img[name=abuutImg]').show();
           $('.mypage-about').show();
           $('.write-area').hide();
       });

       /*자기소개등록*/
       function insertAboutMe(){
           /*줘야할것들 카테고리 번호 회원아이디 자기소개 ,프로필사진*/
           const mypage_aboutme = $('#exampleFormControlTextarea1').val();
           alert(mypage_aboutme);
       }
       
    	/* var ctx = document.getElementById('testradarchart').getContext('2d');
	var myChart = new Chart(ctx, {
	    type: 'radar',
	    data: {
	        labels: ['전문성', '의사소통', '긍정', '만족도', '협동심'],
	        datasets: [
	           {
	            label: '현재 점수 ',
	            data: ['${memberRate.professional}', '${memberRate.communication}', '${memberRate.positiveness}', '${memberRate.satisfaction}','${memberRate.compliance}'],
	            backgroundColor: [
	                '#ffd600',
	                 '#fb6340',
	                '#2dce89',
	                '11cdef',
	                '#f5365c' 
	            ],
	            borderColor: [
	                '#ffd600',
	                '#fb6340',
	                '#2dce89',
	                '11cdef', 
	                '#f5365c'
	            ]
	            
	       	 }
	       ]
	        
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: false
	                }
	            }]
	        }
	    }
	});  */

	

	var myChart =  new Chart(document.getElementById("chartjs-3"),
            {"type":"radar",
                "data":
                    {"labels":
                            ["전문성","의사소통","긍정","만족도","협동심"],
                        "datasets":[
                            {"label":"현재 점수","data":['${memberRate.professional}','${memberRate.communication}', '${memberRate.positiveness}', '${memberRate.satisfaction}','${memberRate.compliance}'],
                                "fill":true,
                                "backgroundColor":"rgba(255, 99, 132, 0.2)",
                                "borderColor":"rgb(255, 99, 132)",
                                "pointBackgroundColor":"rgb(255, 99, 132)",
                                "pointBorderColor":"#fff",
                                "pointHoverBackgroundColor":"#fff",
                                "pointHoverBorderColor":"rgb(255, 99, 132)"},
                            {"label":"이전 점수",
                                "data":['${memberRate.professional_bef}','${memberRate.communication_bef}', '${memberRate.positiveness_bef}', '${memberRate.satisfaction_bef}','${memberRate.compliance_bef}'],
                                "fill":true,
                                "backgroundColor":"rgba(54, 162, 235, 0.2)",
                                "borderColor":"rgb(54, 162, 235)",
                                "pointBackgroundColor":"rgb(54, 162, 235)",
                                "pointBorderColor":"#fff",
                                "pointHoverBackgroundColor":"#fff",
                                "pointHoverBorderColor":"rgb(54, 162, 235)"}]},
                "options":{
                    "elements":{
                        "line":{
                            "tension":0,"borderWidth":3}},
                            }});
	
	
    const pieChart = new Chart(document.getElementById("pieChart"), {
        type: 'pie',
        data: {
            labels: [
                'Angular',
                'Bootstrap',
                'React',
                'Vue'

            ],
            datasets: [{
                data: [
                    2,
                    1,
                    1,
                    1,
                    
                ],
                backgroundColor: [
                    Charts.colors.theme['danger'],
                    Charts.colors.theme['warning'],
                    Charts.colors.theme['success'],
                    Charts.colors.theme['info'],
                ],
                label: 'Dataset 2'
            }],
        },
        options: {
            responsive: true,
            legend: {
                position: 'top',
            },
            animation: {
                animateScale: true,
                animateRotate: true
            }
        }
    });
	
</script>
</body>

</html>