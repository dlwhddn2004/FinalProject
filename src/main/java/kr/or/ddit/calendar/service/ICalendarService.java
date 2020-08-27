package kr.or.ddit.calendar.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface ICalendarService {
	public List<CalendarVO> selectCalendar(Map<String, String> params) throws Exception;
	public String insertCalendar(Map<String, String> params) throws Exception;
	public int updateCalendar(Map<String, String> params) throws Exception;
	public int deleteCalendar(Map<String, String> params) throws Exception;
	public int modifyCalendar(Map<String, String> params) throws Exception;
}
