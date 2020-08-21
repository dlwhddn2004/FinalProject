package kr.or.ddit.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_ProjectParticipantsVO;
import kr.or.ddit.vo.newsboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/project/")
public class ProjectController {
	
	@Autowired
	private IProjectService projectService;
	
	@RequestMapping("project")
	public ModelAndView project(ModelAndView modelAndView,
								String mem_id,
								HttpServletRequest request) throws Exception {
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트 관리");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/project.do");
		modelAndView.addObject("breadcrumb_second", "프로젝트");

		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		List<Map<String, String>> projectList = projectService.selectProjectListById(params);
		
		modelAndView.addObject("projectList", projectList);
		
		modelAndView.setViewName("user/project/project");
		return modelAndView;
	}
	
}
