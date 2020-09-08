package kr.or.ddit.interview.controller;

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
	 * 면접 설정
	 */
	
	// 기본 정보 설정
	@RequestMapping("insertInterview")
	@ResponseBody
	public Map<String, String> insertInterview(String interview_title,
											   String interview_hire_shape,
											   String interview_division,
											   String interview_tech,
											   String interview_peoplenum,
											   String interview_method,
											   String interview_authentication,
											   String project_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("interview_title", interview_title);
		params.put("interview_hire_shape", interview_hire_shape);
		params.put("interview_division", interview_division);
		params.put("interview_tech", interview_tech);
		params.put("interview_peoplenum", interview_peoplenum);
		params.put("interview_method", interview_method);
		params.put("interview_authentication", interview_authentication);
		params.put("project_no", project_no);
		
		String interview_no = interviewService.insertInterview(params);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("INTERVIEW_NO", interview_no);
		
		return resultMap;
	}
	
	
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
		
		
		for (Map<String, String> item : applyMemList) {
			params.put("mem_id", String.valueOf(item.get("MEM_ID")));
			Map<String, String> mypageDeveloperInfo = interviewService.selectMypageDeveloper(params);
			
			String DBTechData = String.valueOf(mypageDeveloperInfo.get("MYPAGE_TECHNOLOGIES"));
			
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
			
			String mem_bir = String.valueOf(item.get("MEM_BIR"));
			
			Date nowDate = new Date();
			SimpleDateFormat format = new SimpleDateFormat("YYYY");
			int currentYear = Integer.parseInt(format.format(nowDate));
			int memYear = Integer.parseInt(mem_bir.substring(0, 4));
			
			String mem_age = String.valueOf((currentYear - memYear) + 1);
			item.put("MEM_AGE", mem_age);
		}
		
		
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
	
	// 인포 그래픽 HIRE
	@RequestMapping("hireMember")
	@ResponseBody
	public Map<String, String> hireMember(String mem_id,
										  String project_no,
										  String apply_status) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("project_no", project_no);
		params.put("apply_status", apply_status);
		
		int chk = interviewService.hireMember(params);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		if (chk > 0) {
			resultMap.put("result", "Y");
		} else {
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
	
	// 신청자 명단 리스트 조회
	@RequestMapping("selectApplyList")
	@ResponseBody
	public List<Map<String, String>> selectApplyList(String project_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		
		List<Map<String, String>> notApplyMemList = interviewService.selectNotConfirmApplyList(params);
		
		for (Map<String, String> item : notApplyMemList) {
			params.put("mem_id", String.valueOf(item.get("MEM_ID")));
			Map<String, String> mypageDeveloperInfo = interviewService.selectMypageDeveloper(params);
			
			String DBTechData = String.valueOf(mypageDeveloperInfo.get("MYPAGE_TECHNOLOGIES"));
			
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
			
			String mem_bir = String.valueOf(item.get("MEM_BIR"));
			
			Date nowDate = new Date();
			SimpleDateFormat format = new SimpleDateFormat("YYYY");
			int currentYear = Integer.parseInt(format.format(nowDate));
			int memYear = Integer.parseInt(mem_bir.substring(0, 4));
			
			String mem_age = String.valueOf((currentYear - memYear) + 1);
			item.put("MEM_AGE", mem_age);
		}
		
		return notApplyMemList;
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
	public Map<String, String> deleteInterviewCalendar(String id,
													   String var_first_description,
													   String project_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("project_no", project_no);
		
		int chk = interviewService.deleteInterviewCalendar(params);
		
		String[] description_arr = var_first_description.split(",");
		for (int i = 0; i < description_arr.length; i++) {
			params.put("mem_id", description_arr[i]);
			params.put("apply_status", "Y");
			interviewService.deleteInterviewee(params);
			interviewService.insertProjectApply(params);
		}
		
		Map<String, String> resultMap = new HashMap<String, String>();
		if (chk > 0) {
			resultMap.put("result", "Y");
		} else {
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
	
	// 캘린더 드래그 앤 드롭
	@RequestMapping("updateInterviewCalendar")
	@ResponseBody
	public Map<String, String> updateInterviewCalendar(String id,
													   String start,
													   String end) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("start", start);
		params.put("end", end);
		
		int chk = interviewService.updateInterviewCalendar(params);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		if (chk > 0) {
			resultMap.put("result", "Y");
		} else {
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
	
	/**
	 * 공통
	 */
	
	// project_apply 테이블에서 mem_id로 조회
	@RequestMapping("selectProjectApply")
	@ResponseBody
	public Map<String, String> selectProjectApply(String mem_id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		
		return interviewService.selectProjectApply(params);
	}
	
	@RequestMapping("selectInterview")
	@ResponseBody
	public Map<String, String> selectInterview(String project_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		
		return interviewService.selectInterview(params);
	}
	
	@RequestMapping("updateInterview")
	@ResponseBody
	public Map<String, String> updateInterview(String project_no,
											   String interview_customizing) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("interview_customizing", interview_customizing);
		
		int chk = interviewService.updateInterview(params);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		if (chk > 0) {
			resultMap.put("result", "Y");
		} else {
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
	
	@RequestMapping("assignInterviewSchedule")
	@ResponseBody
	public Map<String, String> assignInterviewSchedule(String project_no,
													   String all_mem_id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		
		String[] mem_id_arr = all_mem_id.split(",");
		
		boolean result = true;
		for (int i = 0; i < mem_id_arr.length; i++) {
			params.put("mem_id", mem_id_arr[i]);
			int chk = interviewService.insertInterviewee(params);
			
			if (!(chk > 0)) {
				result = false;
			}
			
			chk = interviewService.deleteProjectApply(params);
			
			if (!(chk > 0)) {
				result = false;
			}
		}
		
		Map<String, String> resultMap = new HashMap<String, String>();
		if (result) {
			resultMap.put("result", "Y");
		} else if (!result) {
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
	
	@RequestMapping("modifyIntervieweeMember")
	@ResponseBody
	public Map<String, String> modifyIntervieweeMember(String project_no,
													   String var_first_description,
													   String description) throws Exception {
		// 중복 제거
		String[] first_status = var_first_description.split(",");
		String[] last_status = description.split(",");
		
		ArrayList<String> firstList = new ArrayList<String>();
		ArrayList<String> lastList = new ArrayList<String>();
		
		for (int i = 0; i < first_status.length; i++) {
			firstList.add(first_status[i]);
		}
		for (int i = 0; i < last_status.length; i++) {
			lastList.add(last_status[i]);
		}
		
		for (int i = 0; i < firstList.size(); i++) {
			for (int j = 0; j < lastList.size(); j++) {
				if (firstList.get(i).equals(lastList.get(j))) {
					firstList.remove(i);
					lastList.remove(j);
				}
			}
		}
		
		// --> firstList, lastList에서 중복이 제거되었음.
		
		// interviewee 테이블에서 먼저 조회
		//   -> 1. 값이 존재함
		//           - interviewee 테이블에서 데이터 삭제
		//           - project_apply 테이블에 데이터 생성
		//   -> 2. 값이 존재하지 않음
		//           - interviewee 테이블에 데이터 생성
		//           - project_apply 테이블에서 데이터 삭제
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		
		for (String firstListItem : firstList) {
			params.put("mem_id", firstListItem);
			Map<String, String> intervieweeInfo = interviewService.selectIntervieweeInfo(params);
			
			if (intervieweeInfo != null) {
				params.put("apply_status", "Y");
				interviewService.deleteInterviewee(params);
				interviewService.insertProjectApply(params);
			} else {
				interviewService.insertInterviewee(params);
				interviewService.deleteProjectApply(params);
			}
		}
		
		for (String lastListItem : lastList) {
			params.put("mem_id", lastListItem);
			Map<String, String> intervieweeInfo = interviewService.selectIntervieweeInfo(params);
			
			if (intervieweeInfo != null) {
				params.put("apply_status", "Y");
				interviewService.deleteInterviewee(params);
				interviewService.insertProjectApply(params);
			} else {
				interviewService.insertInterviewee(params);
				interviewService.deleteProjectApply(params);
			}
		}
		
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("result", "Y");
		
		return resultMap;
	}
	
	@RequestMapping("projectApplyForm")
	public ModelAndView projectApplyForm(ModelAndView modelAndView,
									 HttpServletRequest request,
									 String mem_id,
									 String project_no) throws Exception {
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트 찾기");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/projectsearch/projectsearch.do");
		modelAndView.addObject("breadcrumb_second", "프로젝트 신청");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("mem_id", mem_id);
		
		Map<String, String> interviewInfo = interviewService.selectInterview(params);
		modelAndView.addObject("interviewInfo", interviewInfo);
		
		int successProjectCnt = interviewService.selectSuccessProjectCnt(params);
		int insertPortfolioCnt = interviewService.selectInsertPortfolioCnt(params);
		int CareerCnt = interviewService.selectCareerCnt(params);
		
		modelAndView.addObject("successProjectCnt", successProjectCnt);
		modelAndView.addObject("insertPortfolioCnt", insertPortfolioCnt);
		modelAndView.addObject("CareerCnt", CareerCnt);
		
		Map<String, String> myPageDeveloperInfo = interviewService.selectMypageDeveloper(params);
		String[] techExperienceArr = (String.valueOf(myPageDeveloperInfo.get("MYPAGE_TECHEXPERIENCE"))).split(",");
		
		modelAndView.addObject("techExperienceArr", techExperienceArr);
		
		modelAndView.setViewName("user/interview/projectApplyForm");
		
		return modelAndView;
	}
	
	
	@RequestMapping("interviewRTC")
	public ModelAndView interviewRTC(ModelAndView modelAndView,
									 HttpServletRequest request,
									 String mem_id,
									 String project_no) {
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트 상세");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/projectView.do?mem_id=" + mem_id + "&project_no=" + project_no);
		modelAndView.addObject("breadcrumb_second", "면접");
		
		modelAndView.setViewName("user/interview/interviewRTC");
		
		return modelAndView;
	}
	
	@RequestMapping("interviewRTCRoom")
	public ModelAndView interviewRTCRoom(ModelAndView modelAndView,
									 HttpServletRequest request,
									 String mem_id,
									 String project_no) {
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트 상세");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/projectView.do?mem_id=" + mem_id + "&project_no=" + project_no);
		modelAndView.addObject("breadcrumb_second", "면접");
		
		modelAndView.setViewName("user/interview/interviewRTCRoom");
		
		return modelAndView;
	}
}
