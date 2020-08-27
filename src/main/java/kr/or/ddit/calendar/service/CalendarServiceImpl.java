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

	@Override
	public List<CalendarVO> selectCalendar(Map<String, String> params)
			throws Exception {
		return dao.selectCalendar(params);
	}
}
