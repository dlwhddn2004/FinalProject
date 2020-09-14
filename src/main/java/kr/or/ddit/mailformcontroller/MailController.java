package kr.or.ddit.mailformcontroller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
 

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
@RequestMapping("/user/mailForm/")
public class MailController {
 
	@Autowired
	private ObjectMapper Mapper;
	
  @Autowired
  private JavaMailSender mailSender;
 
 
  // mailForm
  @RequestMapping("mailForm")
  public String mailForm() {
   
	 return "redirect:/user/mailForm/mailForm.do";
  }  
 
  // mailSending 코드
  @RequestMapping("mailSending")
  public String mailSending(HttpServletRequest request) {
   
    String setfrom = "ejrsus2869@gmail.com";         
    String tomail  = request.getParameter("kye803112@gmail.com");     // 받는 사람 이메일
    String title   = request.getParameter("안녕");      // 제목
    String content = request.getParameter("하세요");    // 내용
   
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper 
                        = new MimeMessageHelper(message, true, "UTF-8");
 
      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
      messageHelper.setTo(tomail);     // 받는사람 이메일
      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
      messageHelper.setText(content);  // 메일 내용
     
      mailSender.send(message);
    } catch(Exception e){
      System.out.println(e);
    }
   
    return "redirect:/user/mail/mailForm.do";
  }
} 