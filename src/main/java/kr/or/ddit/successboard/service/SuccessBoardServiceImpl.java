package kr.or.ddit.successboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.successboard.dao.ISuccessBoardDao;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SuccessBoardServiceImpl implements ISuccessBoardService {
	
	@Autowired
	private ISuccessBoardDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<SuccessBoardVO> successboardList() throws Exception {
		return dao.successboardList();
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<JoinVO> attendProjectList(Map<String, String> params)
			throws Exception {
		return dao.attendProjectList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public SuccessBoardVO selectSuccessBoardInfo(Map<String, String> params)
			throws Exception {
		return dao.selectSuccessBoardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertSuccessBoard(SuccessBoardVO successboardInfo)
			throws Exception {
		return dao.insertSuccessBoard(successboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int modifySuccessBoard(SuccessBoardVO successboardInfo)
			throws Exception {
		return dao.modifySuccessBoard(successboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteSuccessBoard(Map<String, String> params) throws Exception {
		return dao.deleteSuccessBoard(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<SuccessBoardCommentVO> selectCommentList(
			Map<String, String> params) throws Exception {
		return dao.selectCommentList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertSuccessComment(SuccessBoardCommentVO successCommentInfo)
			throws Exception {
		return dao.insertSuccessComment(successCommentInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteSuccessComment(Map<String, String> params)
			throws Exception {
		return dao.deleteSuccessComment(params);
	}
}
