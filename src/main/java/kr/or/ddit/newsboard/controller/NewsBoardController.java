package kr.or.ddit.newsboard.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.newsboard.service.NewsBoardService;
import kr.or.ddit.vo.SuccessBoardVO;
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
		@RequestMapping("newsboardForm")
		public ModelAndView newsboardView(HttpServletRequest request,
											 ModelAndView modelAndView) throws Exception {
			modelAndView.addObject("breadcrumb_title", "뉴스 센터");
			modelAndView.addObject("breadcrumb_first", "소식 게시판");
			modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/newsboard/newsboardList.do");
			modelAndView.addObject("breadcrumb_second", "소식 게시글 등록");
			
			modelAndView.setViewName("user/newsboard/newsboardForm");
			
			return modelAndView;
		}
		@RequestMapping("newsboardView")
		public ModelAndView newsboardView(ModelAndView modelAndView,
									         String news_no) throws Exception {
			Map<String, String> params = new HashMap<String, String>();
			params.put("news_no", news_no);
			
			newsboardVO newsboardInfo = service.newsboardInfo(params);
			
			modelAndView.addObject("newsboardInfo", newsboardInfo);
			modelAndView.setViewName("user/newsboard/newsboardView");
			
			return modelAndView;
		}
		
		
		@RequestMapping("newsboardInsert")
		public String insertNewsboard (newsboardVO newsboardInfo,
				HttpServletRequest request,
			     HttpServletResponse response,
			     String news_title,
			     String news_content,
			     String mem_id) throws Exception{
			
			newsboardInfo.setMem_id(mem_id);
			newsboardInfo.setNews_title(news_title);
			newsboardInfo.setNews_content(news_content);
			
			service.insertNewsboard(newsboardInfo);
			
			String taskResult = null;
			String message = null;
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 등록되었습니다.", "UTF-8");
			
			 return "redirect:/user/newsboard/newsboardList.do?taskResult=" + taskResult + "&message=" + message;
			
			
			
			
		}
		
		
	
}
