package kr.or.ddit.calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/calendar/")
public class CalendarController {
	
	@RequestMapping("calendar")
	public void calendarView() {
	}
	
	@RequestMapping("scheduleData")
	public void scheduleData(HttpServletRequest request,
						     HttpServletResponse response,
						     ModelAndView modelAndView) {
		try {
			String jsonData = "[{\"_id\": 1,\"title\": \"거래처 미팅\",\"description\": \"Lorem ipsum dolor sit incid idunt ut Lorem ipsum sit.\",\"start\": \"2019-05-07T09:30\",\"end\": \"2019-05-07T15:00\",\"type\": \"카테고리1\",\"username\": \"다현\",\"backgroundColor\": \"#D25565\",\"textColor\": \"#ffffff\",\"allDay\": false}]";
			
			response.setHeader("Content-Type", "application/xml"); 
			response.setContentType("text/xml;charset=UTF-8"); 
			response.setCharacterEncoding("utf-8");
			
			response.getWriter().print(jsonData);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
