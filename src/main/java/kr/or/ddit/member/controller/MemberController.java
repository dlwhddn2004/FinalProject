package kr.or.ddit.member.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.vo.MemberVO;

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
	
	@RequestMapping("memberList")
	public Model memberList(String search_keycode,
							String search_keyword,
							Map<String, String> params,
							Model model)throws Exception{
//		Map<String, String>params = new HashMap<String, String>();
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		List<MemberVO> memberList = this.service.memberList(params);
		
		// memberList => view resolver => memberList.jsp 전달 (포워딩)
//		Model model = new ExtendedModelMap();
		model.addAttribute("memberList",memberList);
		return model;
	}
	
	@RequestMapping("memberView")
	public ModelAndView memberView(String mem_id,
								Map<String,String> params,
								ModelAndView modelView)throws Exception{
		params.put("mem_id", mem_id);
		MemberVO memberInfo = this.service.memberInfo(params);
		
//		ModelMap modelMap= new ModelMap();
//		modelMap.addAttribute("memberInfo",memberInfo);

		modelView.addObject("memberInfo",memberInfo);
		modelView.setViewName("/user/member/memberView");
//		model,modelmap 은 void와 request랑 합쳐진거라고보면된다.
		return modelView;
	}
	
	@RequestMapping("updateMemberInfo")
	private String updateMember(MemberVO memberInfo)throws Exception{
		this.service.updateMemberInfo(memberInfo);
		
		return "redirect:/user/member/memberList.do";
	}
	
// /user/member/deleteMemberInfo.do?user_id=a001	
// /user/member/deleteMemberInfo/a001.do	
//	@RequestParam은 피라미터값이 반드시 입력되어야한다.는걸 알려줌 @RequestParam(required=기본값은 true)
	// @RequestParam(required=false, defaultValue="a001") 은 만약에 필수로입력되어야하는 값이 null이면 대체값은 a001이 되는것.
	@RequestMapping("deleteMemberInfo/{user_id}")
//	public String deleteMemberInfo(@RequestParam(required=false, defaultValue="a001") String mem_id, Map<String,String> params) throws Exception{
	//@PathVariable는 url로 넘겨올때 오는 매핑되어있는 변수를 맞게해주는거
	public String deleteMemberInfo(@PathVariable("user_id") String mem_id, Map<String,String> params) throws Exception{
		params.put("mem_id",mem_id);
		
		this.service.deleteMemberInfo(params);
		String message = URLEncoder.encode("회원 탈퇴하셨습니다", "UTF-8");
		return "redirect:/user/member/memberList.do?message="+message;
	}
	
	@RequestMapping("memberForm")
	public void memberForm(){}
	
	@RequestMapping("insertMemberInfo")
	public String insertMemberInfo(MemberVO memberInfo, @RequestBody String totalparam,
									RedirectAttributes redirectAttributes)throws Exception{ //도메인 오브젝트 한번에 다 받아짐
		this.service.insertMemberInfo(memberInfo);
		
//		System.out.println("@RequestBody : "+ totalparam);
//		String message = this.accesser.getMessage("cop.regist.msg.confirm",Locale.KOREA);
//		message= URLEncoder.encode(message,"UTF-8");
//		return "redirect:/user/join/loginForm.do?message="+message;
		redirectAttributes.addFlashAttribute("message","회원가입이 완료되었습니다!!");
		return "redirect:/user/join/loginForm.do";
	}
	
//	@RequestMapping("idCheck")
//	@ResponseBody
//	public String idCheck(@RequestParam String mem_id,
//						  Map<String,String> params,
//						  Map<String,String> jsonMap) throws Exception{
//		params.put("mem_id", mem_id);
//		MemberVO memberInfo = this.service.memberInfo(params);
//		
//		if(memberInfo ==null){
//			jsonMap.put("flag", "true");
//		}else{
//			jsonMap.put("flag", "false");
//		}
//		String jsonData= this.Mapper.writeValueAsString(jsonMap);
//		return jsonData;
//	}
	
	@RequestMapping("idCheck")
	public ModelAndView idCheck(@RequestParam String mem_id,
			Map<String,String> params) throws Exception{
		params.put("mem_id", mem_id);
		MemberVO memberInfo = this.service.memberInfo(params);
		
		// Model(view 대상 전송데이타 저장) + String (View 경로와 이름)
		ModelAndView modelView = new ModelAndView();
		modelView.addObject("memberInfo",memberInfo);
		// <bean id="jsonConvertView" class="...MappingJackson2..." 쉽게 말해서  json클래스를 사용하는 bean에 저장
		modelView.setViewName("jsonConvertView");
		
		return modelView;
	}
	
}





