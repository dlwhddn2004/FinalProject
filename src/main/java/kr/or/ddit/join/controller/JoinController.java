package kr.or.ddit.join.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user/join")
public class JoinController {

	@Autowired
	private IMemberService service;
	
	@RequestMapping(value="loginCheck", method=RequestMethod.POST)
	   public String loginCheck(String mem_id, 
	                       String mem_pass,
	                       HttpServletRequest request,
	                       HttpSession session,
	                       HttpServletResponse response,
	                       Map<String, String> params)
	                      throws Exception{

		  params.put("mem_id", mem_id);
	      params.put("mem_pass", mem_pass);
	      
	      MemberVO memberInfo = this.service.memberInfo(params);
	      
	      String taskResult = null;
	  	  String message = null;
	      if(memberInfo == null){
	         // 리다이렉트(컨텍스트 루트 | 패스 생략)
	  		taskResult = "warning";
	  		message = URLEncoder.encode("로그인에 실패하였습니다!", "UTF-8");
	      }else{
	         session.setAttribute("MEMBER_LOGININFO", memberInfo);
	         taskResult = "success";
		  	 message = URLEncoder.encode("로그인에 성공하였습니다!", "UTF-8");
	      }
	      return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
	///user/join/logout.do
	@RequestMapping("logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		
		return "redirect:/user/successboard/successboardList.do";
	}

}
