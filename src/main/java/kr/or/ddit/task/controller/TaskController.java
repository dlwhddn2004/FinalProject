package kr.or.ddit.task.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.successboard.service.ISuccessBoardService;
import kr.or.ddit.task.service.ITaskService;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;
import kr.or.ddit.vo.newsboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/task/")
public class TaskController {
	@Autowired
	private IProjectService projectService;
	
	@Autowired
	private ITaskService taskService;
	
	@RequestMapping("task")
	public ModelAndView taskList(HttpServletRequest request,
								 ModelAndView modelAndView,
								 String mem_id) throws Exception {
		
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트 관리");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/task/task.do?mem_id=" + mem_id);
		modelAndView.addObject("breadcrumb_second", "일감");
		
		modelAndView.setViewName("user/project/task");
		return modelAndView;
	}
	
	@RequestMapping("selectNotProjectList")
	public ModelAndView selectNotProjectList(String mem_id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		
		List<Map<String, String>> notProjectList = projectService.selectNotProjectListById(params);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("notProjectList", notProjectList);
		
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
	@RequestMapping("selectProjectInfo")
	public ModelAndView selectProjectInfo(String project_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		Map<String, String> projectInfo = projectService.selectProjectInfo(params);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("projectInfo", projectInfo);
		
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
	@RequestMapping("selectTaskList")
	public ModelAndView selectTaskList(String project_no,
									   String mem_id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("mem_id", mem_id);
		List<Map<String, String>> taskList = taskService.selectTaskList(params);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("taskList", taskList);
		
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
}
