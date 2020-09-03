package kr.or.ddit.interview.controller;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/interview/")
public class InterviewController {
	
	@Autowired
	private IInterviewService interviewService;
	
	@RequestMapping("partnersMain")
	public ModelAndView successList(HttpServletRequest request,
									ModelAndView modelAndView,
									String mem_id,
									String project_no) throws Exception {
	
	// breadcrumb
	modelAndView.addObject("breadcrumb_title", "프로젝트");
	modelAndView.addObject("breadcrumb_first", "프로젝트 상세");
	modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/projectView.do?mem_id=" + mem_id + "&project_no=" + project_no);
	modelAndView.addObject("breadcrumb_second", "면접");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("project_no", project_no);
	
	List<Map<String, String>> notApplyMemList = interviewService.selectNotConfirmApplyList(params);
	
	for (Map<String, String> item : notApplyMemList) {
		String DBTechData = String.valueOf(item.get("MYPAGE_TECHNOLOGIES"));
		String mem_bir = String.valueOf(item.get("MEM_BIR"));
		
		Date nowDate = new Date();
		SimpleDateFormat format = new SimpleDateFormat("YYYY");
		int currentYear = Integer.parseInt(format.format(nowDate));
		int memYear = Integer.parseInt(mem_bir.substring(0, 4));
		
		String mem_age = String.valueOf((currentYear - memYear) + 1);
		
		String[] arr = DBTechData.split(",");
		for (int i = 0; i < arr.length; i++) {
			if (arr[i].equals("1")) {
				item.put("ANGULAR", "ANGULAR");
			} else if (arr[i].equals("2")) {
				item.put("BOOTSTRAP", "BOOTSTRAP");
			} else if (arr[i].equals("3")) {
				item.put("REACT", "REACT");
			} else if (arr[i].equals("4")) {
				item.put("VUE", "VUE");
			}
		}
		
		item.put("MEM_AGE", mem_age);
	}
	
	modelAndView.addObject("project_no", project_no);
	modelAndView.addObject("notApplyMemList", notApplyMemList);
	
	modelAndView.setViewName("user/interview/interview-partners");
	
	return modelAndView;
	}
	
	
	/** --------------------------------------------- 면접 --------------------------------------------- */
	/**
	 * 신청자 명단
	 */
	
	
	/**
	 * 면접 캘린더
	 */
	
	// 일정 추가
	@RequestMapping("insertInterviewCalendar")
	@ResponseBody
	public Map<String, String> insertInterviewCalendar(String project_no,
													   String title,
													   String start,
													   String end,
													   String allday,
													   String className,
													   String description) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("title", title);
		params.put("start", start);
		params.put("end", end);
		params.put("allday", allday);
		params.put("className", className);
		params.put("description", description);
		
		String id = interviewService.insertInterviewCalendar(params);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("id", id);
		
		return resultMap;
	}
	
	
	// ********************************************* JSON ********************************************* //
	
	/**
	 * 신청자 명단
	 */
	
	// 신청한 사람 중 통과한 목록 조회
	@RequestMapping("selectConfirmApplyList")
	@ResponseBody
	public List<Map<String, String>> selectConfirmApplyList(String project_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		
		List<Map<String, String>> applyMemList = interviewService.selectConfirmApplyList(params);
		
		return applyMemList;
	}
	
	// 인포 그래픽
	@RequestMapping("infographic")
	@ResponseBody
	public Map<String, String> infographic(String mem_id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		
		Map<String, String> infographicData = interviewService.infographic(params);
		
		String mem_bir = String.valueOf(infographicData.get("MEM_BIR"));
		
		// 나이 데이터 생성
		Date nowDate = new Date();
		SimpleDateFormat format = new SimpleDateFormat("YYYY");
		int currentYear = Integer.parseInt(format.format(nowDate));
		int memYear = Integer.parseInt(mem_bir.substring(0, 4));
		
		String mem_age = String.valueOf((currentYear - memYear) + 1);
		
		infographicData.put("MEM_AGE", mem_age);
		
		return infographicData;
	}
	
	
	
	/**
	 * 면접 캘린더
	 */
	
	// 캘린더 목록 조회 (프로젝트 번호 조건)
	@RequestMapping("selectInterviewCalendar")
	@ResponseBody
	public List<CalendarVO> selectInterviewCalendar(String project_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		
		List<CalendarVO> calendarList = interviewService.selectInterviewCalendar(params);
		
		return calendarList;
	}
	
	// 캘린더 수정 시 면접자 정보 조회 (아이디 조건)
	@RequestMapping("selectMemberInfo")
	@ResponseBody
	public Map<String, String> selectMemberInfo(String mem_id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		
		Map<String, String> memberInfo = interviewService.selectMemberInfo(params);
		
		return memberInfo;
	}
	
	// 캘린더 내용 수정
	@RequestMapping("modifyInterviewCalendar")
	@ResponseBody
	public Map<String, String> modifyInterviewCalendar(String title,
													   String id,
													   String className,
													   String start,
													   String end,
													   String description) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("title", title);
		params.put("id", id);
		params.put("className", className);
		params.put("start", start);
		params.put("end", end);
		params.put("description", description);
		
		int chk = interviewService.modifyInterviewCalendar(params);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		if (chk > 0) {
			resultMap.put("result", "Y");
		} else {
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
	
	// 캘린더 이벤트 삭제
	@RequestMapping("deleteInterviewCalendar")
	@ResponseBody
	public Map<String, String> deleteInterviewCalendar(String id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		
		int chk = interviewService.deleteInterviewCalendar(params);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		if (chk > 0) {
			resultMap.put("result", "Y");
		} else {
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
	
}
