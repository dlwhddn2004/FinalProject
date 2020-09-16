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
		 	
		 	projectSupportService.sendMail("iai6203@gmail.com", "CONNECTOR입니다.", "안녕하세요 커넥터 입니다 귀하의 지원 신청을 수락 하였습니다 다음주부터 당장 나오세요.");
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
	public String mailForm() throws Exception {
		projectSupportService.sendMail("iai6203@gmail.com", "CONNECTOR 인증 메일 입니다.", "테스트 이메일입니다.");
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = URLEncoder.encode("메일 전송 완료.", "UTF-8");

		return "redirect:/user/portfolio/portfolioList.do?taskResult=" + taskResult + "&message=" + message;
	}
	  @RequestMapping("sms1")
	  public String sendSms() throws Exception {
		  projectSupportService.sendMail("iai6203@gmail.com", "CONNECTOR 인증 메일 입니다.", "테스트 이메일입니다.");
		  projectSupportService.sms("01053756203", "안녕하세요 (주)에이투엠에서 김재석님의 포트폴리오를 확인하고 지원 요청을 하였습니다.");
		  String taskResult = null;
			String message = null;
			taskResult = "success";
			message = URLEncoder.encode("지원 요청 완료.", "UTF-8");
		  
	    return "redirect:/user/portfolio/portfolioList.do?taskResult=" + taskResult + "&message=" + message;
	  }
	  
	
	  
}
