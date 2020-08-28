package kr.or.ddit.myprofile.controller;

import java.net.URLEncoder;
import java.util.HashMap;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	private IProfileFileService profileService;
	@Autowired
	private IMemberDAO dao;
	
	  

	
	
	 @RequestMapping("myprofile")
	  public void myprofile(){}
	
	
@RequestMapping("updateMemberInfo")	
		public String updateMember(MemberVO memberInfo, ProfileFileVO profileInfo
				  ) throws Exception{
this.service.updateMemberInfo(memberInfo);
this.profileService.insertProfileFileInfo(profileInfo);

String taskResult = "success";
String message = URLEncoder.encode(" 완료되었습니다.","UTF-8");

return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
}
@RequestMapping("updateMemberInfo2")	
public String updateMember2(MemberVO memberInfo
		  ) throws Exception{
this.service.updateMemberInfo(memberInfo);


String taskResult = "success";
String message = URLEncoder.encode(" 완료되었습니다.","UTF-8");

return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
}

@RequestMapping("myprofiledelete")
public void myprofiledelete(){}


	 
@RequestMapping("deleteMemberInfo")
public String memberDelete(HttpServletRequest request,
		HttpServletResponse response) throws Exception {

	String mem_id = request.getParameter("mem_id");
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("mem_id", mem_id);
	
	this.service.deleteMemberInfo(params);
	
	return "redirect:/user/myprofile/myprofile.do";
}

@RequestMapping("myprofileidentity")
 public ModelAndView myprofileidentity(String mem_id, 
         HttpSession session)throws Exception{
	Map<String, String> params = new HashMap<String, String>();
ModelAndView modelAndView = new ModelAndView();

params.put("mem_id", mem_id);
MemberVO memberInfo = this.service.memberInfo(params);
session.invalidate();
//ModelMap modelMap = new ModelMap();
modelAndView.addObject("memberInfo", memberInfo);

modelAndView.setViewName("user/myprofile/myprofileidentity");
return modelAndView;

}

@RequestMapping("myprofilenotice")
public void myprofilenotice(){}
}




