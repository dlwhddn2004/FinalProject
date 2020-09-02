package kr.or.ddit.projectsearch;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
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
	 public void projectview(){}
		 
	 
}
