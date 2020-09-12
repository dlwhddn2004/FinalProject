package kr.or.ddit.interviewee.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.interview.dao.IInterviewDao;
import kr.or.ddit.interviewee.dao.IIntervieweeDao;
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
public class IntervieweeServiceImpl implements IIntervieweeService {
//	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
//	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	
	@Autowired
	private IIntervieweeDao dao;

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateInterviewee(Map<String, String> params) throws Exception {
		return dao.updateInterviewee(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectEndInterviewee(String project_no)
			throws Exception {
		return dao.selectEndInterviewee(project_no);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public boolean confirmInterviewee(Map<String, String> params)
			throws Exception {
		return dao.confirmInterviewee(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public boolean failInterviewee(Map<String, String> params) throws Exception {
		return dao.failInterviewee(params);
	}
}