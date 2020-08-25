package kr.or.ddit.myprofile.controller;

import java.net.URLEncoder;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProfileFileVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	 @RequestMapping("myprofile")
	  public void myprofile(){}
	
	
@RequestMapping("updateMemberInfo")	
		public String updateMember(MemberVO memberInfo
				  ) throws Exception{
this.service.updateMemberInfo(memberInfo);


String taskResult = "success";
String message = URLEncoder.encode("등록이 완료되었습니다.","UTF-8");

return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
}
}


