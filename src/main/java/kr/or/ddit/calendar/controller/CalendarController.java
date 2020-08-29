package kr.or.ddit.calendar.controller;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.calendar.service.ICalendarService;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/calendar/")
public class CalendarController {
	@Autowired
	private ICalendarService calendarService;
	
	@RequestMapping("calendar")
	public ModelAndView calendar(HttpServletRequest request,
								 ModelAndView modelAndView,
								 String mem_id,
								 String project_no) throws Exception {
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/project.do?mem_id=" + mem_id);
		modelAndView.addObject("breadcrumb_second", "캘린더");
		
		modelAndView.addObject("project_no", project_no);
		
		modelAndView.setViewName("user/project/calendar");
		return modelAndView;
	}
	
	@RequestMapping("selectCalendar")
	@ResponseBody
	public List<CalendarVO> selectCalendar(String project_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		List<CalendarVO> calendarList = calendarService.selectCalendar(params);
		
		return calendarList;
	}
	
	@RequestMapping("insertCalendar")
	@ResponseBody
	public Map<String, Object> insertCalendar(String project_no,
											  String id,
											  String title,
											  String start,
											  String end,
											  String allday,
											  String className,
											  String description) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("id", id);
		params.put("title", title);
		params.put("start", start);
		params.put("end", end);
		params.put("allday", allday);
		params.put("className", className);
		params.put("description", description);
		
		String result_id = calendarService.insertCalendar(params);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("id", result_id);
		return result;
	}
	
	@RequestMapping("updateCalendar")
	@ResponseBody
	public Map<String, Object> updateCalendar(String id,
											  String start,
											  String end) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("start", start);
		params.put("end", end);
		int chk = calendarService.updateCalendar(params);
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		if (chk > 0) {
			jsonMap.put("result", "Y");
		} else {
			jsonMap.put("result", "N");
		}
		return jsonMap;
	}
	
	@RequestMapping("deleteCalendar")
	@ResponseBody
	public Map<String, Object> deleteCalendar(String id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		System.out.println(id);
		params.put("id", id);
		int chk = calendarService.deleteCalendar(params);
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		if (chk > 0) {
			jsonMap.put("result", "Y");
		} else {
			jsonMap.put("result", "N");
		}
		return jsonMap;
	}
	
	@RequestMapping("modifyCalendar")
	@ResponseBody
	public Map<String, Object> modifyCalendar(String id,
											  String title,
											  String className,
											  String description) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("title", title);
		params.put("className", className);
		params.put("description", description);
		int chk = calendarService.modifyCalendar(params);
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		if (chk > 0) {
			jsonMap.put("result", "Y");
		} else {
			jsonMap.put("result", "N");
		}
		return jsonMap;
	}
	
}
