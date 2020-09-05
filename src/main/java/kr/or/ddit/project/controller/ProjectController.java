package kr.or.ddit.project.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.task.service.ITaskService;
import kr.or.ddit.timeline.service.ITimelineService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProfileFileVO;
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
	
	@Autowired
	private IProfileFileService profileFileService;
	
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
			
			if (item.get("PL") != null) {
				sendDataMap.put("mem_id", String.valueOf(item.get("PL")));
				
				ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(sendDataMap);
				item.put("PL_PIC_SAVENAME", profileInfo.getProfile_savename());
			}
			if (item.get("TA") != null) {
				sendDataMap.put("mem_id", String.valueOf(item.get("TA")));
				
				ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(sendDataMap);
				item.put("TA_PIC_SAVENAME", profileInfo.getProfile_savename());
			}
			if (item.get("DA") != null) {
				sendDataMap.put("mem_id", String.valueOf(item.get("DA")));
				
				ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(sendDataMap);
				item.put("DA_PIC_SAVENAME", profileInfo.getProfile_savename());
			}
			if (item.get("UA") != null) {
				sendDataMap.put("mem_id", String.valueOf(item.get("UA")));
				
				ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(sendDataMap);
				item.put("UA_PIC_SAVENAME", profileInfo.getProfile_savename());
			}
			if (item.get("AA") != null) {
				sendDataMap.put("mem_id", String.valueOf(item.get("AA")));
				
				ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(sendDataMap);
				item.put("AA_PIC_SAVENAME", profileInfo.getProfile_savename());
			}
			
			try {
				String average = String.valueOf(resultDataMap.get("AVERAGE"));
				item.put("AVERAGE", average);
			} catch (Exception e) {
				item.put("AVERAGE", "0");
			}
		}
		
		List<Map<String, String>> finishProjectList = projectService.selectFinishProjectListById(params);
		
		for (Map<String, String> item : finishProjectList) {
			String project_no = String.valueOf(item.get("PROJECT_NO"));
			
			Map<String, String> sendDataMap = new HashMap<String, String>();
			sendDataMap.put("project_no", project_no);
			
			Map<String, String> resultDataMap = taskService.selectAverage(sendDataMap);
			
			if (item.get("PL") != null) {
				sendDataMap.put("mem_id", String.valueOf(item.get("PL")));
				
				ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(sendDataMap);
				item.put("PL_PIC_SAVENAME", profileInfo.getProfile_savename());
			}
			if (item.get("TA") != null) {
				sendDataMap.put("mem_id", String.valueOf(item.get("TA")));
				
				ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(sendDataMap);
				item.put("TA_PIC_SAVENAME", profileInfo.getProfile_savename());
			}
			if (item.get("DA") != null) {
				sendDataMap.put("mem_id", String.valueOf(item.get("DA")));
				
				ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(sendDataMap);
				item.put("DA_PIC_SAVENAME", profileInfo.getProfile_savename());
			}
			if (item.get("UA") != null) {
				sendDataMap.put("mem_id", String.valueOf(item.get("UA")));
				
				ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(sendDataMap);
				item.put("UA_PIC_SAVENAME", profileInfo.getProfile_savename());
			}
			if (item.get("AA") != null) {
				sendDataMap.put("mem_id", String.valueOf(item.get("AA")));
				
				ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(sendDataMap);
				item.put("AA_PIC_SAVENAME", profileInfo.getProfile_savename());
			}
			
			try {
				String average = String.valueOf(resultDataMap.get("AVERAGE"));
				item.put("AVERAGE", average);
			} catch (Exception e) {
				item.put("AVERAGE", "0");
			}
		}
		
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
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/project.do?mem_id=" + mem_id);
		modelAndView.addObject("breadcrumb_second", "프로젝트 상세");
		
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
			
			ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(params);
			projectInfo.put("PL_PIC_SAVENAME", profileInfo.getProfile_savename());
			
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
			
			ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(params);
			projectInfo.put("TA_PIC_SAVENAME", profileInfo.getProfile_savename());
			
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
			
			ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(params);
			projectInfo.put("DA_PIC_SAVENAME", profileInfo.getProfile_savename());
			
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
			
			ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(params);
			projectInfo.put("UA_PIC_SAVENAME", profileInfo.getProfile_savename());
			
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
			
			ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(params);
			projectInfo.put("AA_PIC_SAVENAME", profileInfo.getProfile_savename());
			
			Map<String, String> memberInfo = memberService.selectMemberInfo(params);
			Map<String, String> personAvg = taskService.selectPersonAverage(params);
			projectInfo.put("AA_NAME", String.valueOf(memberInfo.get("MEM_NAME")));
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
	
	@RequestMapping("project_1")
	public ModelAndView projectForm(HttpServletRequest request,
									ModelAndView modelAndView,
									String mem_id) throws Exception{
		
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트");
//		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/project.do?mem_id=" + mem_id);
		modelAndView.addObject("breadcrumb_second", "프로젝트 등록");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		
		Map<String, String> readNotProject = projectService.readNotProject(params);
		
		modelAndView.addObject("readNotProject", readNotProject);
		modelAndView.setViewName("user/project/project_1");
		
		return modelAndView;
	}
	
	@RequestMapping("project_2")
	public ModelAndView projectReady(HttpServletRequest request,
									ModelAndView modelAndView,
									String mem_id,
									String project_clientinformation,
									String project_clientintroduce,
									String project_processstatus,
									String project_processcategory,
									String project_title) throws Exception{
		
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트");
		modelAndView.addObject("breadcrumb_second", "프로젝트 등록");
		
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("mem_id", mem_id);
		params.put("project_clientinformation", project_clientinformation);
		params.put("project_clientintroduce", project_clientintroduce);
		params.put("project_processstatus", project_processstatus);
		params.put("project_processcategory", project_processcategory);
		params.put("project_title", project_title);
		
		String project_no = projectService.insertProjectInfo(params);
		this.projectService.insertProjectParticipants(params);
		
		modelAndView.addObject("project_no", project_no);
		
		modelAndView.setViewName("user/project/project_2");
		
		return modelAndView;
	}
	
	@RequestMapping("project_3")
	public ModelAndView project3(HttpServletRequest request,
								ModelAndView modelAndView,
								String project_readystatus,
								String project_reference,
								String project_no
									) throws Exception{
		
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트");
		modelAndView.addObject("breadcrumb_second", "프로젝트 등록");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("project_readystatus", project_readystatus);
		params.put("project_reference", project_reference);
		
		int chk = projectService.insertProjectReady(params);
		
		modelAndView.addObject("project_no", project_no);
		
		modelAndView.setViewName("user/project/project_3");
		return modelAndView;
	}
	
	@RequestMapping("project_4")
	public ModelAndView project4(HttpServletRequest request,
									ModelAndView modelAndView,
									String project_no,
									String project_currentstatus,
									String project_technologies
									) throws Exception{
		
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트");
		modelAndView.addObject("breadcrumb_second", "프로젝트 등록");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("project_currentstatus", project_currentstatus);
		params.put("project_technologies", project_technologies);
		
		int chk = projectService.insertProjectDetail(params);
		
		modelAndView.addObject("project_no", project_no);
		
		modelAndView.setViewName("user/project/project_4");
		return modelAndView;
	}
	
	@RequestMapping("project_5")
	public ModelAndView project5(HttpServletRequest request,
									ModelAndView modelAndView,
									String project_no,
									String project_budget,
									String project_startdate,
									String project_duration
									) throws Exception{
		
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트");
		modelAndView.addObject("breadcrumb_second", "프로젝트 등록");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("project_budget", project_budget);
		params.put("project_startdate", project_startdate);
		params.put("project_duration", project_duration);
		
		int chk = projectService.insertProjectBudget(params);
		
		modelAndView.addObject("project_no", project_no);
		
		modelAndView.setViewName("user/project/project_5");
		return modelAndView;
	}

	@RequestMapping("project_6")
	public ModelAndView project6(HttpServletRequest request,
									ModelAndView modelAndView,
									String project_no,
									String project_premeeting,
									String project_proceedingmeeting,
									String project_meetingcycle,
									String project_clientlocation
									) throws Exception{
		
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트");
		modelAndView.addObject("breadcrumb_second", "프로젝트 등록");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("project_premeeting", project_premeeting);
		params.put("project_proceedingmeeting", project_proceedingmeeting);
		params.put("project_meetingcycle", project_meetingcycle);
		params.put("project_clientlocation", project_clientlocation);
		
		int chk = projectService.insertProjectMeeting(params);
		
		modelAndView.addObject("project_no", project_no);
		
		modelAndView.setViewName("user/project/project_6");
		return modelAndView;
	}
	
	@RequestMapping("project_7")
	public ModelAndView project7(HttpServletRequest request,
									ModelAndView modelAndView,
									String project_no,
									String project_applicationdeadline,
									String project_supportstatus,
									String project_essentialrequirements
									) throws Exception{
		
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트");
		modelAndView.addObject("breadcrumb_second", "프로젝트 등록");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("project_applicationdeadline", project_applicationdeadline);
		params.put("project_supportstatus", project_supportstatus);
		params.put("project_essentialrequirements", project_essentialrequirements);
		
		int chk = projectService.insertProjectMozip(params);
		
		modelAndView.addObject("project_no", project_no);
		
		modelAndView.setViewName("user/project/project_7");
		return modelAndView;
	}
	
	@RequestMapping("project_regist")
	public ModelAndView projectRegist(HttpServletRequest request,
									ModelAndView modelAndView,
									String project_no,
									String project_manpower,
									String project_managementexperience,
									String project_futureplans,
									String project_priority
									) throws Exception{
		
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트");
		modelAndView.addObject("breadcrumb_second", "프로젝트 등록 완료");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("project_manpower", project_manpower);
		params.put("project_managementexperience", project_managementexperience);
		params.put("project_futureplans", project_futureplans);
		params.put("project_priority", project_priority);
		
		int chk = projectService.insertProjectAdd(params);
		ProjectVO projectInfo = new ProjectVO();
		projectInfo	= projectService.projectInfo(params);
		
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("projectInfo", projectInfo);
		
		modelAndView.setViewName("user/project/project_regist");
		
		return modelAndView;
	}
	
	
}
