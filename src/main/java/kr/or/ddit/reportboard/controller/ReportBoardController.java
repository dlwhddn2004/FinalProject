package kr.or.ddit.reportboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.reportboard.service.IReportBoardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/reportboard/")
public class ReportBoardController {
	@Autowired
	private IReportBoardService reportBoardService;
	@Autowired
	private IProjectService projectService;
	
	@RequestMapping("reportboardList")
	public ModelAndView reportboardList(HttpServletRequest request,
										ModelAndView modelAndView,
										String project_no
											)throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		
		List<Map<String, String>> reportboardList = null;
		reportboardList = reportBoardService.reportboardList(params);
		
		Map<String, String> projectInfo = projectService.selectProjectInfo(params);
		
		modelAndView.addObject("reportboardList", reportboardList);
		modelAndView.addObject("projectInfo", projectInfo);
		modelAndView.setViewName("user/reportboard/reportboardList");
		
		return modelAndView;
	}
	
	@RequestMapping("reportboardView")
	public ModelAndView reportboardView(HttpServletRequest request,
										ModelAndView modelAndView,
										String report_no
											)throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("report_no", report_no);
		
		Map<String, String> reportInfo = reportBoardService.selectReportboard(params);
		String content = reportInfo.get("report_content");
		System.out.println(content);
		
		modelAndView.addObject("reportInfo", reportInfo);
		modelAndView.setViewName("user/reportboard/reportboardView");
		
		return modelAndView;
		
	}
	
	@RequestMapping("reportboardForm")
	public ModelAndView reportboardForm(HttpServletRequest request,
										ModelAndView modelAndView,
										String project_no
										) throws Exception{
		
		modelAndView.addObject("project_no", project_no);
		modelAndView.setViewName("user/reportboard/reportboardForm");
		
		return modelAndView;
	}
	
	@RequestMapping("insertReportboard")
	public ModelAndView insertReportboard ( HttpServletRequest request,
											ModelAndView modelAndView,
											String mem_id,
											String project_no,
											String report_title,
											String report_content
											) throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("project_no", project_no);
		params.put("report_title", report_title);
		params.put("report_content", report_content);
		
		String report_no = reportBoardService.insertReportboard(params);
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = "게시글 등록에 성공하였습니다!";
		
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("report_no", report_no);
		modelAndView.addObject("taskResult", taskResult);
		modelAndView.addObject("message", message);
		
		List<Map<String, String>> reportboardList = null;
		reportboardList = reportBoardService.reportboardList(params);
		
		modelAndView.addObject("reportboardList", reportboardList);
		
		modelAndView.setViewName("user/reportboard/reportboardList");
		
		return modelAndView;
	}
	
}
