package kr.or.ddit.mypage.developer.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.member_rate.service.IMemberRateService;
import kr.or.ddit.member_rate.service.MemberRateServiceImpl;
import kr.or.ddit.mypage.developer.service.IMypageService;
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
@RequestMapping("/user/mypage/")
public class MypageDeveloperController {

	@Autowired
	private IMypageService mypageService;
	
	@Autowired
	private IMemberRateService memberRate;
	
	@Autowired
	private IProfileFileService profileService; 
	
	@Autowired
	private IProjectService projectService;
	
	@RequestMapping("myPageView")
	public ModelAndView mainpage(String mem_id, ModelAndView modelAndView,String category_no,HttpServletRequest request) throws Exception{
		Map<String,String> params = new HashMap<String,String>();
		params.put("mem_id", mem_id);
		params.put("category_no",category_no);
		
		int protfolioNum = this.mypageService.portfolioFinishNumber(params);
		int projectNum = this.mypageService.projectFinishNumber(params);
		
		ProfileFileVO profileFileInfo = this.profileService.selectProfileFileInfo(params);
		// 마이페이지 테이블에 정보있는지 조회
		Mypage_memberVO mypageMemberInfo = this.mypageService.selectMypageInfo(params);
		
		//차트표현
		MemberRateVO memberRateInfo = new MemberRateVO();
		memberRateInfo = this.memberRate.selectMemberRateInfo(params);
		
		modelAndView.addObject("breadcrumb_title", "MyPage");
        modelAndView.addObject("breadcrumb_first", "MyPage_ProFile");
        modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/mypage/myPageView.do");
		
		
			//프로젝트 성공, 포트폴리오 올린 숫자
			modelAndView.addObject("projectNum",projectNum);
			modelAndView.addObject("protfolioNum",protfolioNum);
			// 회원 평가 점수 차트에 씀
			modelAndView.addObject("memberRate",memberRateInfo);
			// 회원 프로필 사진 저장 및 보유
			modelAndView.addObject("profileFileInfo",profileFileInfo);
			// 마이프로필에 정보가 있는지를 조회 하려고함 .
			modelAndView.addObject("mypageMemberInfo", mypageMemberInfo);
			modelAndView.setViewName("user/mypage/myPageView");
			
		
		return modelAndView;
	}
	
	@RequestMapping("insertMyabout")
	public String insertMyabout(String mem_id,@RequestParam("files") MultipartFile[] files,
										String category_no,String mypage_aboutme) throws Exception{
		
		
		//MultipartFile[] files = null;
		Mypage_memberVO mypageInfo = new Mypage_memberVO();
		mypageInfo.setMem_id(mem_id);
		mypageInfo.setCategory_no(category_no);
		mypageInfo.setMypage_aboutme(mypage_aboutme);


		 String test= null;
		 
		 test = this.mypageService.insertMyabout(mypageInfo, files);
		 String taskResult = null;
		 String message = null;
	
			taskResult = "success";
			message = URLEncoder.encode("회원정보가 정상적으로 등록되었습니다.", "UTF-8");
	
		return "redirect:/user/mypage/myPageView.do?mem_id=" +mem_id +"&category_no"+ category_no +"&taskResult=" + taskResult + "&message=" + message;
		
	}
	
	@RequestMapping("modifyMyabout")
	public String modifyMyabout(String mem_id, @RequestParam("files") MultipartFile[] files,
			String category_no,String mypage_aboutme) throws Exception{
		Mypage_memberVO mypageInfo = new Mypage_memberVO();
		
		mypageInfo.setMem_id(mem_id);
		mypageInfo.setCategory_no(category_no);
		mypageInfo.setMypage_aboutme(mypage_aboutme);
		
		this.mypageService.modifyMyabout(mypageInfo, files);
		
		 String taskResult = null;
		 String message = null;
	
			taskResult = "success";
			message = URLEncoder.encode("회원정보가 정상적으로 수정되었습니다.", "UTF-8");
	
		
		return "redirect:/user/mypage/myPageView.do?mem_id=" +mem_id +"&category_no"+ category_no +"&taskResult=" + taskResult + "&message=" + message;
	}
	

	
	
	
	@RequestMapping("headerImgChange")
	public ModelAndView headerImgChange(ModelAndView modelAndView,String mem_id) throws Exception {
		Map<String,String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		ProfileFileVO headerImgChange =  this.profileService.selectProfileFileInfo(params);
		modelAndView.addObject("headerImgChange",headerImgChange);
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
							
}





