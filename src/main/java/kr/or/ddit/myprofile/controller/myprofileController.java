
package kr.or.ddit.myprofile.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProfileFileVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/user/myprofile/")
public class myprofileController {
	@Autowired
	private ObjectMapper Mapper;
	@Autowired
	private MessageSourceAccessor accesser;
	@Autowired
	private IMemberService service;
	@Autowired
	private IProfileFileService profileservice;
	@Autowired
	private IMemberDAO dao;
	
	  

	
	
	 @RequestMapping("myprofile")
	  public ModelAndView myprofile(ModelAndView modelAndView, String mem_id,HttpServletRequest request) throws Exception{
		 Map<String, String> params = new HashMap<String, String>();
		 params.put("mem_id", mem_id);
		 
		 ProfileFileVO profileInfo = profileservice.selectProfileFileInfo(params);
		 MemberVO memberInfo = this.service.memberInfo(params);
		 
		 modelAndView.addObject("profileInfo1",profileInfo);
		 modelAndView.addObject("memberInfo", memberInfo);
		 
		 String temp = memberInfo.getMem_tel();
		 String[] tempString = temp.split("-");
		 
		 List<String> MemberInfoTel = new ArrayList<String>();
		 for (int i = 0; i < tempString.length; i++) {
			 MemberInfoTel.add(tempString[i]);
		}
		 
		 String temp1 = memberInfo.getMem_addr();
		 String[] tempString1 = temp1.split("-");
		 
		 List<String> MemberInfoaddr = new ArrayList<String>();
		 for (int i = 0; i < tempString1.length; i++) {
			 MemberInfoaddr.add(tempString1[i]);
		}
		 
		 modelAndView.addObject("MemberInfoTel", MemberInfoTel);
		 modelAndView.addObject("MemberInfoaddr", MemberInfoaddr);
		 
		 
		 modelAndView.setViewName("user/myprofile/myprofile");
		
		 
		 return modelAndView;
	 }
	
	 
	
@RequestMapping("updateMemberInfo")	
		public String updateMember(MemberVO memberInfo
				  ) throws Exception{
this.service.updateMemberInfo(memberInfo);


String taskResult = "success";
String message = URLEncoder.encode(" 완료되었습니다.","UTF-8");

return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
}
/*@RequestMapping("updateMemberInfo2")	
public String updateMember2(MemberVO memberInfo
		  ) throws Exception{
this.service.updateMemberInfo(memberInfo);


String taskResult = "success";
String message = URLEncoder.encode(" 완료되었습니다.","UTF-8");

return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
}*/

@RequestMapping("myprofiledelete")
public void myprofiledelete(){}


	 
@RequestMapping("deleteMemberInfo")
public String memberDelete(HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {

	String mem_id = request.getParameter("mem_id");
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("mem_id", mem_id);
	session.invalidate();
	this.service.deleteMemberInfo(params);
	
	
	
	return "redirect:/user/myprofile/myprofile.do";
}

@RequestMapping("myprofilebank")
  public ModelAndView myprofilebank(ModelAndView modelAndView , HttpServletRequest request, String mem_id) throws Exception{
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
	
	ProfileFileVO profileInfo1 = profileservice.selectProfileFileInfo(params);
	MemberVO memberInfo = this.service.memberInfo(params);
	
	 modelAndView.addObject("profileInfo",profileInfo1);
	 modelAndView.addObject("memberInfo", memberInfo);
	 
	 modelAndView.setViewName("user/myprofile/myprofilebank");
	
	return modelAndView;
} 
  


@RequestMapping("myprofilenotice")
public void myprofilenotice(){}
@RequestMapping("myprofileidentity")
public void myprofileidentity(){}




}
