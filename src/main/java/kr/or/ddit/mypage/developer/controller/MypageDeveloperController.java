package kr.or.ddit.mypage.developer.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.member_rate.service.IMemberRateService;
import kr.or.ddit.member_rate.service.MemberRateServiceImpl;
import kr.or.ddit.mypage.developer.service.IMypageService;
import kr.or.ddit.vo.MemberRateVO;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/mypage/")
public class MypageDeveloperController {

	@Autowired
	private IMypageService mypageService;
	
	@Autowired
	private IMemberRateService memberRate;
	
	@RequestMapping("myPageView")
	public ModelAndView mainpage(String mem_id, ModelAndView modelAndView,String category_no) throws Exception{
		Map<String,String> params = new HashMap<String,String>();
		params.put("mem_id", mem_id);
		params.put("category_no",category_no);
		
		int protfolioNum = this.mypageService.portfolioFinishNumber(params);
		int projectNum = this.mypageService.projectFinishNumber(params);
		
		//차트표현
		MemberRateVO memberRateInfo = new MemberRateVO();
		memberRateInfo = this.memberRate.selectMemberRateInfo(params);
		
			
			modelAndView.addObject("projectNum",projectNum);
			modelAndView.addObject("protfolioNum",protfolioNum);
			modelAndView.setViewName("user/mypage/myPageView");
			
			modelAndView.addObject("memberRate",memberRateInfo);
		
		return modelAndView;
	}
}
