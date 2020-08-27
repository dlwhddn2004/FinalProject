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
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;
import kr.or.ddit.vo.newsboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/calendar/")
public class CalendarController {
	@Autowired
	private ICalendarService calendarService;
	
	@RequestMapping("calendar")
	public ModelAndView calendar(HttpServletRequest request,
								 ModelAndView modelAndView,
								 String project_no) throws Exception {
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트 관리");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/calendar/calendar.do?project_no=" + project_no);
		modelAndView.addObject("breadcrumb_second", "캘린더");
		
		modelAndView.addObject("project_no", project_no);
		
		modelAndView.setViewName("user/project/calendar");
		return modelAndView;
	}
	
	@RequestMapping("selectCalendar")
	public ModelAndView selectCalendar(String project_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		List<Map<String, String>> calendarList = calendarService.selectCalendar(params);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("calendarList", calendarList);
		
		modelAndView.setViewName("jsonConvertView");
		return modelAndView;
	}
	
}
