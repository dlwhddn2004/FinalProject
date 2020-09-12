package kr.or.ddit.riskboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.riskboard.dao.IRiskboardDAO;
import kr.or.ddit.vo.RiskJoinVO;
import kr.or.ddit.vo.RiskboardCommentVO;
import kr.or.ddit.vo.RiskboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RiskboardServiceImpl implements IRiskboardService{
	
	@Autowired
	private IRiskboardDAO riskboardDAO;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<RiskJoinVO> riskboardList(Map<String, String> params)
			throws Exception {
		return riskboardDAO.riskboardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public RiskboardVO riskboardInfo(Map<String, String> params)
			throws Exception {
		return riskboardDAO.riskboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertRiskboard(RiskboardVO riskboardInfo) throws Exception {
		return riskboardDAO.insertRiskboard(riskboardInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateRiskboard(RiskboardVO riskboardInfo) throws Exception {
		return riskboardDAO.updateRiskboard(riskboardInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteRiskboard(Map<String, String> params) throws Exception {
		return riskboardDAO.deleteRiskboard(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateHit(Map<String, String> params) throws Exception {
		return riskboardDAO.updateHit(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<RiskboardCommentVO> commentList(Map<String, String> params)
			throws Exception {
		return riskboardDAO.commentList(params);

	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertComment(RiskboardCommentVO riskcommentInfo)
			throws Exception {
		return riskboardDAO.insertComment(riskcommentInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})	
	@Override
	public int updateComment(Map<String, String> params) throws Exception {
		return riskboardDAO.updateComment(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteComment(Map<String, String> params) throws Exception {
		return riskboardDAO.deleteComment(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateErrorStatus(RiskboardVO riskboardInfo) throws Exception {
		return riskboardDAO.updateErrorStatus(riskboardInfo);
	}
	
	

}
