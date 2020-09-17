package kr.or.ddit.portfolio.controller;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member_rate.service.IMemberRateService;
import kr.or.ddit.member_rate.service.MemberRateServiceImpl;
import kr.or.ddit.mypage.developer.service.IMypageService;
import kr.or.ddit.portfolio.service.IPortfolioService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.utiles.AttachFileMapperMember;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.utiles.attachFileMapperTest;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MemberRateVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.Mypage_memberVO;
import kr.or.ddit.vo.PortFolioReviewVO;
import kr.or.ddit.vo.PortFolioVO;
import kr.or.ddit.vo.ProfileFileVO;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.io.FilenameUtils;
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
	@Autowired
	private IProfileFileService profileSevice;
	@Autowired
	private IMypageService mypageService;
	@Autowired
	private IMemberService memberService;
	@Autowired
	private CryptoGenerator cryptoGen;

	
	@RequestMapping("portfolioList")
	public ModelAndView portfolioList(ModelAndView modelAndView, HttpServletRequest request, HttpSession session) throws Exception{
		
		Map<String, String> publicKeyMap = this.cryptoGen.generatePairKey(session);
		
		List<Map<String,String>> portfolioList = this.portfolioService.selectPortFolioList();
		
		
		Map<String,String> maxportfolioAvg = new HashMap<String, String>();
		//맵으로 평균 점수가 가장 높은 프로젝트 번호 , 평균 점수 구하기. PORTFOLIO_NO,TOTALAVG
		maxportfolioAvg = this.portfolioService.MaxPortfolioNo();
		
		
		
		// 메인 각 포티폴리오 평가 점수
		Map<String,String> mainScoreChart = this.portfolioService.mainScoreChart(maxportfolioAvg);
		
		// 최고 평균점수가 높은 포트폴리오의 정보를 가져와서 뛰어줌 
		Map<String,String> MainportfolioInfo = this.portfolioService.portfolioInfo(maxportfolioAvg);
		String repImage_ipt = null;
		if(MainportfolioInfo != null){
			repImage_ipt = MainportfolioInfo.get("PORTFOLIO_IMGS");
			String[] REGIMAGE = repImage_ipt.split(",");
			MainportfolioInfo.put("regImage", String.valueOf(REGIMAGE[0]));
		}
		
		
		modelAndView.addObject("breadcrumb_title", "포트 폴리오");
        modelAndView.addObject("breadcrumb_first", "포트 폴리오 리스트");
        modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/portfolio/portfolioList.do");
        
		modelAndView.addObject("portfolioList",portfolioList );
		modelAndView.addObject("maxportfolioAvg",maxportfolioAvg);
		modelAndView.addObject("mainScoreChart",mainScoreChart);
		modelAndView.addObject("MainportfolioInfo", MainportfolioInfo);
		modelAndView.addObject("publicKeyMap", publicKeyMap);
		modelAndView.setViewName("user/portfolio/portfolioList");
		return modelAndView;
	}

						
	@RequestMapping("portfolioView")
	public ModelAndView  portfolioView (String mem_id , String portfolio_no, HttpSession session, ModelAndView modelAndView,HttpServletRequest request) throws Exception{
		Map<String,String> params = new HashMap<String, String>();
		params.put("MEM_ID", mem_id);
		params.put("mem_id", mem_id);
		params.put("PORTFOLIO_NO", portfolio_no);

		// 포트폴리오 번호에 따른 포트폴리오 정보 및 개인 사진
		 Map<String,String> portfolioInfo = this.portfolioService.portfolioInfo(params);
		 // 포트폴리오 번호에 따른 차트 총 평균 점수 및 각 차트 별 평균 점수
		 Map<String,String> chartInfo = this.portfolioService.totalAVG(params);
		
		 String portfolio_imgs_str = String.valueOf(portfolioInfo.get("PORTFOLIO_IMGS"));
		 
		 
		 Map<String,String> projectAndportfolioNum = new HashMap<String, String>();
		 String portfolio =  String.valueOf(mypageService.portfolioFinishNumber(params));
		 String proejct =String.valueOf(mypageService.projectFinishNumber(params));
		 
		 projectAndportfolioNum.put("PROJECTNUM", proejct);
		 projectAndportfolioNum.put("PORTFOLINUM", portfolio);
		 
		 
		 // 생일
		 MemberVO memberInfo = memberService.memberInfo(params);
		 String mem_age = memberInfo.getMem_bir();
		 
		 Date nowDate = new Date();
		 SimpleDateFormat format = new SimpleDateFormat("yyyy");
		 
		 int currentYear = Integer.parseInt(format.format(nowDate));
		 int memYear = Integer.parseInt(mem_age.substring(0, 4));
		 
		 mem_age = String.valueOf((currentYear - memYear) + 1);
		 
		 portfolioInfo.put("MEM_AGE", mem_age);
		 
		 
		 // 이미지로 등록한 사진들
		 String[] portfolio_imgs = portfolio_imgs_str.split(",");
		 
		 
		 //리뷰 리스트
		 //List<Map<String,String>> reviewList =  this.portfolioService.selectPortfolioReview();
		 
		 modelAndView.addObject("projectAndportfolioNum",projectAndportfolioNum);
		 modelAndView.addObject("portfolioInfo",portfolioInfo);
		 modelAndView.addObject("chartInfo", chartInfo);
		 modelAndView.addObject("portfolio_imgs", portfolio_imgs);
		 
		// modelAndView.addObject("portfolioReviewList", reviewList);
		 
		modelAndView.addObject("breadcrumb_title", "포트 폴리오");
	    modelAndView.addObject("breadcrumb_first", "포트 폴리오 리스트");
	    modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/portfolio/portfolioList.do");
			
	    modelAndView.addObject("breadcrumb_second", "포트 폴리오 상세보기");
		 
		 
		 modelAndView.setViewName("user/portfolio/portfolioView");
		
		
		return modelAndView;
	}
	
	@RequestMapping("portfolioLike")
	public ModelAndView portfolioLike(String portfolio_no) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		Map<String,String> params = new HashMap<String, String>();
		params.put("portfolio_no", portfolio_no);
		this.portfolioService.updatePortFolioLike(params);
		modelAndView.setViewName("jsonConvertView");
		
		return modelAndView;
	}
	
	@RequestMapping("portfolioForm")
	public ModelAndView portfolioForm(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		
		
		modelAndView.addObject("breadcrumb_title", "포트 폴리오");
	    modelAndView.addObject("breadcrumb_first", "포트 폴리오 리스트");
	    modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/portfolio/portfolioList.do");
			
	    modelAndView.addObject("breadcrumb_second", "포트 폴리오 등록");
		 
		 
		modelAndView.setViewName("user/portfolio/portfolioForm");
		
		return modelAndView;
	}
	
	//user/portfolio/insertportfolio.do
	@RequestMapping("insertportfolio")
	public String insertportflio(PortFolioVO portfolioInfo, @RequestParam("files") MultipartFile[] items) throws Exception{
		
		//대표 사진 , 서브 사진들 분리
		List<FileItemVO> list =  attachFileMapperTest.mapper(items);
		portfolioInfo.setPortfolio_thumbnailimg(list.get(0).getFile_save_name());
		
		String portfolioImg ="";
		for(int i=1; i<list.size(); i++){
			if( i == (list.size()-1) ){
				portfolioImg += list.get(i).getFile_save_name();
				
			}else{
				//portfolioInfo.setPortfolio_imgs(list.get(i).getFile_save_name() + ",");
				portfolioImg += list.get(i).getFile_save_name()+ ",";
			}
		}
		// 마무리~!
		portfolioInfo.setPortfolio_imgs(portfolioImg);
		
		 int cnt = 0;
		 
		 cnt = this.portfolioService.InsertPortflio(portfolioInfo);
			String taskResult = null;
			String message = null;
				taskResult = "success";
				message = URLEncoder.encode("포트폴리오가 정상적으로 등록되었습니다.", "UTF-8");
			
			
			return "redirect:/user/portfolio/portfolioList.do?taskResult=" + taskResult + "&message=" + message;
	}
	
	
	@RequestMapping("updateportfolio")
	public String updatePortfolio(PortFolioVO portfolioInfo ,@RequestParam("files") MultipartFile[] items
			,String mainImage, String sub_profile1, String sub_profile2) throws Exception{
		
		String fileName = "";
		for(int i=0; i< items.length; i++){
			fileName += FilenameUtils.getName(items[i].getOriginalFilename());
		}
		int cnt= 0;
		
		
		if(fileName.equals("")){
			portfolioInfo.setPortfolio_thumbnailimg(mainImage);
			portfolioInfo.setPortfolio_imgs(sub_profile1+","+sub_profile2);
			
			cnt = this.portfolioService.updatePortfolio(portfolioInfo);
			
			String taskResult = null;
			String message = null;
			
			if(cnt> 0){
				taskResult = "success";
				message = URLEncoder.encode("포트폴리오가 정상적으로 수정되었습니다.", "UTF-8");
			}
			
			return "redirect:/user/portfolio/portfolioList.do?taskResult=" + taskResult + "&message=" + message;
		}else{
			
			List<FileItemVO> list =  attachFileMapperTest.mapper(items);
			portfolioInfo.setPortfolio_thumbnailimg(list.get(0).getFile_save_name());
			
			String portfolioImg ="";
			for(int i=1; i<list.size(); i++){
				if( i == (list.size()-1) ){
					portfolioImg += list.get(i).getFile_save_name();
					
				}else{
					//portfolioInfo.setPortfolio_imgs(list.get(i).getFile_save_name() + ",");
					portfolioImg += list.get(i).getFile_save_name()+ ",";
				}
			}
			// 마무리~!
			portfolioInfo.setPortfolio_imgs(portfolioImg);
			
			cnt= 0;
			cnt = this.portfolioService.updatePortfolio(portfolioInfo);
			
			String taskResult = null;
			String message = null;
			
			if(cnt> 0){
				taskResult = "success";
				message = URLEncoder.encode("포트폴리오가 정상적으로 수정되었습니다.", "UTF-8");
			}
			
			return "redirect:/user/portfolio/portfolioList.do?taskResult=" + taskResult + "&message=" + message;
		}
	}

	@RequestMapping("deleteportfolio")
	public String deleteportfolio(String mem_id, String portfolio_no) throws Exception{
		Map<String,String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("portfolio_no", portfolio_no);
		
		String taskResult = null;
		String message = null;
		
		
		int cnt= 0;
		cnt = this.portfolioService.deleteportfolio(params);
		
		if(cnt> 0){
			taskResult = "success";
			message = URLEncoder.encode("포트폴리오가 정상적으로 삭제되었습니다.", "UTF-8");
		}
		
		
		return "redirect:/user/portfolio/portfolioList.do?taskResult=" + taskResult + "&message=" + message;
	}
	
	@RequestMapping("InsertPortfolioReview")
	public ModelAndView InsertPortfolioReview(PortFolioReviewVO reviewInfo) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		this.portfolioService.insertPortfolioReview(reviewInfo);
		
		modelAndView.setViewName("jsonConvertView");
		
		
		return modelAndView;
	}
	
	@RequestMapping("updatePortfolioReview")
	public ModelAndView updatePortfolioReview(PortFolioReviewVO reviewInfo) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		this.portfolioService.updatePortfolioReview(reviewInfo);
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
	@RequestMapping("reviewList")
	public ModelAndView reviewList(String portfolio_no) throws Exception{
		Map<String,String> params = new HashMap<String, String>();
		params.put("portfolio_no", portfolio_no);
		List<Map<String,String>> reviewList = this.portfolioService.selectPortfolioReview(params);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("reviewList", reviewList);
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
	@RequestMapping("portfolioReviewInfo")
	public ModelAndView portfolioReviewInfo(String portfolio_seq) throws Exception{
		Map<String,String> params = new HashMap<String, String>();
		params.put("portfolio_seq", portfolio_seq);
		Map<String,String> reviewInfo = this.portfolioService.portfolioReviewInfo(params);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("reviewInfo",reviewInfo);
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
		
	}
	
	
	@RequestMapping("portfolioReviewDelete")
	public ModelAndView portfolioReviewDelete(String portfolio_seq) throws Exception{
		
		Map<String,String> params = new HashMap<String, String>();
		params.put("portfolio_seq", portfolio_seq);
		
		this.portfolioService.portfolioReviewDelete(params);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
}





