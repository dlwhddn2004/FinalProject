package kr.or.ddit.successboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.successboard.service.ISuccessBoardService;
import kr.or.ddit.vo.SuccessBoardVO;

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
									ModelAndView modelAndView) {
		List<SuccessBoardVO> successboardList = null;		
		try {
			successboardList = service.successboardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
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
										 ModelAndView modelAndView) {
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
		modelAndView.addObject("breadcrumb_first", "성공 사례 게시판");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/successboard/successboardList.do");
		modelAndView.addObject("breadcrumb_second", "성공 사례 게시글 등록");
		
		modelAndView.setViewName("user/successboard/successboardView");
		
		return modelAndView;
	}
}
