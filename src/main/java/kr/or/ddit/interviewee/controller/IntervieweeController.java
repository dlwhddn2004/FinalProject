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
}
