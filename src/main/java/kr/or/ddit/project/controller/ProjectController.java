package kr.or.ddit.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.task.service.ITaskService;
import kr.or.ddit.timeline.service.ITimelineService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_ProjectParticipantsVO;
import kr.or.ddit.vo.newsboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ibatis.sqlmap.engine.mapping.result.ResultMap;
import com.lowagie.text.pdf.AcroFields.Item;

@Controller
@RequestMapping("/user/project/")
public class ProjectController {
	
	@Autowired
	private IProjectService projectService;
	
	@Autowired
	private ITimelineService timelineService;
	
	@Autowired
	private ITaskService taskService;
	
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping("project")
	public ModelAndView project(ModelAndView modelAndView,
								String mem_id,
								HttpServletRequest request) throws Exception {
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트 관리");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/project.do?mem_id=" + mem_id);
		modelAndView.addObject("breadcrumb_second", "프로젝트");

		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		List<Map<String, String>> notProjectList = projectService.selectNotProjectListById(params);
		for (Map<String, String> item : notProjectList) {
			String project_no = String.valueOf(item.get("PROJECT_NO"));
			
			Map<String, String> sendDataMap = new HashMap<String, String>();
			sendDataMap.put("project_no", project_no);
			
			Map<String, String> resultDataMap = taskService.selectAverage(sendDataMap);
			String average = String.valueOf(resultDataMap.get("AVERAGE"));
			item.put("AVERAGE", average);
		}
		
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
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/project_timeline.do?mem_id=" + mem_id);
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
	
	@RequestMapping("projectView")
	public ModelAndView projectView(ModelAndView modelAndView,
								    String mem_id,
								    String project_no,
								    HttpServletRequest request) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		
		Map<String, String> projectInfo = projectService.selectProjectInfo(params);
		
		// 프로젝트 파트너스 이름
		if (projectInfo.get("MEM_ID") != null) {
			params.put("mem_id", String.valueOf(projectInfo.get("MEM_ID")));
			Map<String, String> memberInfo = memberService.selectMemberInfo(params);
			projectInfo.put("PARTNERS_NAME", String.valueOf(memberInfo.get("MEM_NAME")));
		}
		
		// 프로젝트 PL 이름
		if (projectInfo.get("PL") != null) {
			params.put("mem_id", String.valueOf(projectInfo.get("PL")));
			Map<String, String> memberInfo = memberService.selectMemberInfo(params);
			Map<String, String> personAvg = taskService.selectPersonAverage(params);
			projectInfo.put("PL_NAME", String.valueOf(memberInfo.get("MEM_NAME")));
			projectInfo.put("PL_WORKSTATUS", String.valueOf(memberInfo.get("MEM_WORKSTATUS")));
			if (personAvg != null) {
				projectInfo.put("PL_AVG", String.valueOf(personAvg.get("AVERAGE")));
			}
		}
		
		// 프로젝트 TA 이름
		if (projectInfo.get("TA") != null) {
			params.put("mem_id", String.valueOf(projectInfo.get("TA")));
			Map<String, String> memberInfo = memberService.selectMemberInfo(params);
			Map<String, String> personAvg = taskService.selectPersonAverage(params);
			projectInfo.put("TA_NAME", String.valueOf(memberInfo.get("MEM_NAME")));
			projectInfo.put("TA_WORKSTATUS", String.valueOf(memberInfo.get("MEM_WORKSTATUS")));
			if (personAvg != null) {
				projectInfo.put("TA_AVG", String.valueOf(personAvg.get("AVERAGE")));
			}
		}
		
		// 프로젝트 DA 이름
		if (projectInfo.get("DA") != null) {
			params.put("mem_id", String.valueOf(projectInfo.get("DA")));
			Map<String, String> memberInfo = memberService.selectMemberInfo(params);
			Map<String, String> personAvg = taskService.selectPersonAverage(params);
			projectInfo.put("DA_NAME", String.valueOf(memberInfo.get("MEM_NAME")));
			projectInfo.put("DA_WORKSTATUS", String.valueOf(memberInfo.get("MEM_WORKSTATUS")));
			if (personAvg != null) {
				projectInfo.put("DA_AVG", String.valueOf(personAvg.get("AVERAGE")));
			}
		}
		
		// 프로젝트 UA 이름
		if (projectInfo.get("UA") != null) {
			params.put("mem_id", String.valueOf(projectInfo.get("UA")));
			Map<String, String> memberInfo = memberService.selectMemberInfo(params);
			Map<String, String> personAvg = taskService.selectPersonAverage(params);
			projectInfo.put("UA_NAME", String.valueOf(memberInfo.get("MEM_NAME")));
			projectInfo.put("UA_WORKSTATUS", String.valueOf(memberInfo.get("MEM_WORKSTATUS")));
			if (personAvg != null) {
				projectInfo.put("UA_AVG", String.valueOf(personAvg.get("AVERAGE")));
			}
		}
		
		// 프로젝트 AA 이름
		if (projectInfo.get("AA") != null) {
			params.put("mem_id", String.valueOf(projectInfo.get("AA")));
			Map<String, String> memberInfo = memberService.selectMemberInfo(params);
			Map<String, String> personAvg = taskService.selectPersonAverage(params);
			projectInfo.put("AA", String.valueOf(memberInfo.get("MEM_NAME")));
			projectInfo.put("AA_WORKSTATUS", String.valueOf(memberInfo.get("MEM_WORKSTATUS")));
			if (personAvg != null) {
				projectInfo.put("AA_AVG", String.valueOf(personAvg.get("AVERAGE")));
			}
		}
		
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/project.do?mem_id=" + mem_id);
		modelAndView.addObject("breadcrumb_second", "프로젝트 상세 보기");
		
		modelAndView.addObject("projectInfo", projectInfo);
		modelAndView.setViewName("user/project/project_view");
		
		return modelAndView;
	}
	
	@RequestMapping("projectForm")
	public ModelAndView projectForm(HttpServletRequest request,
									ModelAndView modelAndView) throws Exception{
		
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트");
//		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/project.do?mem_id=" + mem_id);
		modelAndView.addObject("breadcrumb_second", "프로젝트 등록");

		modelAndView.setViewName("user/project/projectForm");
		return modelAndView;
	}
}
