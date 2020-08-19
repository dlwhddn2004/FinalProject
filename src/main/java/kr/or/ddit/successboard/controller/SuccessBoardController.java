package kr.or.ddit.successboard.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.successboard.service.ISuccessBoardService;
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
	private ISuccessBoardService service;

	@RequestMapping("successboardList")
	public ModelAndView successList(HttpServletRequest request,
									ModelAndView modelAndView) throws Exception {
		List<SuccessBoardVO> successboardList = null;		
		successboardList = service.successboardList();
		
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
		modelAndView.addObject("breadcrumb_first", "성공 사례 게시판");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/successboard/successboardList.do");
		
		modelAndView.addObject("successboardList", successboardList);
		modelAndView.setViewName("user/successboard/successboardList");
		
		return modelAndView;
	}
	
	@RequestMapping("successboardView")
	public ModelAndView successboardView(HttpServletRequest request,
										 ModelAndView modelAndView) throws Exception {
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
		modelAndView.addObject("breadcrumb_first", "성공 사례 게시판");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/successboard/successboardList.do");
		modelAndView.addObject("breadcrumb_second", "성공 사례 게시글 등록");
		
		modelAndView.setViewName("user/successboard/successboardView");
		
		return modelAndView;
	}
	
	@RequestMapping("insertSuccessBoard")
	public String insertSuccessBoard(HttpServletRequest request,
								     HttpServletResponse response,
								     HttpSession session,
								     String success_title,
								     String success_content,
								     String project_name) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		SuccessBoardVO successboardInfo = new SuccessBoardVO();
		successboardInfo.setProject_no("1");
		successboardInfo.setMem_id("iai6203");
		successboardInfo.setSuccess_title(success_title);
		successboardInfo.setSuccess_content(success_content);
		
		service.insertSuccessBoard(successboardInfo);
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = URLEncoder.encode("게시글이 정상적으로 등록되었습니다.", "UTF-8");
		
		return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
}
