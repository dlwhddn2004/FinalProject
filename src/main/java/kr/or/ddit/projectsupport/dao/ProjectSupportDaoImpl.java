package kr.or.ddit.projectsupport.dao;

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

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;
import kr.or.ddit.vo.newsboardVO;

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
}