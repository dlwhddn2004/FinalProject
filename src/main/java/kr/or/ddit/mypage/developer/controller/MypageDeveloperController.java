package kr.or.ddit.mypage.developer.controller;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kr.or.ddit.vo.MemberRateVO;
import kr.or.ddit.vo.MemberVO;
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
	private IMemberService memberService;
	@Autowired
	private IProfileFileService profileService; 
	
	@Autowired
	private IProjectService projectService;
	@Autowired
	private IPortfolioService portfolioService;
	
	@RequestMapping("myPageView")
	public ModelAndView mainpage(String mem_id, ModelAndView modelAndView,String category_no,HttpServletRequest request, HttpSession session) throws Exception{
		Map<String,String> params = new HashMap<String,String>();
		params.put("mem_id", mem_id);
		params.put("category_no",category_no);
		
		// 보유기술 선택했을때 세션 선택.
		int protfolioNum = this.mypageService.portfolioFinishNumber(params);
		int projectNum = this.mypageService.projectFinishNumber(params);
		
		ProfileFileVO profileFileInfo = this.profileService.selectProfileFileInfo(params);
		// 마이페이지 테이블에 정보있는지 조회
		Mypage_memberVO mypageMemberInfo = this.mypageService.selectMypageInfo(params);
		
		// 본인이 작성한 포트폴리오 알려주기
		List<Map<String,String>> mypagePortfolioList = this.mypageService.portfolioMypageList(params);
		
		
		 // 맴버관련
		 MemberVO memberInfo = memberService.memberInfo(params);
		 String mem_age = memberInfo.getMem_bir();
		 
		 Date nowDate = new Date();
		 SimpleDateFormat format = new SimpleDateFormat("yyyy");
		 
		 int currentYear = Integer.parseInt(format.format(nowDate));
		 int memYear = Integer.parseInt(mem_age.substring(0, 4));
		 
		 mem_age = String.valueOf((currentYear - memYear) + 1);
		 Map<String,String> memberAttribute = new HashMap<String, String>();
		 //기타 회원관련된것들 넣어주자.
		 memberAttribute.put("MEM_AGE", mem_age);
		 
		 //마이 페이지 보유 기술 수 나타냄
		 String[] mypage_technologies_ipt=null;
		 //마이 페이지 숙련도.
		 String[]  mypage_techexperience = mypageMemberInfo.getMypage_techexperience().split(",");
		 //배열을 List로 넣어서 스크립트단에 표현.
		 List<String> mypage_techexperience_ipt = new ArrayList<String>();
		 for(int i=0; i<mypage_techexperience.length; i++ ){
			mypage_techexperience_ipt.add(mypage_techexperience[i]); 
		 }
		 int technologiesNum =0;
		 
		 if(mypageMemberInfo.getMypage_technologies() !=null ){
			 //마이페이지 기술 컬럼값 을 짤라서 넣어줌
			 mypage_technologies_ipt = mypageMemberInfo.getMypage_technologies().split(",");
			 // 마이페이지 숙련도 컬럼 값을 짤라
			
			 for(int i=0; i<mypage_technologies_ipt.length; i++){
					 	technologiesNum ++;
			 }
			 memberAttribute.put("technologiesNum", String.valueOf(technologiesNum));
		 }
			 
		 
		
		//차트표현
		MemberRateVO memberRateInfo = new MemberRateVO();
		memberRateInfo = this.memberRate.selectMemberRateInfo(params);
		
		//참가한 프로젝트의 기술 별  숫자
		Map<String,String> projectChartInfo = new HashMap<String, String>();
		// projectChart 기본값 넣어주기.
		for(int i=0; i<4; i++){
			if(i == 0){
				projectChartInfo.put("Angular", "0");
			}else if(i == 1){
				projectChartInfo.put("Bootstrap", "0");
			}else if(i == 2){
				projectChartInfo.put("React", "0");
			}else{
				projectChartInfo.put("Vue", "0");
			}
		}
		List<Map<String,String>> projectChartList = this.mypageService.projectTechnologiesChart(params);
		for(int i =0; i <projectChartList.size(); i++){
			if(String.valueOf(projectChartList.get(i).get("PROJECT_TECHNOLOGIES")).equals("1")){
				projectChartInfo.put("Angular", String.valueOf(projectChartList.get(i).get("SUM")));
			}
			if(String.valueOf(projectChartList.get(i).get("PROJECT_TECHNOLOGIES")).equals("2")){
				projectChartInfo.put("Bootstrap", String.valueOf(projectChartList.get(i).get("SUM")));
			}
			if(String.valueOf(projectChartList.get(i).get("PROJECT_TECHNOLOGIES")).equals("3")){
				projectChartInfo.put("React", String.valueOf(projectChartList.get(i).get("SUM")));
			}
			if(String.valueOf(projectChartList.get(i).get("PROJECT_TECHNOLOGIES")).equals("4")){
				projectChartInfo.put("Vue", String.valueOf(projectChartList.get(i).get("SUM")));
			}
		}
		
		//이력 사항
		List<Map<String,String>> CarrerList = this.mypageService.carrerList(params);
		
		modelAndView.addObject("breadcrumb_title", "MyPage");
        modelAndView.addObject("breadcrumb_first", "MyPage_ProFile");
        modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/mypage/myPageView.do");
		
		
			//프로젝트 성공, 포트폴리오 올린 숫자
			modelAndView.addObject("projectNum",projectNum);
			modelAndView.addObject("portfolioNum",protfolioNum);
			// 회원 평가 점수 차트에 씀
			modelAndView.addObject("memberRate",memberRateInfo);
			// 프로젝트 차트
			modelAndView.addObject("projectChartInfo", projectChartInfo);
			// 회원 프로필 사진 저장 및 보유
			modelAndView.addObject("profileFileInfo",profileFileInfo);
			// 본인이 작성한 포트폴리오
			modelAndView.addObject("mypagePortfolioList",mypagePortfolioList);
			// 마이프로필에 정보가 있는지를 조회 하려고함 .
			modelAndView.addObject("mypageMemberInfo", mypageMemberInfo);
			modelAndView.addObject("memberAttribute", memberAttribute);
			// 기술 숙련도
			modelAndView.addObject("mypage_techexperience", mypage_techexperience_ipt);
			modelAndView.addObject("CarrerList", CarrerList);
			modelAndView.setViewName("user/mypage/myPageView");
		
		return modelAndView;
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
	
	// 마이페이지 고유 기술 값 있는지 체크
	@RequestMapping("mypageTechnologiesCheck")
	public ModelAndView mypageTechnologiesCheck(String mem_id, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		Map<String,String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		
		Map<String,String> TechnologiesCheckInfo =  this.mypageService.mypageTechnologiesCheck(params);

		modelAndView.addObject("TechnologiesCheckInfo", TechnologiesCheckInfo);
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
	
	@RequestMapping("technologiesUpdate")
	public ModelAndView technologiesUpdate(String mem_id ,String angular ,String bootstrap, String react, 
			String vue)  throws Exception{
		Map<String,String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);

		// 기존에 입력한 값이랑 지금 넣으려는 값이랑 DB 컬럼 입력 순서로 확인해야함
		String mypage_technologies_ipt = "";
		String mypage_techexperience = angular +","+ bootstrap + ","+react + "," + vue;
		
		if(!angular.equals("0")){
			mypage_technologies_ipt += "1";
		}
		if(!bootstrap.equals("0")){
			mypage_technologies_ipt += "2";
		}
		if(!react.equals("0")){
			mypage_technologies_ipt += "3";
		}
		if(!vue.equals("0")){
			mypage_technologies_ipt += "4";
		}
		
		// 실직적으로 DB에 넣는 기술 1,2,3,4 찍히게
		String mypage_technologies ="";
		String[] mypage_technologies_update= new String[mypage_technologies_ipt.length()];
		for(int i=0; i<mypage_technologies_ipt.length(); i++){
			mypage_technologies_update[i] = mypage_technologies_ipt.substring(i,i+1);
		}
		
		for(int i=0; i<mypage_technologies_update.length; i++){
				mypage_technologies += mypage_technologies_update[i]+",";
		}
		mypage_technologies = mypage_technologies.substring(0, mypage_technologies.length() - 1);
		
		
		params.put("mypage_technologies", mypage_technologies);
		params.put("mypage_techexperience", mypage_techexperience);
	
		
		this.mypageService.updateTechnologies(params);
		
		Map<String,String> TechnologiesFinishInfo = this.mypageService.mypageTechnologiesCheck(params);
		String mypage_technologies_finish = TechnologiesFinishInfo.get("MYPAGE_TECHNOLOGIES");
		String mypage_techexperience_finish = TechnologiesFinishInfo.get("MYPAGE_TECHEXPERIENCE");
		
		List<String> mypage_technologies_List = Arrays.asList(mypage_technologies_finish.split(",")); 
		List<String> mypage_techexperience_List = Arrays.asList(mypage_techexperience_finish.split(",")); 
		
		//보유 기술 확인해주기
		int technologiesNum = mypage_technologies_List.size();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(mypage_techexperience_List);
		modelAndView.addObject(technologiesNum);
		modelAndView.setViewName("jsonConvertView");
		
		
		return modelAndView;
	}
	
	
	@RequestMapping("skillCheck")
	public ModelAndView skillCheck(String SKILLCHECK, HttpSession session ) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		if(SKILLCHECK.equals("1")){
			session.setAttribute("TECHNOLOGIESCHECK", true);
		}else{
			session.setAttribute("TECHNOLOGIESCHECK", false);
		}
		
		
		
		
		modelAndView.setViewName("jsonConvertView");
		
		return modelAndView;
		
	}
	
	@RequestMapping("selectCareer")
	public ModelAndView selectCareer(String mem_id) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		Map<String,String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		
		List<Map<String,String>> CarrerList = this.mypageService.carrerList(params);
		
		modelAndView.addObject("CarrerList",CarrerList);
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
}





