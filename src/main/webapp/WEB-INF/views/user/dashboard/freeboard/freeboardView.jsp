<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 정보</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
<style type="text/css">
.carousel{
	width:200px;
    height:150px;
    margin-left: 200px;
}
.carousel-inner > .item > img{
    width:200px;
    height:150px;
}       
</style>
<script type="text/javascript">
	$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#bo_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
	$('#bo_title').val('${freeboardInfo.bo_title}');
	$('#bo_nickname').val('${freeboardInfo.bo_nickname}');
	$('#bo_pwd').val('${freeboardInfo.bo_pwd}');
	$('#bo_mail').val('${freeboardInfo.bo_mail}');
	$('#bo_content').summernote('code', '${freeboardInfo.bo_content}');
	
	if (${LOGIN_MEMBERINFO.mem_id != freeboardInfo.bo_writer}) {
		$('.freeboard-form input[name=bo_title]').attr('disabled', 'disabled');
		$('.freeboard-form input[name=bo_nickname]').attr('disabled', 'disabled');
		$('.freeboard-form input[name=bo_pwd]').attr('disabled', 'disabled');
		$('.freeboard-form input[name=bo_mail]').attr('disabled', 'disabled');
		$('#bo_content').summernote('disable');
	}
    	//목록
		$('.btn-back').on('click',function(){
			$(location).attr('href','${pageContext.request.contextPath}/user/freeboard/freeboardList.do');		
		});
		
		//수정
		$('.btn-modify').on('click',function(){
			const bo_title = $('input[name=bo_title]').val();
			const bo_nickname = $('input[name=bo_nickname]').val();
			const bo_pwd = $('input[name=bo_pwd]').val();
			const bo_mail = $('input[name=bo_mail]').val();
			const bo_content = $('#bo_content').summernote('code');
			
	    	if (bo_title === "" | bo_nickname === "" | bo_pwd === "" | bo_mail === "" | bo_content === "") {
	    		BootstrapDialog.show({
	                title: '알림',
	                message: '비어있는 항목이 있습니다.'
	            });
	    		return false;
			}
			const $form = $('.freeboard-form');
			const $no =$("<input type='hidden' name='bo_no' value='${freeboardInfo.bo_no}' />");
			const $content = $("<input type='hidden' name='bo_content' value='" + bo_content + "'/>");
			
			$form.append($no);
			$form.append($content);
			
		});
		//답글
		$('.btn-write').on('click',function(){
			if(${empty LOGIN_MEMBERINFO}){
				BootstrapDialog.show({
	                title: '알림',
	                message: '답글은 로그인 후 이용할 수 있습니다.'
	            });
				return false;
			}
			const bo_title = encodeURIComponent('${freeboardInfo.bo_title}');	
			const queryString = '?r=${r}&bo_title='+bo_title;
			const parentInfo = '&bo_group=${freeboardInfo.bo_group}&bo_seq=${freeboardInfo.bo_seq}&bo_depth=${freeboardInfo.bo_depth}&bo_writer=${freeboardInfo.bo_writer}';
			
			$(location).attr('href','${pageContext.request.contextPath}/user/freeboard/freeboardReplyForm.do'+queryString +parentInfo);
		});
		
		
		// 삭제
		$('.btn-delete').on('click',function(){
			const bo_no= '${freeboardInfo.bo_no}';
			$(location).attr('href','${pageContext.request.contextPath}/user/freeboard/deleteFreeboard/${freeboardInfo.bo_no}.do');
		});
		
		$('.temptemp').before('<a href="${pageContext.request.contextPath}/user/freeboard/freeboardList.do">자유게시판</a>&nbsp;&nbsp;');
		
		
		$('.temp2').before('<a href="${pageContext.request.contextPath}/user/freeboard/freeboardList.do">목록</a>&nbsp;&nbsp;');
		
		
	});
