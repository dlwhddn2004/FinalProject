<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
		        *,
		*::after,
		*::before {
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
				color: rgba(255,255,255,0.8);
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
		
		.file-upload-native,
		.file-upload-text {
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
		
		.file-upload-native:focus,
		.file-upload-text:focus {
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


    <!-- Page content -->
    <!--왼쪽 사진 넣기-->


    <div class="card-group" style=" margin: 15px 15px 15px 15px;">
        <!--* Card header *-->
        <!--* Card body *-->
        <!--* Card init *-->
        <div class="card chart-info">
            <!-- Card header -->
            <div class="card-header test1">
            	<h6 class="surtitle">활동 요약정보</h6>
            	<div style="display: flex; justify-content: space-around">
                <div class="perfect-center card-mypage-info">
                    <h1 class="h1 mb-0" style="display: inline-block; margin: 0px 0px 20px 0px;">${MEMBER_LOGININFO.mem_id }</h1>
                    <!--<a class="btn btn-success" style="width: 100px; margin-left: 10px;">활동가능</a>-->
                        <span class="btn-inner--text btn-comment-cancel"
                              style="background: #2dce89; color: white; border-radius: 5px 5px 5px 5px; font-weight: bold; margin: 0px 0px 0px 15px;">활동가능</span>
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


            </div>
            <!-- Card body -->
            <div class="chart aboutMe" style="display: flex; justify-content: space-around">

                <div class="profileInfo">

                    <div class="perfect-center">
                        <h3 class="card-title mb-3 font-test">대표 프로필 사진</h3>
                    </div>
                    <div  style="width: 300px; height: 250px; border : 3px dotted aliceblue;">
                    	<c:if test="${profileFileInfo.profile_savename eq 'basicprofile'}">
                    		<img class="dz-preview-img" src="/basicprofile.png" alt="...">
                    	</c:if>
                    	<c:if test="${profileFileInfo.profile_savename ne 'basicprofile'}">
                    		<img class="dz-preview-img" src="/${profileFileInfo.profile_savename}" alt="...">
                    	</c:if>
                    </div>
                    
                </div>

                <div class="aboutMe">
                    <div class="aboutMe-info" style="width: 600px;">
                        <div class="perfect-center">
                            <h3 class="card-title mb-3 font-test" style="margin-left: 20%">자기 소개</h3>
                        </div>
                        <!-- 자기소개가 없으면 이미지 보여주기 -->
                        <c:if test="${empty mypageMemberInfo.mypage_aboutme }">
                      <img src="/MYPAGE_ABOUTME.PNG" style="width: 800px;" name="abuutImg">
                        </c:if>
                        <c:if test="${!empty mypageMemberInfo.mypage_aboutme }">
                        	<div>
                        <textarea class="form-control mypage_aboutme" id="mypage_aboutmeInfo" rows="6" name="mypage_aboutme"
          									 disabled="disabled"></textarea>
                        	</div>
                        </c:if>
<!--                    모달버튼 클릭하면 모달창 나오기-->
		 <!-- 신규일 경우 -->
						<c:if test="${empty mypageMemberInfo.mypage_aboutme }">
					        <div class="perfect-center" style="display: flex; justify-content: flex-end";>
                            <button class="btn btn-icon btn-primary" type="button" data-toggle="modal" data-target="#modal-form" style="margin : 15px 0px 0px 0px;">
                                <span class="btn-inner--icon"><i class="ni ni-bag-17"></i></span>
                                <span class="btn-inner--text">업데이트하기</span>
                            </button>
                            <div class="modal fade" id="modal-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
                                <div class="modal-dialog modal- modal-dialog-centered modal-sm modal-test" role="document">
                                    <div class="modal-content">

                                        <div class="modal-body p-0">
                                            <div class="card bg-secondary border-0 mb-0">
                                                <div class="card-body px-lg-5 py-lg-5">
                                                    	 <div class="text-center text-muted mb-4">
                                                            <small>대표 프로필 사진</small>
                                                        </div>
                                                    <form role="form" class="my-about-form" action="${pageContext.request.contextPath}/user/mypage/insertMyabout.do" method="post"  enctype="multipart/form-data">
                                                    	<input type="hidden" name="mem_id" value="${MEMBER_LOGININFO.mem_id }">
                                                    	<input type="hidden" name="category_no" value="${MEMBER_LOGININFO.category_no }">

                                                        <div class="form-group">
															<div class="preview img-wrapper"></div>
															<div class="file-upload-wrapper">
																	<input type="file" name="files" class="file-upload-native" accept="image/*" />
																	<input type="text" disabled placeholder="upload image" class="file-upload-text" />
															</div>                                                          
                                                        </div>
                                                       	<div class="text-center text-muted mb-4">
                                                        <small>자기 소개</small>
                                                    	</div>
                                                        <div class="form-group mb-3">
                                                            <div class="input-group input-group-merge input-group-alternative">
                                                                <div class="input-group-prepend">
                                                                    <span class="input-group-text"><i class="far fa-file-alt"></i></span>
                                                                </div>
                                                                <textarea class="form-control mypage_aboutme" id="exampleFormControlTextarea1" rows="6" name="mypage_aboutme"
                                                                          placeholder="내용을 작성해주세요" required></textarea>
                                                            </div>
                                                        </div>

                                                        <div class="text-center">
                                                        	 <button type="submit" class="btn btn-success my-4 insertAbout" name="insertMypageInfo">저장하기</button>
                                                            <button type="button" class="btn btn-warning my-4" data-dismiss="modal">취소</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						</c:if>
						
						 <!-- 신규 유저 아닐 경우 -->
						<c:if test="${!empty mypageMemberInfo.mypage_aboutme }">
						                        <div class="perfect-center" style="display: flex; justify-content: flex-end";>
                            <button class="btn btn-icon btn-primary" type="button" data-toggle="modal" data-target="#modal-form2" style="margin : 15px 0px 0px 0px;">
                                <span class="btn-inner--icon"><i class="ni ni-bag-17"></i></span>
                                <span class="btn-inner--text">업데이트하기</span>
                            </button>
                            <div class="modal fade" id="modal-form2" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
                                <div class="modal-dialog modal- modal-dialog-centered modal-sm modal-test" role="document">
                                    <div class="modal-content">

                                        <div class="modal-body p-0">
                                            <div class="card bg-secondary border-0 mb-0">
                                                <div class="card-body px-lg-5 py-lg-5">
                                                    	 <div class="text-center text-muted mb-4">
                                                            <small>대표 프로필 사진</small>
                                                        </div>
                                                    <form role="form" class="my-about-form" action="${pageContext.request.contextPath}/user/mypage/modifyMyabout.do" method="post"  enctype="multipart/form-data">
                                                    	<input type="hidden" name="mem_id" value="${MEMBER_LOGININFO.mem_id }">
                                                    	<input type="hidden" name="category_no" value="${MEMBER_LOGININFO.category_no }">

                                                        <div class="form-group">
															<div class="preview img-wrapper"></div>
															<div class="file-upload-wrapper">
																	<input type="file" name="files" class="file-upload-native" accept="image/*" />
																	<input type="text" disabled placeholder="upload image" class="file-upload-text" />
															</div>                                                          
                                                        </div>
                                                       	<div class="text-center text-muted mb-4">
                                                        <small>자기 소개</small>
                                                    	</div>
                                                        <div class="form-group mb-3">
                                                            <div class="input-group input-group-merge input-group-alternative">
                                                                <div class="input-group-prepend">
                                                                    <span class="input-group-text"><i class="far fa-file-alt"></i></span>
                                                                </div>
                                                                <textarea class="form-control mypage_aboutme" id="exampleFormControlTextarea2" rows="6" name="mypage_aboutme"
                                                                          placeholder="내용을 작성해주세요" required></textarea>
                                                            </div>
                                                        </div>

                                                        <div class="text-center">
                                                             <button type="submit" class="btn btn-info my-3 updateAbout" name="updateMypageInfo">수정하기</button>
                                                            <button type="button" class="btn btn-warning my-4" data-dismiss="modal">취소</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						</c:if>

<!--                        모달종료-->
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
<script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.3.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>

<script>	
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
	
  
  	/* 업로드 스크립트 */  
    $(function() {
    	function maskImgs() {
    		//$('.img-wrapper img').imagesLoaded({}, function() {
    		$.each($('.img-wrapper img'), function(index, img) {
    			var src = $(img).attr('src');
    			var parent = $(img).parent();
    			parent
    				.css('background', 'url(' + src + ') no-repeat center center')
    				.css('background-size', 'cover');
    			$(img).remove();
    		});
    		//});
    	}

    	var preview = {
    		init: function() {
    			preview.setPreviewImg();
    			preview.listenInput();
    		},
    		setPreviewImg: function(fileInput) {
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
    		showPreview: function(fileInput, path, uploadText) {
    			var file = $(fileInput)[0].files;

    			if (file && file[0]) {
    				var reader = new FileReader();

    				reader.onload = function(e) {
    					var previewImg = $(fileInput).parents('.file-upload-wrapper').siblings('.preview');
    					var img = $(previewImg).find('img');

    					if (img.length == 0) {
    						$(previewImg).html('<img src="' + e.target.result + '" alt=""/>');
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
    		listenInput: function() {
    			$('.file-upload-native').on('change', function() {
    				preview.setPreviewImg(this);
    			});
    		}
    	};
    	preview.init();
    	
    	/* test area 값 가져옴 */
    	$('#mypage_aboutmeInfo').val("${mypageMemberInfo.mypage_aboutme}");
    });
  	
  	
    function modifiyMypageInfo(){
    	const mypage_aboutme_ipt = $('#mypage_aboutmeInfo').val();
    	
    }

</script>

