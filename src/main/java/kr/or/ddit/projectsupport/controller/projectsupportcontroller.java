package kr.or.ddit.projectsupport.controller;

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
import kr.or.ddit.projectsupport.service.IProjectSupportService;
import kr.or.ddit.utiles.Coolsms;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.projectapplyVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
	private IProjectSupportService projectSupportService;
	
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
	public ModelAndView mailForm(ModelAndView modelAndView) throws Exception {
		projectSupportService.sendMail("iai6203@gmail.com", "CONNECTOR 인증 메일 입니다.", "테스트 이메일입니다.");
		
		modelAndView.setViewName("user/portfolio/portfolioList");

		return modelAndView;
	}
	  @RequestMapping("sms")
	  public String sendSms(HttpServletRequest request) throws Exception {

	    String api_key = "";
	    String api_secret = "";
	    Coolsms coolsms = new Coolsms(api_key, api_secret);

	    HashMap<String, String> set = new HashMap<String, String>();
	    set.put("to", "01024996002"); // 수신번호

	    set.put("from", (String)request.getParameter("from")); // 발신번호
	    set.put("text", (String)request.getParameter("text")); // 문자내용
	    set.put("type", "sms"); // 문자 타입

	    System.out.println(set);

	    JSONObject result = coolsms.send(set);

	    if ((boolean)result.get("status") == true) {
	      // 메시지 보내기 성공 및 전송결과 출력
	      System.out.println("성공");

	      System.out.println(result.get("result_code")); // 결과코드
	      System.out.println(result.get("result_message")); // 결과 메시지
	      System.out.println(result.get("success_count")); // 메시지아이디
	      System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	    } else {
	      // 메시지 보내기 실패
	      System.out.println("실패");
	      System.out.println(result.get("code")); // REST API 에러코드
	      System.out.println(result.get("message")); // 에러메시지
	    }

	    return "redirect:/user/projectsupport/projectsupport1.do";
	  }
	  
	  
}