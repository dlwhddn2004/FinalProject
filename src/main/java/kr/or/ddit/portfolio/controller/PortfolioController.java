package kr.or.ddit.portfolio.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.member_rate.service.IMemberRateService;
import kr.or.ddit.member_rate.service.MemberRateServiceImpl;
import kr.or.ddit.mypage.developer.service.IMypageService;
import kr.or.ddit.portfolio.service.IPortfolioService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.utiles.AttachFileMapperMember;
import kr.or.ddit.vo.MemberRateVO;
import kr.or.ddit.vo.Mypage_memberVO;
import kr.or.ddit.vo.ProfileFileVO;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/portfolio/")
public class PortfolioController {

	@Autowired
	private IPortfolioService portfolioService;
	
	@RequestMapping("portfolioList")
	public ModelAndView portfolioList(ModelAndView modelAndView, HttpServletRequest request) throws Exception{
		
		List<Map<String,String>> portfolioList = this.portfolioService.selectPortFolioList();
		
		
		Map<String,String> maxportfolioAvg = new HashMap<String, String>();
		//맵으로 평균 점수가 가장 높은 프로젝트 번호 , 평균 점수 구하기. PORTFOLIO_NO,TOTALAVG
		maxportfolioAvg = this.portfolioService.MaxPortfolioNo();
		
		
		
		// 메인 각 포티폴리오 평가 점수
		Map<String,String> mainScoreChart = this.portfolioService.mainScoreChart(maxportfolioAvg);
		
		// 최고 평균점수가 높은 포트폴리오의 정보를 가져와서 뛰어줌 
		Map<String,String> MainportfolioInfo = this.portfolioService.portfolioInfo(maxportfolioAvg); 
		
		modelAndView.addObject("breadcrumb_title", "포트 폴리오");
        modelAndView.addObject("breadcrumb_first", "포트 폴리오 리스트");
        modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/portfolio/portfolioList.do");

		modelAndView.addObject("portfolioList",portfolioList );
		modelAndView.addObject("maxportfolioAvg",maxportfolioAvg);
		modelAndView.addObject("mainScoreChart",mainScoreChart);
		modelAndView.addObject("MainportfolioInfo", MainportfolioInfo);
		modelAndView.setViewName("user/portfolio/portfolioList");
		return modelAndView;
	}

							
}





