package kr.or.ddit.issueboard.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.issueboard.service.IIssueboardService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.vo.IssueJoinVO;
import kr.or.ddit.vo.IssueboardCommentVO;
import kr.or.ddit.vo.IssueboardVO;
import kr.or.ddit.vo.ProfileFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("user/issueboard/")
public class IssueboardController {

	@Autowired
	private IIssueboardService issueboardService;
	@Autowired
	private IProjectService projectService;
	@Autowired
	private IProfileFileService profileservice;

	@RequestMapping("issueboardList")
	public ModelAndView issueList(HttpServletRequest request,
			ModelAndView modelView, Map<String, String> params,
			@RequestParam String project_no,
			String issue_no) throws Exception {

	    params.put("project_no", project_no);
		
		List<IssueJoinVO> issueboardList = this.issueboardService
				.issueboardList(params);
		
		modelView.addObject("breadcrumb_title", "뉴스 센터");
		modelView.addObject("breadcrumb_first", "이슈 게시판");
		modelView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/issueboard/issueboardList.do?project_no=" + project_no);
		
		
		modelView.addObject("issueboardList", issueboardList);
		modelView.setViewName("user/issueboard/issueboardList");

		return modelView;

	}

	@RequestMapping("issueboardForm")
	public ModelAndView issueboardForm(HttpServletRequest request,
									   ModelAndView modelView,
									   String project_no) throws Exception{
		
		modelView.addObject("breadcrumb_title", "뉴스 센터");
		modelView.addObject("breadcrumb_first", "이슈 게시판");
		modelView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/issueboard/issueboardList.do?project_no=" + project_no);
		modelView.addObject("breadcrumb_second", "이슈 게시글 등록");
		
		modelView.setViewName("user/issueboard/issueboardForm");
		
		return modelView;
	}

	@RequestMapping("issueboardView")
	public ModelAndView issueboardView(ModelAndView modelView, String issue_no,
			String mem_id, String project_no, HttpServletRequest request)
			throws Exception {
		
		modelView.addObject("breadcrumb_title", "뉴스 센터");
		modelView.addObject("breadcrumb_first", "이슈 게시판");
		modelView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/issueboard/issueboardList.do?project_no=" + project_no);
		modelView.addObject("breadcrumb_second", "이슈 게시글 보기");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("issue_no", issue_no);
		params.put("mem_id", mem_id);
		params.put("project_no", project_no);
		
		IssueJoinVO issueboardInfo = issueboardService.issuboardInfo(params);
		List<IssueboardCommentVO> commentList = issueboardService.commentList(params);
		
		issueboardService.updateHit(params);
		ProfileFileVO profileInfo = profileservice.selectProfileFileInfo(params);
		
		params.put("project_no", issueboardInfo.getProject_no());
		System.out.println("issueboardInfo.getProject_no()"+issueboardInfo.getProject_no());
		Map<String, String>projectInfo = projectService.selectProjectInfo(params);
		
		modelView.addObject("projectInfo", projectInfo);
		modelView.addObject("profileInfo", profileInfo);
		modelView.addObject("commentList", commentList);
		modelView.addObject("issueboardInfo", issueboardInfo);
		modelView.setViewName("user/issueboard/issueboardView");
		return modelView;
	}

	@RequestMapping("insertIssueboard")
	public String insertIssueboard(HttpServletRequest request,
								   HttpServletResponse response,
								   String issue_title,
								   String issue_content,
								   String project_no,
								   String mem_id) throws Exception {
		
		IssueboardVO issueboardInfo = new IssueboardVO();
		issueboardInfo.setProject_no(project_no);
		issueboardInfo.setMem_id(mem_id);
		issueboardInfo.setIssue_title(issue_title);
		issueboardInfo.setIssue_content(issue_content);
		
		issueboardService.insertIssueboard(issueboardInfo);
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = URLEncoder.encode("게시글이 정상적으로 등록되었습니다.", "UTF-8");

		return "redirect:/user/issueboard/issueboardList.do?project_no=" + project_no + "&taskResult=" + taskResult + "&message" + message;
	}
	@RequestMapping("updateIssueboard")
	public String updateIssueboard(IssueJoinVO issueboardInfo, String project_no)throws Exception{
		int chk = issueboardService.updateIssueboard(issueboardInfo);
		
		String taskResult = null;
		String message = null;
		if (chk > 0){
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 수정되었습니다", "UTF-8");
		}else{
			taskResult = "warning";
			message = URLEncoder.encode("게시글 수정에 실패했습니다", "UTF-8");
		}
		
		return "redirect:/user/issueboard/issueboardList.do?taskResult=" + taskResult + "&message=" + message + "&project_no=" + project_no;
	}
	
	@RequestMapping("deleteIssueboard")
	public String delteIssueboard(String issue_no, String project_no) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("issue_no", issue_no);
		params.put("project_no", project_no);
		int chk = issueboardService.deleteIssueboard(params);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 삭제되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("게시글 삭제에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/issueboard/issueboardList.do?taskResult=" + taskResult + "&message=" + message + "&project_no=" + project_no;
		
	}
	
	@RequestMapping("insertissueComment")
	public String insertissueComment(IssueboardCommentVO issuecommentInfo
								     ,String project_no) throws Exception{
		

		
		int chk = issueboardService.insertComment(issuecommentInfo);
		
		String taskResult = null;
		String message = null;
		if (chk > 0){
			taskResult = "success";
			message = URLEncoder.encode("댓글이 정상적으로 등록되었습니다.", "UTF-8");
		}else{
			taskResult = "warning";
			message = URLEncoder.encode("댓글 등록에 실패했습니다", "UTF-8");
		}
		
		return "redirect:/user/issueboard/issueboardView.do?taskResult=" + taskResult + "&message=" + message + "&issue_no=" + issuecommentInfo.getIssue_no() + "&mem_id=" + issuecommentInfo.getMem_id() + "&project_no=" + project_no;
	}
	
	@RequestMapping("updateissueComment")
	public String updateissueComment(String comment_seq,
									 String issue_no,
									 String mem_id,
									 String comment_content,
									 String project_no
									 ) throws Exception{
		
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("comment_seq", comment_seq);
		params.put("comment_content", comment_content);
		params.put("project_no", project_no);
		
		int chk = issueboardService.updateComment(params);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("댓글이 정상적으로 수정되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("댓글 수정에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/issueboard/issueboardView.do?taskResult=" + taskResult + "&message=" + message + "&issue_no=" + issue_no + "&mem_id=" + mem_id + "&project_no=" + project_no;
		
		
	}
	
	@RequestMapping("deleteissueComment")
	public String deleteossueComment(String comment_seq,
								     String issue_no,
								     String mem_id,
								     String project_no) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("comment_seq", comment_seq);
		params.put("project_no", project_no);
		
		int chk = issueboardService.deleteComment(params);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("댓글이 정상적으로 삭제되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("댓글 삭제에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/issueboard/issueboardView.do?taskResult" + taskResult + "&message" + message + "&issue_no=" + issue_no + "&mem_id=" + mem_id + "&project_no=" + project_no ;
		
	}

}
