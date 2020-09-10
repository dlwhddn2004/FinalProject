package kr.or.ddit.projectsupport;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.projectapplyVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/projectsupport/")
public class projectsupportcontroller {

	@Autowired
	private ObjectMapper Mapper;
	
	@Autowired
	private IProjectService service;
	
	@Autowired
	  private JavaMailSender mailSender;
	
	@RequestMapping("projectsupport")
	public ModelAndView projectsupport(HttpServletRequest request,
			ModelAndView modelAndView, String project_no, String mem_id)throws Exception{
		 Map<String, String> params = new HashMap<String, String>();
		 params.put("project_no", project_no);
		 params.put("mem_id", mem_id);

		 List<projectapplyVO> applyList = null;
		 
		 	try{
		 		applyList = service.applyList(params);
		 		
		 	} catch (Exception e){
		 		e.printStackTrace();
		 	}
		 	
		
		modelAndView.addObject("applyList",applyList);
		modelAndView.setViewName("user/projectsupport/projectsupport");
	
		return modelAndView;
		
		
		
	}
	@RequestMapping("applyupdate")
	public String updateapply(projectapplyVO applyInfo) throws Exception{
		
		this.service.updateapplyInfo(applyInfo);
		
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = URLEncoder.encode("지원 요청 허가 완료.", "UTF-8");
		
		return "redirect:/user/projectsupport/projectsupport1.do?taskResult=" + taskResult + "&message=" + message;
		
		
	}
	
	@RequestMapping("projectsupport1")
	 public ModelAndView projectsupport1(HttpServletRequest request,String project_no,
				ModelAndView modelAndView) throws Exception{
		 Map<String, String> params = new HashMap<String, String>();
		 params.put("project_no", project_no);
		 List<ProjectVO> projectList = null;
		 
		 	try{
		 		projectList = service.projectList(params);
		 		
		 	} catch (Exception e){
		 		e.printStackTrace();
		 	}
		 	
		   
		 	String projectInfo6 = service.projectInfo6(params);
		 	int projectInfo5 = this.service.projectInfo5(params);
		 	modelAndView.addObject("breadcrumb_title", "프로젝트");
			modelAndView.addObject("breadcrumb_first", "프로젝트 찾기");
			modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/projectsearch/projectsearch.do");
		
		
			for (ProjectVO item : projectList) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("project_no", item.getProject_no());
				
				int cnt = service.projectInfo5(map);		 		 				 		
				item.setProject_applyCnt(String.valueOf(cnt));
				
				String remainDate = service.projectInfo6(map);
				item.setProject_time(String.valueOf(remainDate));
				
				if (item.getProject_technologies().equals("1")) {
					item.setTech_name("ANGULAR");
				} else if (item.getProject_technologies().equals("2")) {
					item.setTech_name("BOOTSTRAP");
				} else if (item.getProject_technologies().equals("3")) {
					item.setTech_name("REACT");
				} else if (item.getProject_technologies().equals("4")) {
					item.setTech_name("VUE");
				}
			}
				
			modelAndView.addObject("projectInfo6", projectInfo6);
		 	modelAndView.addObject("projectInfo5", projectInfo5);
		 	modelAndView.addObject("projectList", projectList);
		 	
	 	
		 	modelAndView.setViewName("user/projectsupport/projectsupport1");
					 	
			return modelAndView;
		 				 		 		 
	 }
	 @RequestMapping("mailForm")
	  public ModelAndView mailForm(ModelAndView modelAndView) {
		 String sResult = "OK"; 
	     String imsinum = "36987456321"; 
	     try{ String st = "kye803112@gmail.com"; 
	   String sbj = "커넥터에서 지원 요청입니다.";
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
		 
	     
		 modelAndView.setViewName("user/portfolio/portfolioList");
		 
		 return modelAndView;
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
	   
	    return "redirect:/user/projectsupport/mailForm.do";
	  }
	
	  
}
