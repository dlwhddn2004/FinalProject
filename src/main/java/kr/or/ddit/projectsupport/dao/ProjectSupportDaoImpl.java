package kr.or.ddit.projectsupport.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.utiles.Coolsms;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;
import kr.or.ddit.vo.newsboardVO;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.lowagie.text.Paragraph;

@Repository
public class ProjectSupportDaoImpl implements IProjectSupportDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public String sendMail(String to, String title, String content) throws Exception {
		String sResult = "OK";
		
		try {
			String st = to;
			String sbj = title;
			String sf = to;
			// 보내는 사람(인증 정보와 동일한 email 주소여야 함!!)
			String sMsg = content;
			Properties p = new Properties();
			// 정보를 담을 객체
			p.put("mail.smtp.user", "fromMan@gmail.com");
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			// 반드시 true
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class",
					"javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			// SMTP 서버에 접속하기 위한 정보들
			System.out.println(3333333);
			// Get the Session object.
			try {
				Session mailSession = Session.getInstance(p,
						new javax.mail.Authenticator() {
							protected PasswordAuthentication getPasswordAuthentication() {
								return new PasswordAuthentication("ejrsus2869",
										"ejrejr1234!");
								// gmail 메일 ID / PWD
							}
						});
				mailSession.setDebug(true);
				// Create a default MimeMessage object.
				Message message = new MimeMessage(mailSession);
				// Set From: header field of the header.
				message.setFrom(new InternetAddress(sf));
				// Set To: header field of the header.
				message.addRecipient(Message.RecipientType.TO,
						new InternetAddress(st));
				// Set Subject: header field
				message.setSubject(sbj);
				// Now set the actual message
				message.setContent(sMsg, "text/html;charset=utf-8");
				// 내용과 인코딩 // Send message
				Transport.send(message);
				// System.out.println("Sent message successfully....");
				// sResult = "Sent message successfully....";
			} catch (MessagingException e) {
				e.printStackTrace();
				System.out.println("Error: unable to send message...."
						+ e.toString());
				sResult = "ERR";
			}
		} catch (Exception err) {
			System.out.println(err.toString());
			sResult = "ERR";
		} finally {
			// dbhandle.close(dbhandle.con);
		}

		return sResult;
	}

	@Override
	public int generateRandNum(int length) throws Exception {
		Random rand = new Random();
		String randNumStr = "";
		
		for (int i = 0; i < length; i++) {
			randNumStr += Integer.toString(rand.nextInt(10));
		}
		
		return Integer.parseInt(randNumStr);
	}

	@Override
	public String sms(String to, String text) throws Exception {
		
		
		String sms2 = to;
		String sms3 = text;
		
		String api_key = "NCSNNCABDGNX72H3";
	    String api_secret = "KOPJ8ANQPMQGT6TPBJVWJUVDPMBQBYJV";
	    Coolsms coolsms = new Coolsms(api_key, api_secret);

	    HashMap<String, String> set = new HashMap<String, String>();
	    set.put("to", to); // 수신번호

	    set.put("from", "01034242869"); // 발신번호
	    set.put("text", sms3); // 문자내용
	    set.put("type", "sms"); // 문자 타입

	    JSONObject result = coolsms.send(set);

	    if ((boolean)result.get("status") == true) {
	      // 메시지 보내기 성공 및 전송결과 출력
	      System.out.println("성공");
	      System.out.println(result.get("result_code")); // 결과코드
	      System.out.println(result.get("result_message")); // 결과 메시지
	      System.out.println(result.get("success_count")); // 메시지아이디
	      System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	      return "성공";

	    } else {
	      // 메시지 보내기 실패
	    	System.out.println("실패");
	    	System.out.println(result.get("code")); // REST API 에러코드
	    	System.out.println(result.get("message")); // 에러메시지
	    	return "실패"; 
	    }

	  }
	  
}