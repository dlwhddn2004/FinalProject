package kr.or.ddit.interviewee.controller;

import java.io.Reader;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.interview.service.IInterviewService;
import kr.or.ddit.interviewee.service.IIntervieweeService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.successboard.service.ISuccessBoardService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;
import kr.or.ddit.vo.newsboardVO;

import org.openxmlformats.schemas.spreadsheetml.x2006.main.STRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lowagie.text.pdf.AcroFields.Item;

@Controller
@RequestMapping("/user/interviewee/")
public class IntervieweeController {
	@Autowired
	private IIntervieweeService intervieweeService;
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping("updateInterviewee")
	@ResponseBody
	public Map<String, String> updateInterviewee(String mem_id,
												 String project_no,
												 String interviewee_passion,
												 String interviewee_ability,
												 String interviewee_resolution,
												 String interviewee_strategy,
												 String interviewee_relationship) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("project_no", project_no);
		params.put("interviewee_passion", interviewee_passion);
		params.put("interviewee_ability", interviewee_ability);
		params.put("interviewee_resolution", interviewee_resolution);
		params.put("interviewee_strategy", interviewee_strategy);
		params.put("interviewee_relationship", interviewee_relationship);
		
		int chk = intervieweeService.updateInterviewee(params);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		if (chk > 0) {
			resultMap.put("result", "Y");
		} else {
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
	
	@RequestMapping("loadTabTab1")
	@ResponseBody
	public List<Map<String, String>> loadTabTab1(String project_no) throws Exception {
		List<Map<String, String>> endIntervieweeList = intervieweeService.selectEndInterviewee(project_no);
		
		List<Map<String, String>> resultList = new ArrayList<Map<String,String>>();
		Map<String, String> params = new HashMap<String, String>();
		for (Map<String, String> item : endIntervieweeList) {
			String mem_id = String.valueOf(item.get("MEM_ID"));
			
			// MEMBER의 상세 정보를 조회
			params.put("mem_id", mem_id);
			Map<String, String> memberInfo = memberService.selectMemberInfo(params);
			
			// MEMBER의 평균 등급을 계산
			int rateAvg = 0;
			String[] category_arr = {"INTERVIEWEE_PASSION", "INTERVIEWEE_ABILITY", "INTERVIEWEE_RESOLUTION", "INTERVIEWEE_STRATEGY", "INTERVIEWEE_RELATIONSHIP"};
			for (int i = 0; i < category_arr.length; i++) {
				String category_name = category_arr[i];
				
				if ((String.valueOf(item.get(category_name))).equals("A")) {
					rateAvg += 4;
				} else if ((String.valueOf(item.get(category_name))).equals("B")) {
					rateAvg += 3;
				} else if ((String.valueOf(item.get(category_name))).equals("C")) {
					rateAvg += 2;
				} else if ((String.valueOf(item.get(category_name))).equals("D")) {
					rateAvg += 1;
				}
			}
			
			memberInfo.put("AVG", String.valueOf(rateAvg));
			resultList.add(memberInfo);
		}
		
		return resultList;
	}
	
	@RequestMapping("confirmInterviewee")
	@ResponseBody
	public Boolean confirmInterviewee(String project_no,
									  String mem_id_all) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("mem_id_all", mem_id_all);
		params.put("interviewee_status", "Y");
		
		return intervieweeService.confirmInterviewee(params);
	}
	
	@RequestMapping("failInterviewee")
	@ResponseBody
	public Boolean failInterviewee(String project_no,
								   String mem_id_all) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("mem_id_all", mem_id_all);
		
		return intervieweeService.failInterviewee(params);
	}
}
