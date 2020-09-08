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
}