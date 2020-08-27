package kr.or.ddit.calendar.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.lowagie.text.Paragraph;

@Repository
public class CanlendarDaoImpl implements ICalendarDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<CalendarVO> selectCalendar(Map<String, String> params)
			throws Exception {
		return client.queryForList("calendar.selectCalendar", params);
	}

	@Override
	public String insertCalendar(Map<String, String> params) throws Exception {
		return (String) client.insert("calendar.insertCalendar", params);
	}

	@Override
	public int updateCalendar(Map<String, String> params) throws Exception {
		return client.update("calendar.updateCalendar", params);
	}

	@Override
	public int deleteCalendar(Map<String, String> params) throws Exception {
		return client.delete("calendar.deleteCalendar", params);
	}

	@Override
	public int modifyCalendar(Map<String, String> params) throws Exception {
		return client.update("calendar.modifyCalendar", params);
	}
}