</script>
</head>
<body>
<form class="form-horizontal freeboard-form" role="form" action="${pageContext.request.contextPath}/user/freeboard/updateFreeboard.do"
 method="post">
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
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="bo_content">첨부파일:</label> -->
<!-- 		<div id="myCarousel" class="carousel slide" data-ride="carousel"> -->
<!-- 			<!-- Indicators --> -->
<!-- 			<ol class="carousel-indicators"> -->
<!-- 				<li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!-- 				<li data-target="#myCarousel" data-slide-to="1"></li> -->
<!-- 				<li data-target="#myCarousel" data-slide-to="2"></li> -->
<!-- 				<li data-target="#myCarousel" data-slide-to="3"></li> -->
<!-- 			</ol> -->
	
<!-- 			<!-- Wrapper for slides --> -->
<!-- 			<div class="carousel-inner" role="listbox" style="height: 200px;"> -->
<!-- 				<div class="item active"> -->
<%-- 					<img src="${pageContext.request.contextPath }/images/thumbs/arch-1.jpg" alt="pic1"> --%>
<!-- 				</div> -->
		
<!-- 				<div class="item"> -->
<%-- 					<img src="${pageContext.request.contextPath }/images/thumbs/arch-2.jpg" alt="pic2"> --%>
<!-- 				</div> -->
		
<!-- 				<div class="item"> -->
<%-- 					<img src="${pageContext.request.contextPath }/images/thumbs/autumn-1.jpg" alt="pic3"> --%>
<!-- 				</div> -->
		
<!-- 				<div class="item"> -->
<%-- 					<img src="${pageContext.request.contextPath }/images/thumbs/boats-1.jpg" alt="pic4"> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<!-- Left and right controls --> -->
<!-- 			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a> -->
<!-- 			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a> -->
<!-- 		</div> -->
<!-- 	</div> -->

	<c:if test="${!empty freeboardInfo.items }">
		<div class="form-group">
			<label class="control-label col-sm-2" for="lb_content">첨부파일:</label>
			<div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-left: 265px">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<c:forEach items="${freeboardInfo.items}" var="fileitemInfo" varStatus="stat">
	                    <c:if test="${!empty freeboardInfo.items && stat.first}">
	                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	                    </c:if>
	                    <c:if test="${!empty freeboardInfo.items && !stat.first}">
	                        <li data-target="#myCarousel" data-slide-to="${stat.index}"></li>
	                    </c:if>
	                </c:forEach>
				</ol>
		
				<!-- Wrapper for slides -->
	            <div class="carousel-inner" role="listbox" style="height: 200px;">
	                <c:forEach items="${freeboardInfo.items}" var="fileitemInfo" varStatus="stat">
	                    <c:if test="${!empty freeboardInfo.items && stat.first}">
	                        <div class="item active">
	                    </c:if>
	                    <c:if test="${!empty freeboardInfo.items && !stat.first}">
	                        <div class="item">
	                    </c:if>
	                            <img src="/files/${fileitemInfo.file_save_name}" onclick="javascript:location.href='${pageContext.request.contextPath}/user/freeboard/fileDownload.do?file_seq=${fileitemInfo.file_seq}';">
	                        </div>
	                </c:forEach>
	                </div>
	                <!-- Left and right controls -->
	                <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
	                <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
	            </div>
		</div>
	</c:if>


	<div class="form-group freeboardView-btnArea"> 
		<div class="col-sm-offset-2 col-sm-10">
			<c:if test="${LOGIN_MEMBERINFO.mem_id == freeboardInfo.bo_writer }">
				<button type="button" class="btn btn-danger btn-delete">삭제</button>
			</c:if>
			<button type="button" class="btn btn-primary btn-write">답글</button>
			<button type="button" class="btn btn-info btn-back">목록</button>
			<c:if test="${LOGIN_MEMBERINFO.mem_id == freeboardInfo.bo_writer }">
				<button type="submit" class="btn btn-default btn-modify" style="float: right">수정</button>
			</c:if>
		</div>
	</div>
</form>
</body>
</html>