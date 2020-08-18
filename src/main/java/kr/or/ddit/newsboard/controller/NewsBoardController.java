package kr.or.ddit.newsboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.newsboard.service.NewsBoardService;
import kr.or.ddit.vo.newsboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

	@Controller
	@RequestMapping("/user/newsboard/")
	public class NewsBoardController {
		
		@Autowired
		private NewsBoardService service;
	

		@RequestMapping("newsboardList")
		public ModelAndView newsboardList(HttpServletRequest request,
				ModelAndView modelAndView) {
			List<newsboardVO> newsboardList = null;		
					try {
						newsboardList = service.newsboardList();
					} catch (Exception e) {
						e.printStackTrace();
					}

// breadcrumb
			modelAndView.addObject("breadcrumb_title", "뉴스 센터");
			modelAndView.addObject("breadcrumb_first", "소식 게시판");
			modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/newsboard/newsboardList.do");

			modelAndView.addObject("newsboardList", newsboardList);
			modelAndView.setViewName("user/newsboard/newsboardList");

			return modelAndView;
		}
		@RequestMapping("newsboardInsert")
		public void newsboardView(){
			
			
			
		}
		
	
}
