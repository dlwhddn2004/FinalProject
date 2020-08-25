package kr.or.ddit.reviewboard.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.reviewboard.service.IReviewBoardService;
import kr.or.ddit.vo.ReviewBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/reviewboard/")
public class ReviewBoardController {
	@Autowired 
	private IReviewBoardService reviewBoardService;
	@Autowired
	private IProjectService projectService;
	
	@RequestMapping("reviewboardList")
	public ModelAndView reviewboardList(HttpServletRequest request,
										ModelAndView modelAndView,
										String mem_id) throws Exception{
		List<ReviewBoardVO> reviewboardList = null;
		reviewboardList = reviewBoardService.reviewboardList();
		
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
		modelAndView.addObject("breadcrumb_first", "이용후기 게시판");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/reviewboard/reviewboardList.do");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		List<Map<String, String>> attendProjectList = projectService.selectFinishProjectListById(params);
		modelAndView.addObject("attendProjectList", attendProjectList);
		
		modelAndView.addObject("reviewboardList", reviewboardList);
		modelAndView.setViewName("user/reviewboard/reviewboardList");
		
		return modelAndView;
	}
	
	@RequestMapping("reviewboardForm")
	public ModelAndView reviewboardForm(HttpServletRequest request,
										ModelAndView modelAndView,
										String mem_id) throws Exception{
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
		modelAndView.addObject("breadcrumb_first", "이용후기 게시판");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/reviewboard/reviewboardList.do");
		modelAndView.addObject("breadcrumb_second", "이용후기 게시글 등록");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		List<Map<String, String>> attendProjectList = projectService.selectFinishProjectListById(params);
		
		modelAndView.addObject("attendProjectList", attendProjectList);
		
		modelAndView.setViewName("user/reviewboard/reviewboardForm");
		
		return modelAndView;
	}
	
	@RequestMapping("insertReviewBoard")
	public String insertReviewBoard(HttpServletRequest request,
									HttpServletResponse response,
									String review_title,
									String review_content,
									String mem_id,
									int review_score) throws Exception{
		
		ReviewBoardVO reviewboardInfo = new ReviewBoardVO();
		reviewboardInfo.setMem_id(mem_id);
		reviewboardInfo.setReview_title(review_title);
		reviewboardInfo.setReview_content(review_content);
		reviewboardInfo.setReview_score(review_score);
		
		reviewBoardService.insertReviewBoard(reviewboardInfo);
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = URLEncoder.encode("게시글이 정상적으로 등록되었습니다.", "UTF-8");
		
		return "redirect:/user/reviewboard/reviewboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
}
