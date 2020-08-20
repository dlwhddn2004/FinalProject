package kr.or.ddit.member_rate.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.member_rate.service.IMemberRateService;
import kr.or.ddit.vo.MemberRateVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/memrate/")
public class MemberRateController {
	
	@Autowired
	private IMemberRateService memberRateService;
	
	@RequestMapping("getMemRate")
	public ModelAndView getMemRate(String mem_id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		
		MemberRateVO memberRateInfo = memberRateService.selectMemberRateInfo(params);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberRateInfo", memberRateInfo);
		
		modelAndView.setViewName("jsonConvertView");
		
		return modelAndView;
	}
	
}
