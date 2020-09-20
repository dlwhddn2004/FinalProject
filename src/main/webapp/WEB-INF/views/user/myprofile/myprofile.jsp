<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<!-- Sweet Alerts -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/sweetalert2/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css/animate.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function(){




	
	
      function settingDisernNum(){
      	var disernHtml = '<option value="010">010</option>' +
      				    '<option value="011">011</option>' +
      				    '<option value="016">016</option>' +
      				    '<option value="017">017</option>' +
      				    '<option value="018">018</option>' +
      					'<option value="019">019</option>';
      	return disernHtml; 
      	
      }
  	const memhp = settingDisernNum();
		const mem_tel ="${memberInfo.mem_tel}";
		
		$('select[name=mem_tel1]').append(memhp);
		
		$('select[name=mem_tel1]').val("${MemberInfoTel[0]}");
		$('input[name=mem_tel2]').val(${MemberInfoTel[1]});
		$('input[name=mem_tel3]').val(${MemberInfoTel[2]});
	
		
$('form[name=memberForm]')
.submit(
   function() {
      $(this)
            .attr('action',
                  '${pageContext.request.contextPath}/user/myprofile/updateMemberInfo.do');

		$('input[name=mem_tel]').val($('select[name=mem_tel1]').val()+"-"+
				$('input[name=mem_tel2]').val()+"-"+
				$('input[name=mem_tel3]').val());
      
			
		var mem_pass = $('input[name = mem_pass]').val();
		var mem_pass1 = $('input[name = mem_pass1]').val();
		if (mem_pass != mem_pass1) {
			alert('비밀번호를 바르게 입력해주세요.');
			return false;
		}
		if (mem_pass == null) {
			alert('비밀번호를 바르게 입력해주세요.');
			return false;
		}
		if (mem_pass1 == null) {
			alert('비밀번호를 바르게 입력해주세요.');
			return false;
		}
		if (mem_pass == "" && mem_pass1 == "") {
			alert('비밀번호를 바르게 입력해주세요.');
			return false;
		}
		

      var mem_addr = $('input[name=mem_addr1]').val()
            + '-' + $('input[name=mem_addr2]').val()
            + '-' + $('input[name=mem_addr3]').val()
            + '-' + $('input[name=mem_addr4]').val(); 

      $('input[name=mem_addr]').val(mem_addr);
      
     

});   

$('#btn-primary').click(function(){
	

		Swal.fire({
			  title: '정말 탈퇴하시겠습니까?',
			  text: "탈퇴를 클릭하면 되돌릴 수 없습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			  }).then((result) => {
				  if (result.value) {
	$(location).attr('href', '${pageContext.request.contextPath}/user/myprofile/deleteMemberInfo.do?mem_id=${MEMBER_LOGININFO.mem_id }&mem_passs='+$('#mem_passs').val()+'');
				  }
	});
});



}); 

