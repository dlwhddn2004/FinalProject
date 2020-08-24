package kr.or.ddit.successboard.controller;

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
@RequestMapping("/user/successboard/")
public class SuccessBoardController {
	
	@Autowired
	private ISuccessBoardService successBoardService;
	@Autowired
	private IProjectService projectService;
	@Autowired
	private IProfileFileService profileFileService;

	@RequestMapping("successboardList")
	public ModelAndView successList(HttpServletRequest request,
									ModelAndView modelAndView) throws Exception {
		List<SuccessBoardVO> successboardList = null;		
		successboardList = successBoardService.successboardList();
		
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
		modelAndView.addObject("breadcrumb_first", "성공 사례 게시판");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/successboard/successboardList.do");
		
		modelAndView.addObject("successboardList", successboardList);
		modelAndView.setViewName("user/successboard/successboardList");
		
		return modelAndView;
	}
	
	@RequestMapping("successboardForm")
	public ModelAndView successboardForm(HttpServletRequest request,
										 ModelAndView modelAndView,
										 String mem_id) throws Exception {
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
		modelAndView.addObject("breadcrumb_first", "성공 사례 게시판");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/successboard/successboardList.do");
		modelAndView.addObject("breadcrumb_second", "성공 사례 게시글 등록");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		List<Map<String, String>> attendProjectList = projectService.selectNotProjectListById(params);
		
		modelAndView.addObject("attendProjectList", attendProjectList);
		
		modelAndView.setViewName("user/successboard/successboardForm");
		
		return modelAndView;
	}
	
	@RequestMapping("successboardView")
	public ModelAndView successboardView(ModelAndView modelAndView,
								         String success_no,
								         String mem_id,
								         HttpServletRequest request) throws Exception {
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
		modelAndView.addObject("breadcrumb_first", "성공 사례 게시판");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/successboard/successboardList.do");
		modelAndView.addObject("breadcrumb_second", "성공 사례 게시글 보기");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("success_no", success_no);
		params.put("mem_id", mem_id);
		
		SuccessBoardVO successboardInfo = successBoardService.selectSuccessBoardInfo(params);
		List<SuccessBoardCommentVO> commentList = successBoardService.selectCommentList(params);
		successBoardService.updateHit(params);
		ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(params);
		
		params.put("project_no", successboardInfo.getProject_no());
		ProjectVO projectInfo = projectService.selectProjectInfo(params);
		
		modelAndView.addObject("successboardInfo", successboardInfo);
		modelAndView.addObject("projectInfo", projectInfo);
		modelAndView.addObject("commentList", commentList);
		modelAndView.addObject("profileInfo", profileInfo);
		modelAndView.setViewName("user/successboard/successboardView");
		
		return modelAndView;
	}
	
	@RequestMapping("insertSuccessBoard")
	public String insertSuccessBoard(HttpServletRequest request,
								     HttpServletResponse response,
								     String success_title,
								     String success_content,
								     String project_no,
								     String mem_id) throws Exception {
		
		
		SuccessBoardVO successboardInfo = new SuccessBoardVO();
		successboardInfo.setProject_no(project_no);
		successboardInfo.setMem_id(mem_id);
		successboardInfo.setSuccess_title(success_title);
		successboardInfo.setSuccess_content(success_content);
		
		successBoardService.insertSuccessBoard(successboardInfo);
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = URLEncoder.encode("게시글이 정상적으로 등록되었습니다.", "UTF-8");
		
		return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
	
	@RequestMapping("modifySuccessBoard")
	public String modifySuccessBoard(SuccessBoardVO successboardInfo) throws Exception {
		int chk = successBoardService.modifySuccessBoard(successboardInfo);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 수정되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("게시글 수정에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
	
	@RequestMapping("deleteSuccessBoard")
	public String deleteSuccessBoard(String success_no) throws Exception {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("success_no", success_no);
		int chk = successBoardService.deleteSuccessBoard(params);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 삭제되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("게시글 삭제에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
	
	@RequestMapping("insertSuccessComment")
	public String insertSuccessComment(SuccessBoardCommentVO successCommentInfo) throws Exception {
		int chk = successBoardService.insertSuccessComment(successCommentInfo);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("댓글이 정상적으로 등록되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("댓글 등록에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/successboard/successboardView.do?taskResult=" + taskResult + "&message=" + message + "&success_no=" + successCommentInfo.getSuccess_no() + "&mem_id=" + successCommentInfo.getMem_id();
	}
	
	@RequestMapping("deleteSuccessComment")
	public String deleteSuccessComment(String comment_seq,
									   String success_no,
									   String mem_id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("comment_seq", comment_seq);
		int chk = successBoardService.deleteSuccessComment(params);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("댓글이 정상적으로 삭제되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("댓글 삭제에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/successboard/successboardView.do?taskResult=" + taskResult + "&message=" + message + "&success_no=" + success_no + "&mem_id=" + mem_id;
	}
	
	@RequestMapping("modifySuccessComment")
	public String modifySuccessComment(String comment_seq,
			  						   String success_no,
			  						   String mem_id,
			  						   String comment_content) throws Exception {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("comment_seq", comment_seq);
		params.put("comment_content", comment_content);
		
		int chk = successBoardService.modifySuccessComment(params);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("댓글이 정상적으로 수정되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("댓글 수정에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/successboard/successboardView.do?taskResult=" + taskResult + "&message=" + message + "&success_no=" + success_no + "&mem_id=" + mem_id;
	}
}
