package kr.or.ddit.task.controller;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.successboard.service.ISuccessBoardService;
import kr.or.ddit.task.service.ITaskService;
import kr.or.ddit.timeline.service.ITimelineService;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;
import kr.or.ddit.vo.newsboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lowagie.text.pdf.AcroFields.Item;

@Controller
@RequestMapping("/user/task/")
public class TaskController {
	@Autowired
	private IProjectService projectService;
	
	@Autowired
	private ITaskService taskService;
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private ITimelineService timelineService;
	
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
		}
		
		// 프로젝트 TA 이름
		if (projectInfo.get("TA") != null) {
			params.put("mem_id", String.valueOf(projectInfo.get("TA")));
			Map<String, String> memberInfo = memberService.selectMemberInfo(params);
			Map<String, String> personAvg = taskService.selectPersonAverage(params);
			projectInfo.put("TA_NAME", String.valueOf(memberInfo.get("MEM_NAME")));
		}
		
		// 프로젝트 DA 이름
		if (projectInfo.get("DA") != null) {
			params.put("mem_id", String.valueOf(projectInfo.get("DA")));
			Map<String, String> memberInfo = memberService.selectMemberInfo(params);
			Map<String, String> personAvg = taskService.selectPersonAverage(params);
			projectInfo.put("DA_NAME", String.valueOf(memberInfo.get("MEM_NAME")));
		}
		
		// 프로젝트 UA 이름
		if (projectInfo.get("UA") != null) {
			params.put("mem_id", String.valueOf(projectInfo.get("UA")));
			Map<String, String> memberInfo = memberService.selectMemberInfo(params);
			Map<String, String> personAvg = taskService.selectPersonAverage(params);
			projectInfo.put("UA_NAME", String.valueOf(memberInfo.get("MEM_NAME")));
		}
		
		// 프로젝트 AA 이름
		if (projectInfo.get("AA") != null) {
			params.put("mem_id", String.valueOf(projectInfo.get("AA")));
			Map<String, String> memberInfo = memberService.selectMemberInfo(params);
			Map<String, String> personAvg = taskService.selectPersonAverage(params);
			projectInfo.put("AA_NAME", String.valueOf(memberInfo.get("MEM_NAME")));
		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("projectInfo", projectInfo);
		
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
	@RequestMapping("selectTaskList")
	public ModelAndView selectTaskList(String project_no,
									   String mem_id,
									   String function_status,
									   String function_name,
									   String function_manager,
									   String chkbox_status) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("mem_id", mem_id);
		params.put("function_status", function_status);
		params.put("chkbox_status", chkbox_status);
		params.put("function_name", function_name);
		params.put("function_manager", function_manager);
		List<Map<String, String>> taskList = taskService.selectTaskList(params);
		
		for (Map<String, String> item : taskList) {
			params.put("mem_id", String.valueOf(item.get("FUNCTION_MANAGER")));
			Map<String, String> resultMap = memberService.selectMemberInfo(params);
			item.put("MEM_NAME", String.valueOf(resultMap.get("MEM_NAME")));
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("taskList", taskList);
		
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
	@RequestMapping("insertTask")
	@ResponseBody
	public Map<String, String> insertTask(String project_no,
										  String function_name,
										  String function_manager,
										  String function_progress,
										  String function_regdate,
										  String function_enddate,
									  	  String function_status,
										  String function_priority) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("function_name", function_name);
		params.put("function_manager", function_manager);
		params.put("function_progress", function_progress);
		params.put("function_regdate", function_regdate);
		params.put("function_enddate", function_enddate);
		params.put("function_status", function_status);
		params.put("function_priority", function_priority);
		String project_function_no = taskService.insertTask(params);
		
		// 타임라인에 등록!
		Date nowDate = new Date();
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		
		params.put("mem_id", function_manager);
		params.put("timeline_title", "새로운 기능 배정");
		params.put("timeline_tag", "NEW,FUNCTION");
		params.put("timeline_content",  format.format(nowDate) + "에 " + function_manager + "에게 새로운 기능이 배정되었습니다.");
		params.put("timeline_category",  "Y");
		timelineService.insertTimeline(params);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("project_function_no", project_function_no);
		
		return resultMap;
	}
	
	@RequestMapping("updateTask")
	@ResponseBody
	public Map<String, String> updateTask(String project_function_no,
										  String project_no,
										  String function_name,
										  String function_manager,
										  String function_progress,
										  String function_regdate,
										  String function_enddate,
									  	  String function_status,
										  String function_priority) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_function_no", project_function_no);
		params.put("project_no", project_no);
		params.put("function_name", function_name);
		params.put("function_manager", function_manager);
		params.put("function_progress", function_progress);
		params.put("function_regdate", function_regdate);
		params.put("function_enddate", function_enddate);
		params.put("function_status", function_status);
		params.put("function_priority", function_priority);
		int chk = taskService.updateTask(params);
		
		// 타임라인에 등록!
		Date nowDate = new Date();
		System.out.println("가공 전 날짜 : " + nowDate);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("가공 후 날짜 : " + format.format(nowDate));
		
		if (function_progress.equals("100") && function_status.equals("완료")) {
			params.put("mem_id", function_manager);
			params.put("timeline_title", "기능 구현 완료");
			params.put("timeline_tag", "SUCCESS,FUNCTION");
			params.put("timeline_content",  format.format(nowDate) + "에  " + function_manager + "에게 배정된 기능이 완료되었습니다.");
			params.put("timeline_category",  "Y");
		} else {
			params.put("mem_id", function_manager);
			params.put("timeline_title", "기능 수정");
			params.put("timeline_tag", "UPDATE,FUNCTION");
			params.put("timeline_content",  format.format(nowDate) + "에 기능이 수정되었습니다.");
			params.put("timeline_category",  "Y");
		}
		timelineService.insertTimeline(params);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		if (chk > 0) {
			resultMap.put("result", "Y");
		} else {
			resultMap.put("result", "N");
		}
		return resultMap;
	}
	
	@RequestMapping("selectTaskInfo")
	@ResponseBody
	public Map<String, String> selectTaskInfo(String project_function_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_function_no", project_function_no);
		
		Map<String, String> resultMap = taskService.selectTaskInfo(params);
		
		return resultMap;
	}
}
