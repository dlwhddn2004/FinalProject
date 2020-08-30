package kr.or.ddit.timeline.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.successboard.dao.ISuccessBoardDao;
import kr.or.ddit.timeline.dao.ITimelineDao;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TimelineServiceImpl implements ITimelineService {
	
	@Autowired
	private ITimelineDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectTimelineList(
			Map<String, String> params) throws Exception {
		return dao.selectTimelineList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertTimeline(Map<String, String> params) throws Exception {
		return dao.insertTimeline(params);
	}
}
