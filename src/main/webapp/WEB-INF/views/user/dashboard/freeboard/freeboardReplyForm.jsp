<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 댓글등록</title>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#bo_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    $('.freeboardReplayForm button[type=submit]').on('click',function(){
    	const $form = $('.freeboardReplayForm');
    	
    	const bo_content = $('#bo_content').summernote('code');
    	
    	alert(bo_content);
    	const $bo_writer = $('<input type="hidden" name="bo_writer" value="${LOGIN_MEMBERINFO.mem_id}" /> ');
    	const $bo_seq = $('<input type="hiddden"  name="bo_seq" value="${rfFreeboardInfo.bo_seq}" />');
    	const $bo_group =$('<input type="hidden" name="bo_group" value="${rfFreeboardInfo.bo_group}" />');
    	const $bo_depth =$('<input type="hidden" name="bo_depth" value="${rfFreeboardInfo.bo_depth}" /> ');
    	const $bo_content= $('<input type="hidden" name="bo_content" value="'+ bo_content  + '" />');
    	
    	$form.append($bo_writer);
    	$form.append($bo_seq);
    	$form.append($bo_group);
    	$form.append($bo_depth);
    	$form.append($bo_content);
    	
    });
    
    $('#list-btn').on('click',function(){
    	location.href="${pageContext.request.contextPath}/user/freeboard/freeboardList.do";
    });
    
});
</script>
</head>
<body>
<div class="row">
	 <div class="col-sm-3">
		 <label class="col-sm-2 control-label">No :</label>
  		 <p class="form-control-static">${rfFreeboardInfo.r}</p>
	 </div>
	 <div class="col-sm-8">
	 	<label class="col-sm-2 control-label">제목 :</label>
    	<p class="form-control-static">${rfFreeboardInfo.bo_title }</p>
	 </div>
	 <div class="col-sm-1">
	 	<p class="text-right text-danger bg-danger">${rfFreeboardInfo.bo_writer}의 댓글</p>
	 </div>
</div>
<hr />
<form class="form-horizontal freeboardReplayForm" role="form" action="${pageContext.request.contextPath }/user/freeboard/insertFreeboardReply.do" method="post" >
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="bo_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_nickname" name="bo_nickname" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="bo_pwd" name="bo_pwd" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="bo_mail" name="bo_mail" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_content"><p></p></div>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-success" style="float: right;">답글등록</button>
			<button type="reset" class="btn btn-danger">취소</button>
			<button type="button" class="btn btn-info" id="list-btn">목록</button>
		</div>
	</div>
</form>
</body>
</html>