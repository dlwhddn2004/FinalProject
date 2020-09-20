package kr.or.ddit.find.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.find.service.IFindService;
import kr.or.ddit.projectsupport.service.IProjectSupportService;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user/find/")
public class FindController {
	
	@Autowired
	private IFindService findservice;
	@Autowired
	private IProjectSupportService projectSupportService;
	
	@RequestMapping("findIDMail")
	@ResponseBody
	public Map<String, String> findIDMail(String mem_name,
										  String mem_mail)throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_name", mem_name);
		params.put("mem_mail", mem_mail);
		
		Map<String, String> memberInfo = findservice.findIDMail(params);
		
		
		
		return memberInfo;
		
	}
	
	@RequestMapping("findIDTel")
	@ResponseBody
	public Map<String, String> findIDTel(String mem_name,
										 String mem_tel) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_name", mem_name);
		params.put("mem_tel", mem_tel);
		
		Map<String, String> memberInfo = findservice.findIDTel(params);
		
		return memberInfo;
		
	}
	
	@RequestMapping("findPW")
	@ResponseBody
	public Map<String, String> findPW(String mem_name,
									  String mem_id,
									  String mem_mail) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("mem_name", mem_name);
		params.put("mem_mail", mem_mail);
		
		Map<String, String> memberInfo = findservice.findPW(params);
		String name = String.valueOf(memberInfo.get("MEM_NAME"));
		int ranNum = projectSupportService.generateRandNum(6);
		params.put("mem_pass", String.valueOf(ranNum));
		
		findservice.updatePW(params);
		
		projectSupportService.sendMail(mem_mail, "CONNECTOR 비밀번호 찾기 메일입니다.", "안녕하세요 CONNECTOR입니다 "+ name +"님의 임시 비밀번호는 "+ ranNum + "입니다.");
		
		return memberInfo;
	}
	

}
