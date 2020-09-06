package kr.or.ddit.projectRegist;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/projectRegist/")
public class ProjectRegistController {

	@Autowired
	private IProjectService projectService;
	
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
		modelAndView.setViewName("user/projectRegist/project_1");
		
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
		
		modelAndView.setViewName("user/projectRegist/project_2");
		
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
		
		modelAndView.setViewName("user/projectRegist/project_3");
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
		
		modelAndView.setViewName("user/projectRegist/project_4");
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
		
		modelAndView.setViewName("user/projectRegist/project_5");
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
		
		modelAndView.setViewName("user/projectRegist/project_6");
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
		
		modelAndView.setViewName("user/projectRegist/project_7");
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
		
		modelAndView.setViewName("user/projectRegist/project_regist");
		
		return modelAndView;
	}
	
	@RequestMapping("project_interview_1")
	public void project_interview_1(){
		
	}
	
	@RequestMapping("project_interview_2")
	public void project_interview_2(){
		
	}
	
	@RequestMapping("project_interview_3")
	public void project_interview_3(){
		
	}
}
