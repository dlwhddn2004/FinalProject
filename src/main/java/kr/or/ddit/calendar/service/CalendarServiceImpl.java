package kr.or.ddit.calendar.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.calendar.dao.ICalendarDao;
import kr.or.ddit.successboard.dao.ISuccessBoardDao;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CalendarServiceImpl implements ICalendarService {
	@Autowired
	private ICalendarDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CalendarVO> selectCalendar(Map<String, String> params)
			throws Exception {
		return dao.selectCalendar(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertCalendar(Map<String, String> params) throws Exception {
		return dao.insertCalendar(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateCalendar(Map<String, String> params) throws Exception {
		return dao.updateCalendar(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteCalendar(Map<String, String> params) throws Exception {
		return dao.deleteCalendar(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int modifyCalendar(Map<String, String> params) throws Exception {
		return dao.modifyCalendar(params);
	}
}
