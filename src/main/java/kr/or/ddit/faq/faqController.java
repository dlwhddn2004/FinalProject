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
	
	@RequestMapping("partnersGuide")
	public ModelAndView partnersGuide( HttpServletRequest request, ModelAndView modelAndView){
		modelAndView.addObject("breadcrumb_title", "가이드");
		modelAndView.addObject("breadcrumb_first", "파트너스 이용방법");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/guide/partnersGuide.do");
		modelAndView.setViewName("user/guide/partnersGuide");
		
		return modelAndView;
		
	}
	@RequestMapping("developerGuide")
	public ModelAndView developerGuide( HttpServletRequest request, ModelAndView modelAndView){
		modelAndView.addObject("breadcrumb_title", "가이드");
		modelAndView.addObject("breadcrumb_first", "디벨로퍼 이용방법");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/guide/developerGuide.do");
		modelAndView.setViewName("user/guide/developerGuide");
		
		return modelAndView;
		
	}
	
}
