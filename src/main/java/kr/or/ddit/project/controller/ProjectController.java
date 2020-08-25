package kr.or.ddit.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.timeline.service.ITimelineService;
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
	
	@Autowired
	private ITimelineService timelineService;
	
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
		List<Map<String, String>> notProjectList = projectService.selectNotProjectListById(params);
		List<Map<String, String>> finishProjectList = projectService.selectFinishProjectListById(params);
		
		modelAndView.addObject("notProjectList", notProjectList);
		modelAndView.addObject("finishProjectList", finishProjectList);
		
		modelAndView.setViewName("user/project/project");
		return modelAndView;
	}
	
	@RequestMapping("project_timeline")
	public ModelAndView project_timeline(ModelAndView modelAndView,
								String mem_id,
								HttpServletRequest request) throws Exception {
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트 관리");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/project_timeline.do");
		modelAndView.addObject("breadcrumb_second", "작업 내역");

		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		
		List<Map<String, String>> projectList = projectService.selectProjectList(params);
		modelAndView.addObject("projectList", projectList);
		
		modelAndView.setViewName("user/project/project_timeline");
		return modelAndView;
	}
	
	@RequestMapping("selectTodo")
	public ModelAndView selectTodo(String project_no,
								   String mem_id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("mem_id", mem_id);
		List<Map<String, String>> todoList = projectService.selectTodo(params);
		
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("todoList", todoList);
		
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
	@RequestMapping("insertTodo")
	public ModelAndView insertTodo(String project_no,
								   String mem_id,
								   String todo_title,
								   String todo_category) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("mem_id", mem_id);
		params.put("todo_title", todo_title);
		params.put("todo_category", todo_category);
		
		String chk = projectService.insertTODO(params);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", chk);
		
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
	@RequestMapping("deleteTodo")
	public ModelAndView deleteTodo(String todo_seq) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("todo_seq", todo_seq);
		int chk = projectService.deleteTodo(params);
		
		ModelAndView modelAndView = new ModelAndView();
		if (chk > 0) {
			modelAndView.addObject("result", "Y");
		} else {
			modelAndView.addObject("result", "N");
		}
		
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
	@RequestMapping("selectTimeline")
	public ModelAndView selectTimeline(String mem_id,
									   String project_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("project_no", project_no);
		List<Map<String, String>> timelineList = timelineService.selectTimelineList(params);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("timelineList", timelineList);
		
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
}
