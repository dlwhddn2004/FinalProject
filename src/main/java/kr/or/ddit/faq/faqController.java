package kr.or.ddit.faq;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/guide")
public class faqController {

	@Autowired
	private ObjectMapper Mapper;
	
	@RequestMapping("faq")
	public ModelAndView faq (	HttpServletRequest request,
								ModelAndView modelAndView){
	 	modelAndView.addObject("breadcrumb_title", "가이드");
		modelAndView.addObject("breadcrumb_first", "자주묻는 질문");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/guide/faq.do");
		modelAndView.setViewName("user/guide/faq");
		
		return modelAndView;
	}
	
}
