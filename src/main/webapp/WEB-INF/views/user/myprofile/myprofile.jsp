<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(function() {
		$('form[name=memberForm]')
				.submit(
						function() {
							$(this)
									.attr('action',
											'${pageContext.request.contextPath}/user/myprofile/updateMemberInfo.do');

							var mem_bir = $('input[name=mem_bir1]').val() + '-'
									+ $('input[name=mem_bir2]').val() + '-'
									+ $('input[name=mem_bir3]').val();
							$('input[name=mem_bir]').val(mem_bir);

							var mem_tel = $('select[name=mem_tel1]').val()
									+ '-' + $('input[name=mem_tel2]').val()
									+ '-' + $('input[name=mem_tel3]').val();
							$('input[name=mem_tel]').val(mem_tel);

							var mem_addr = $('input[name=mem_addr1]').val()
									+ '-' + $('input[name=mem_addr2]').val()
									+ '-' + $('input[name=mem_addr3]').val()
									+ '-' + $('input[name=mem_addr4]').val();

							$('input[name=mem_addr]').val(mem_addr);
						});

	});

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('addr2').value = fullRoadAddr;
						document.getElementById('addr3').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
	new daum.Postcode({
		onclose : function(state) {
			//state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
			if (state === 'FORCE_CLOSE') {
				//사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.

			} else if (state === 'COMPLETE_CLOSE') {
				//사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 실행될 코드를 작성하는 부분입니다.
				//oncomplete 콜백 함수가 실행 완료된 후에 실행됩니다.
			}
		}
	});
</script>
<html>
<style>
.card-profile {
	width: 100%;
	height: 100%;
}
/* .card-body {
display: table; margin-left: auto; margin-right: auto; display: inline-block;


} */
</style>
<head>
<head>

<!-- Favicon -->
<link rel="icon" href="../../assets/img/brand/favicon.png"
	type="image/png">
<!-- Fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Icons -->
<link rel="stylesheet" href="../../assets/vendor/nucleo/css/nucleo.css"
	type="text/css">
<link rel="stylesheet"
	href="../../assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	type="text/css">
<!-- Argon CSS -->
<link rel="stylesheet" href="../../assets/css/argon.css?v=1.2.0"
	type="text/css">
</head>
<link rel="stylesheet"
	herf="${pageContext.request.contextPath}/assets/dropzone-4.3.0/dist/dropzone.css">
