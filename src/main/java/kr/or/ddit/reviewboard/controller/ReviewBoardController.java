package kr.or.ddit.reviewboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

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
										ModelAndView modelAndView) throws Exception{
		List<ReviewBoardVO> reviewboardList = null;
		reviewboardList = reviewBoardService.reviewboardList();
		
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
		modelAndView.addObject("breadcrumb_first", "이용후기 게시판");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/reviewboard/reviewboardList.do");
		
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
}
