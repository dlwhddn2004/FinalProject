package kr.or.ddit.member.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member_rate.service.IMemberRateService;
import kr.or.ddit.mypage.developer.service.IMypageService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.vo.MemberRateVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.Mypage_memberVO;
import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.newsboardVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.sun.org.glassfish.gmbal.ParameterNames;


@Controller
@RequestMapping("/user/member/")
public class MemberController {
	
	@Autowired
	private ObjectMapper Mapper;
	@Autowired
	private MessageSourceAccessor accesser;
	@Autowired
	private IMemberService service;
	@Autowired
	private IProfileFileService profileService;
	@Autowired
	private IMypageService mypageService;
	@Autowired
	private IMemberRateService rateService;
	
	@Autowired
	private CryptoGenerator crypto;
	
	@RequestMapping(value="loginCheck", method=RequestMethod.POST)
	public ModelAndView loginCheck(String mem_id, 
	                       String mem_pass,
	                       HttpServletRequest request,
	                       HttpSession session,
	                       HttpServletResponse response,
	                       Map<String, String> params,
	                       ModelAndView modelAndView)
	                      throws Exception{
		
		  mem_id = this.crypto.decryptRSA(session, mem_id);
		  mem_pass = this.crypto.decryptRSA(session, mem_pass);

		  params.put("mem_id", mem_id);
	      params.put("mem_pass", mem_pass);
	      
	      MemberVO memberInfo = this.service.memberInfo(params);
	      
	      String taskResult = null;
	  	  String message = null;
	      if(memberInfo == null){
	  		taskResult = "warning";
	  		message = "로그인에 실패하였습니다!";
	      }else{
	         session.setAttribute("MEMBER_LOGININFO", memberInfo);
	         taskResult = "success";
		  	 message = "로그인에 성공하였습니다!";
	      }
//	      return "redirect:/?taskResult=" + taskResult + "&message=" + message;
	      
	      modelAndView.addObject("memberInfo", memberInfo);
	      modelAndView.addObject("taskResult", taskResult);
	      modelAndView.addObject("message", message);
	      modelAndView.setViewName("user/welcome");
	      
	      return modelAndView;
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		
		String taskResult = "info";
	  	String message = URLEncoder.encode("로그아웃 되었습니다.", "UTF-8");
		
		return "redirect:/?taskResult=" + taskResult + "&message=" + message;
	}
	
	@RequestMapping("insertMember")
	public String insertMember(MemberVO memberInfo, 
							   ProfileFileVO profileInfo,
							   Mypage_memberVO mypageInfo,
							   MemberRateVO rateInfo) throws Exception{
		
		this.service.insertMemberInfo(memberInfo);		
		this.profileService.insertProfileFileInfo(profileInfo);
		this.rateService.insertMemberRate(rateInfo);
		
		if(mypageInfo.getCategory_no().equals("2")){
			this.mypageService.insertMypageDeveloper(mypageInfo);			
		}
		
		
		
		String taskResult = "success";
		String message = URLEncoder.encode("회원가입이 완료되었습니다.","UTF-8");
		
		return "redirect:/?taskResult=" + taskResult + "&message=" + message;
	}
	
	
	
	
	
	/**
	 * 재석
	 */
	@RequestMapping("selectMemberInfoJSON")
	@ResponseBody
	public Map<String, String> selectMemberInfoJSON(String mem_id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		Map<String, String> memberInfo = service.selectMemberInfo(params);
		
		return memberInfo; 
	}

}





