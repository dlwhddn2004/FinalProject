<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

  <form method="post" id="smsForm">
    <ul>
      <li>보낼사람 : <input type="text" name="from"/>01034242869</li>
      <li>내용 : <textarea name="text">종우형 하요</textarea></li>
      <li><input type="button" onclick="sendSMS('sms')" value="전송하기" /></li>
    </ul>
  </form>

  <script>
    function sendSMS(pageName){

    	console.log("문자를 전송합니다.");
    	$("#smsForm").attr("action", pageName + ".do");
    	$("#smsForm").submit();
    }
  </script>

