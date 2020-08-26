package kr.or.ddit.issueboard.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.issueboard.service.IIssueboardService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.vo.IssueJoinVO;
import kr.or.ddit.vo.IssueboardVO;
import kr.or.ddit.vo.Project_ProjectParticipantsVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("user/issueboard/")
public class IssueboardController {
	
	@Autowired
	private IIssueboardService issueboardService;
	@Autowired 
	private IProjectService projectService;
	
	@RequestMapping("issueboardList")
	public ModelAndView issueList(HttpServletRequest request,
								  ModelAndView modelView,
								  Map<String, String>params,
								  String project_no
								  ) throws Exception{
		
//		params.put("project_no", project_no);
		params.put("project_no", "3");
		List<IssueJoinVO> issueboardList = this.issueboardService.issueboardList(params);
		
		modelView.addObject("issueboardList", issueboardList);
		modelView.setViewName("user/issueboard/issueboardList");
		
		return modelView;
		
	}
	
	@RequestMapping("issueboardForm")
	public ModelAndView issueboardForm(HttpServletRequest request,
									   ModelAndView modelView,
									   String mem_id) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		List<Map<String, String>> attendProjectList = projectService.selectNotProjectListById(params);
				
		modelView.addObject("attendProjectList", attendProjectList);
		modelView.setViewName("user/issueboard/issueboardForm");
		
		return modelView;
	}
	
	@RequestMapping("issueboardView")
	public ModelAndView issueboardView(ModelAndView modelView,
									   String issue_no,
									   String mem_id,
									   HttpServletRequest request) throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("issue_no", issue_no);
		params.put("mem_id", mem_id);
		
		
		
		IssueJoinVO issueboardInfo = issueboardService.issuboardInfo(params);
		
		modelView.addObject("issueboardInfo", issueboardInfo);
		
		return modelView;
	}
	
	@RequestMapping("insertIssueboardInfo")
	public String insertIssueboard(HttpServletRequest request,
								  HttpServletResponse response,
								  String issue_title,
								  String issue_content,
								  String mem_id
								  )throws Exception{
		
		IssueboardVO issueboardInfo = new IssueboardVO();
		issueboardInfo.setMem_id(mem_id);
		issueboardInfo.setIssue_title(issue_title);
		issueboardInfo.setIssue_content(issue_content);
		
		issueboardService.insertIssueboardInfo(issueboardInfo);
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = URLEncoder.encode("게시글이 정상적으로 등록되었습니다.", "UTF-8");
		
		
		return "redirect:/user/issueboard/issueboardList.do?taskResult=" + taskResult + "&message" + message;
		
	}
										  
		

}