<title>Insert title here</title>
</head>
<body>
	<form name="memberForm" method="post">
		<!-- Main content -->
		<div class="main-content" id="panel">
			<!-- Topnav -->

			<div class="container-fluid">
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<!-- Search form -->
					<form class="navbar-search navbar-search-light form-inline mr-sm-3"
						id="navbar-search-main">


						</nav>
						<!-- Header -->
						<!-- Header -->

						<!-- Page content -->


						<!-- Card body -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<div class="row align-items-center">

								<h3 class="mb-0">회원 수정</h3>


							</div>
						</div>
						<div class="card-body">
							<h6 class="heading-small text-muted mb-4">* 아래 회원 수정을 작성
								변경해주세요.</h6>
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group flex-column">
											<label class="col-form-label form-control-label">아이디</label>
											<label style="color: tomato">*</label> <input type="hidden"
												name="mem_id" class="form-control"
												value="${MEMBER_LOGININFO.mem_id}" placeholder="Username">
											<input type="text" name="mem_id" class="form-control"
												placeholder="Username" disabled="disabled"
												value="${MEMBER_LOGININFO.mem_id}">
										</div>
										<div class="form-group flex-column">
											<label class="col-form-label form-control-label">이메일</label>
											<label style="color: tomato">*</label> <input type="hidden"
												name="mem_mail" class="form-control"
												value="${MEMBER_LOGININFO.mem_mail}" placeholder="Username">
											<input type="text" name="mem_mail" class="form-control"
												placeholder="Username" disabled="disabled"
												value="${MEMBER_LOGININFO.mem_mail}">
										</div>
									</div>
								</div>
							</div>
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group flex-column">
											<label class="col-form-label form-control-label">비밀번호</label>
											<label style="color: tomato">*</label> <input type="hidden"
												name="mem_id" class="form-control" value=""> <input
												type="password" name="mem_pass" class="form-control"
												value="1234">
										</div>
										<div class="form-group flex-column">
											<label class="col-form-label form-control-label">비밀번호
												확인</label> <label style="color: tomato">*</label> <input
												type="hidden" name="mem_mail" class="form-control" value="">
											<input type="password" name="mem_pass1" class="form-control"
												value="1234">
										</div>
									</div>

								</div>

							</div>


							<!-- 주소  -->

						<div class="pl-lg-4">
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group flex-column">
									<label class="col-form-label form-control-label">주소</label>
											<label style="color: tomato">*</label><br>
										<input type="button" class="btn btn-primary btn-write"
											onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="hidden" class="form-control" name="mem_addr" />
									<div class="input flex-column" style="display:">
										<input type="text" class="form-control" id="addr1"
											name="mem_addr1" placeholder="우편번호" required> 
											<input type="text" class="form-control" name="mem_addr2" id="addr2" placeholder="도로명주소" required> 
											<input type="text" class="form-control" name="mem_addr3" id="addr3" placeholder="지번주소" required>
											 <input type="text" class="form-control" name="mem_addr4" id="addr4" placeholder="나머지 주소" size="6" required>
									</div>
								</div>
							</div>
							<td class="fieldName" width="100px" height="25">생년월일</td> <br>
							<div class="form-group test"
								style="display: flex; justify-content: space-around;">

								<tr>
									<td class="test"><input type="hidden" class=""
										name="mem_bir" />
										<p>년</p> <input type="text" class="form-control"
										name="mem_bir1" value="" />
										<p>월</p> <input type="text" class="form-control"
										name="mem_bir2" value="" />
										<p>일</p> <input type="text" class="form-control"
										name="mem_bir3" value="" /></td>
								</tr>
							</div>
							<div class="pl-lg-4">
								<td class="fieldName" width="100px" height="25">핸드폰</td>
								<div class="col-md-3 mb-3">
									<div class="fdiv class=" form-group
										test" style="display: flex; justify-content: space-around;">
										<tr>
											<td class="test"><input type="hidden" name="mem_tel"
												class="form-control" /> <select name="mem_tel1"
												class="form-control">
													<option value="010">010</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="019">019</option>
											</select> - <input type="text" name="mem_tel2" size="4" value=""
												class="form-control" /> - <input type="text"
												name="mem_tel3" size="4" value="" class="form-control" /></td>
										</tr>
									</div>
								</div>
								<h3>알림 설정</h3>
								<div>
									<label><input type="checkbox" name="mem_notice"
										value="문자메시지"> 문자메시지</label>&nbsp;&nbsp;&nbsp; <label><input
										type="checkbox" name="mem_notice" value="이메일"> 이메일</label>
									<!--      <i class="ni ni-mobile-button"></i>
                      <span>카카오톡 알림</span> 
                <button type="" class="btn-icon-clipboard" data-clipboard-text="email-83" title="Copy to clipboard">
                    <div>
                      <label><input type="checkbox" name="color" value="red"></label>
                      <i class="ni ni-email-83"></i>
                      <span>email 알림</span> -->
								</div>

								<button type="submit" class="btn btn-primary btn-write"
									id="btn3" style="float: right";>등록</button>
							</div>

						</div>
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
		<script
			src="${pageContext.request.contextPath}/assets/vendor/dropzone/dist/min/dropzone.min.js"></script>
		<!-- Argon JS -->
		<script
			src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.2.0"></script>
		<!-- Demo JS - remove this in your project -->
		<script src="${pageContext.request.contextPath}/assets/js/demo.min.js"></script>
</body>

</html>
</body>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
</script>


</html>