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
	 public ModelAndView projectList(HttpServletRequest request,String project_no,
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
		 	
	 	
		 	modelAndView.setViewName("user/projectsearch/projectsearch");
					 	
			return modelAndView;
		 				 		 		 
	 }
	 
	 @RequestMapping("projectview")
	 public ModelAndView projectview(ModelAndView modelAndView, String mem_id,
			 										String project_no,HttpServletRequest request) throws Exception{
		 Map<String, String> params = new HashMap<String, String>();
		
		 params.put("project_no", project_no);
		 params.put("mem_id", mem_id);
		 
		 
		 ProfileFileVO profileInfo = profileservice.selectProfileFileInfo(params);
		 ProjectVO projectInfo = service.projectInfo(params);
		 int projectInfo1 = this.service.projectInfo1(params);
		int projectInfo2 = this.service.projectInfo2(params);
		int projectInfo3 = this.service.projectInfo3(params);
		int projectInfo4 = this.service.projectInfo4(params);
		
		if (projectInfo.getProject_technologies().equals("1")) {
			projectInfo.setTech_name("ANGULAR");
		} else if (projectInfo.getProject_technologies().equals("2")) {
			projectInfo.setTech_name("BOOTSTRAP");
		} else if (projectInfo.getProject_technologies().equals("3")) {
			projectInfo.setTech_name("REACT");
		} else if (projectInfo.getProject_technologies().equals("4")) {
			projectInfo.setTech_name("VUE");
		}
	
		 modelAndView.addObject("breadcrumb_title", "프로젝트");
		 modelAndView.addObject("breadcrumb_first", "프로젝트 상세보기");
	 	 modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/projectsearch/projectview.do");
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
