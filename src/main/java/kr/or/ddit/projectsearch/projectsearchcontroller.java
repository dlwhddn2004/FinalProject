package kr.or.ddit.projectsearch;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.mypage.developer.service.IMypageService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.vo.Mypage_memberVO;
import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.ProjectVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sun.print.resources.serviceui;

@Controller
@RequestMapping("/user/projectsearch/")
public class projectsearchcontroller {

	@Autowired
	private ObjectMapper Mapper;
	
	@Autowired
	private IProjectService service;
	
	@Autowired
	private IMypageService mypageservice;
	
	@Autowired
	private IProfileFileService profileservice;
	 
	 @RequestMapping("projectsearch")
	 public ModelAndView projectList(HttpServletRequest request,
				ModelAndView modelAndView) throws Exception{
		 
		 List<ProjectVO> projectList = null;
		 	try{
		 		projectList = service.projectList();
		 		
		 	} catch (Exception e){
		 		e.printStackTrace();
		 	}
		 	 
			
		 	modelAndView.addObject("projectList", projectList);
		 	modelAndView.setViewName("user/projectsearch/projectsearch");
					 	
			return modelAndView;
		 				 		 		 
	 }
	 
	 @RequestMapping("projectview")
	 public ModelAndView projectview(ModelAndView modelAndView, String mem_id,
			 										String project_no) throws Exception{
		 Map<String, String> params = new HashMap<String, String>();
		
		 params.put("project_no", project_no);
		 params.put("mem_id", mem_id);
		 
		 
		 ProfileFileVO profileInfo = profileservice.selectProfileFileInfo(params);
		 ProjectVO projectInfo = service.projectInfo(params);
		 int projectInfo1 = this.service.projectInfo1(params);
		int projectInfo2 = this.service.projectInfo2(params);
		int projectInfo3 = this.service.projectInfo3(params);
		int projectInfo4 = this.service.projectInfo4(params);
	
		
		 modelAndView.addObject("profileInfo", profileInfo);
		 modelAndView.addObject("projectInfo", projectInfo);
		 modelAndView.addObject("projectInfo1", projectInfo1);
		 modelAndView.addObject("projectInfo2", projectInfo2);
		 modelAndView.addObject("projectInfo3", projectInfo3);
		 modelAndView.addObject("projectInfo4", projectInfo4);
		
		 modelAndView.setViewName("user/projectsearch/projectview");
		 
		 
		
		 return modelAndView;
		 
		 
		 
	 }
		 
	 
}
