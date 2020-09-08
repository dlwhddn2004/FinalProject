package kr.or.ddit.projectApply.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.interview.dao.IInterviewDao;
import kr.or.ddit.interviewee.dao.IIntervieweeDao;
import kr.or.ddit.projectApply.dao.IProjectApplyDao;
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
public class ProjectApplyServiceImpl implements IProjectApplyService {
//	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
//	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	
	@Autowired
	private IProjectApplyDao dao;

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertProjectApplyInformation(Map<String, String> params)
			throws Exception {
		return dao.insertProjectApplyInformation(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> selectProjectApplyInfo(Map<String, String> params)
			throws Exception {
		return dao.selectProjectApplyInfo(params);
	}
}