</script>
<style>
.one{
	padding : 0px 0px 80px 0px;
}
</style>
<div class="row">
	<div class="col-md-9">
		<div class="card">
			<div class="card-header">
				<h2>회원 정보 수정</h2>
				<div>
					<small class="text-muted">회원 정보를 수정하거나 관리할 수 있습니다.</small>
				</div>
			</div>
			<div class="card-body">
				<form name=memberForm>
					<div class="col-lg-9">
						<div class="row">
							<div class="col-lg-5">
								<div class="form-group flex-column1">
									<label class="col-form-label form-control-label">아이디</label> <label
										style="color: tomato">*</label> <input type="hidden"
										name="mem_id" class="form-control"
										value="${memberInfo.mem_id}" placeholder="Username"> <input
										type="text" name="mem_id" class="form-control"
										placeholder="Username" disabled="disabled"
										value="${memberInfo.mem_id}">
								</div>
							</div>
							<div class="col-lg-5" style="margin: 0px 0px 0px 120px;">
								<div class="form-group flex-column">
									<label class="col-form-label form-control-label">비밀번호</label> <label
										style="color: tomato">*</label> <input type="password"
										name="mem_pass" class="form-control" id="mem_pass"
										value="${memberInfo.mem_pass}">
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-9">
						<div class="row">
							<div class="col-lg-5">
								<div class="form-group flex-column">
									<label class="col-form-label form-control-label">이메일</label> <label
										style="color: tomato">*</label> <input type="hidden"
										name="mem_mail" class="form-control"
										value="${MEMBER_LOGININFO.mem_mail}" placeholder="Username">
									<input type="text" name="mem_mail" class="form-control"
										placeholder="Username" disabled="disabled"
										value="${MEMBER_LOGININFO.mem_mail}">
								</div>
							</div>
							<div class="col-lg-5" style="margin: 0px 0px 0px 120px;">
								<div class="form-group flex-column">
									<label class="col-form-label form-control-label">비밀번호
										확인</label> <label style="color: tomato">*</label> <input
										type="password" name="mem_pass1"  id= "mem_pass1" class="form-control"
										value="${memberInfo.mem_pass}">
										
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="row">
							<div class="col-lg-5">
								<div class="form-group flex-column">
									<label class="col-form-label form-control-label">이름</label> <label
										style="color: tomato">*</label> <input style="" "type="text"
										class="form-control" id="mem_name" name="mem_name"
										value="${memberInfo.mem_name}" placeholder="">
								</div>
							</div>
							<div class="col-lg-5" style="margin: 0px 0px 0px 120px;">
								<div class="form-group flex-column">
									<label class="col-form-label form-control-label">생년월일</label> <label
										style="color: tomato">*</label> <input
										class="form-control datepicker" value="${memberInfo.mem_bir }"
										placeholder="Select date" type="text" id="today"
										name="mem_bir">

								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="row">
							<div class="col-lg-5">
								<div class="form-group flex-column"
									style="margin: 0px 20px 0px 0px;">
									<label class="col-form-label form-control-label">주소</label> <label
										style="color: tomato">*</label><br> <input type="button"
										class="btn btn-primary btn-write"
										onclick="execPostCode();" value="우편번호 찾기"><br>
									<input type="hidden" class="form-control" name="mem_addr" />
									<div class="form-group flex-column"
										style="display: 10px 0px 0px 0px;">
										<div style="margin: 10px 0px 0px 0px;">
											<input type="text" class="form-control" id="addr1"
												name="mem_addr1" value="${MemberInfoaddr[0]}"
												placeholder="우편번호" required>
										</div>
										<div style="margin: 10px 0px 0px 0px;">
											<input type="text" value="${MemberInfoaddr[1]}"
												class="form-control" name="mem_addr2" id="addr2"
												placeholder="도로명주소" required>
										</div>
										<div style="margin: 10px 0px 0px 0px;">
											<input type="text" class="form-control"
												value="${MemberInfoaddr[2]}" name="mem_addr3" id="addr3"
												placeholder="나머지 주소" required>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-5" style="margin: 0px 0px 0px 120px;">							
									<label class="col-form-label form-control-label">휴대전화</label>
										<label style="color: tomato">*</label>
								<div class="row">
									<div class="col">
									<input type="hidden" name="mem_tel"  class="form-control" />
									<select name="mem_tel1" class="form-control">
												<option >선택하세요</option>
												
												</select>
									</div>
									<div class="col">	
									<input type="text" name="mem_tel2" size="4" class="form-control" />
									</div>
									 <div class="col">
									 		  <input type="text"name="mem_tel3" size="4" class="form-control" />
									 </div>
								</div>
							</div>
							<input type="hidden" name="category_no" value="${memberInfo.category_no}">
						</div>
					</div>

					<div class="row"></div>
					<div style="display: flex; justify-content: flex-end;">
						<button type="submit"
							class="btn btn-outline-primary mt-1 mr-1 mb-1 ml-1">수정</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<div class="col-md-3">
		<div class="card">
			<div class="card-header text-center">
				<small class="text-muted">회원의 기본 프로필 정보입니다.</small>
			</div>
			<!-- Card body -->
			<div class="card-body">
				<a href="#!"> <img src="/${profileInfo1.profile_savename}"
					class="rounded-circle img-center img-fluid shadow shadow-lg--hover"
					style="width: 140px;">
				</a>
				<div class="pt-4 text-center">
					<h5 class="h3 title">
						<span class="d-block mb-1">${MEMBER_LOGININFO.mem_id}</span> 
							
					</h5>
					<button type="button" class="btn btn-outline-danger btn-sm"
						data-toggle="modal" data-target="#modal-form">회원 탈퇴</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- MODAL -->
<div class="row">
	<div class="col-md-4">
		<div class="modal fade" id="modal-form" tabindex="-1" role="dialog"
			aria-labelledby="modal-form" aria-hidden="true">
			<div class="modal-dialog modal- modal-dialog-centered modal-sm"
				role="document">
				<div class="modal-content">
					<div class="modal-body p-0">
						<div class="card bg-secondary border-0 mb-0">
							<div class="card-header bg-transparent text-center">
								<h2 class="text-muted">회원 탈퇴</h2>
								<div class="text-muted text-center">
									<small>회원 탈퇴는 복구가 불가능합니다.</small>
								</div>
							</div>
							<div class="card-body">
								<div class="form-group">
									<small class="text-muted">아이디</small> <input type="text"
										class="form-control" id="mem_id" name="mem_id" value="${MEMBER_LOGININFO.mem_id}" placeholder="ID">
								</div>
								<div class="form-group">
									<small class="text-muted">비밀번호</small> <input  type="password" id="mem_passs" name="mem_passs"
										class="form-control" placeholder="PW">
								</div>
								<div style="display: flex; justify-content: center;">
									<button type="button"  id="btn-primary"  class="btn btn-outline-primary mr-2">탈퇴</button>
									<button type="button" class="btn btn-outline-warning ml-2"
										data-dismiss="modal">취소</button>
								</div>
							</div>
						</div>
					</div>
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
<script
	src="${pageContext.request.contextPath }/assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Argon JS -->
<script
	src="${pageContext.request.contextPath }/assets/js/argon.js?v=1.2.0"></script>
<!-- Demo JS - remove this in your project -->
<script src="${pageContext.request.contextPath }/assets/js/demo.min.js"></script>
 <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
	$(function() {
		

	
	});

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=mem_addr1]").val(data.zonecode);
                $("[name=mem_addr2]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
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