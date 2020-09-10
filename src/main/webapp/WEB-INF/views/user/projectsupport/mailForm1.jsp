 <%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" errorPage="/errFolder/errPage.jsp" %>
  <%@ page import="javax.mail.*" %>
   <%@ page import="javax.mail.internet.*" %> 
   <%@page import="javax.mail.Authenticator" %> 
   <%@page import="javax.mail.PasswordAuthentication" %>
    <%@page import="java.util.Properties" %>
     <% // 받아온 변수...
     String sResult = "OK"; 
     String imsinum = "36987456321"; 
     try{ String st = "kye803112@gmail.com"; 
   String sbj = "이메일 테스트 인증번호입니다.";
   String sf = "kye803112@gmail.com";
   // 보내는 사람(인증 정보와 동일한 email 주소여야 함!!)
   String sMsg = "안녕하세요 커넥터입니다 포토폴리오를보고 연락드렸습니다 "; 
   Properties p = new Properties();
   // 정보를 담을 객체
   p.put("mail.smtp.user", "fromMan@gmail.com");
   p.put("mail.smtp.host", "smtp.gmail.com");
   p.put("mail.smtp.port", "465");
   p.put("mail.smtp.starttls.enable","true");
   // 반드시 true 
   p.put("mail.smtp.auth", "true");
   p.put("mail.smtp.debug", "true");
   p.put("mail.smtp.socketFactory.port", "465"); 
   p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
   p.put("mail.smtp.socketFactory.fallback", "false");
   // SMTP 서버에 접속하기 위한 정보들
   System.out.println(3333333);
   //Get the Session object.
   try { Session mailSession = Session.getInstance
   (p, new javax.mail.Authenticator()
   { protected PasswordAuthentication getPasswordAuthentication() 
   { return new PasswordAuthentication("ejrsus2869","ejrejr1234!"); 
   // gmail 메일 ID / PWD 
   } }); mailSession.setDebug(true); 
   // Create a default MimeMessage object.
   Message message = new MimeMessage(mailSession); 
   // Set From: header field of the header.
   message.setFrom(new InternetAddress(sf)); 
   // Set To: header field of the header.
   message.addRecipient(Message.RecipientType.TO, new InternetAddress(st)); 
   // Set Subject: header field 
   message.setSubject(sbj);
   // Now set the actual message 
   message.setContent(sMsg, "text/html;charset=utf-8");
   // 내용과 인코딩 // Send message 
   Transport.send(message); 
   // System.out.println("Sent message successfully....");
   // sResult = "Sent message successfully....";
   } 
   catch (MessagingException e) { e.printStackTrace(); 
   System.out.println("Error: unable to send message...." + e.toString()); sResult = "ERR"; 
   } 
   }catch (Exception err){
	   System.out.println(err.toString()); sResult = "ERR"; }finally { 
		   // dbhandle.close(dbhandle.con); 
		   } 
		   %> 
		   <% out.clear(); %><%=sResult%>

