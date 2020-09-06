package kr.or.ddit.interview.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.interview.dao.IInterviewDao;
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
public class InterviewServiceImpl implements IInterviewService {
	
//	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
//	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	
	@Autowired
	private IInterviewDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectNotConfirmApplyList(
			Map<String, String> params) throws Exception {
		return dao.selectNotConfirmApplyList(params);
	}
	
	// ********************************************* JSON ********************************************* //
	
	// 신청자 명단
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectConfirmApplyList(Map<String, String> params)
			throws Exception {
		return dao.selectConfirmApplyList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> infographic(Map<String, String> params)
			throws Exception {
		return dao.infographic(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int hireMember(Map<String, String> params) throws Exception {
		return dao.hireMember(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> selectMypageDeveloper(Map<String, String> params)
			throws Exception {
		return dao.selectMypageDeveloper(params);
	}

	// 면접 캘린더
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CalendarVO> selectInterviewCalendar(
			Map<String, String> params) throws Exception {
		return dao.selectInterviewCalendar(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertInterviewCalendar(Map<String, String> params)
			throws Exception {
		return dao.insertInterviewCalendar(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> selectMemberInfo(Map<String, String> params)
			throws Exception {
		return dao.selectMemberInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int modifyInterviewCalendar(Map<String, String> params)
			throws Exception {
		return dao.modifyInterviewCalendar(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteInterviewCalendar(Map<String, String> params)
			throws Exception {
		return dao.deleteInterviewCalendar(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> selectProjectApply(Map<String, String> params)
			throws Exception {
		return dao.selectProjectApply(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertInterview(Map<String, String> params) throws Exception {
		return dao.insertInterview(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> selectInterview(Map<String, String> params)
			throws Exception {
		return dao.selectInterview(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateInterview(Map<String, String> params) throws Exception {
		return dao.updateInterview(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateInterviewCalendar(Map<String, String> params)
			throws Exception {
		return dao.updateInterviewCalendar(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertInterviewee(Map<String, String> params) throws Exception {
		return dao.insertInterviewee(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteProjectApply(Map<String, String> params) throws Exception {
		return dao.deleteProjectApply(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> selectIntervieweeInfo(Map<String, String> params)
			throws Exception {
		return dao.selectIntervieweeInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteInterviewee(Map<String, String> params) throws Exception {
		return dao.deleteInterviewee(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertProjectApply(Map<String, String> params) throws Exception {
		return dao.insertProjectApply(params);
	}
}
