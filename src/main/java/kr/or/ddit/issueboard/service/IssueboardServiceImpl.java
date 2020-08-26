package kr.or.ddit.issueboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.issueboard.dao.IIssueboardDAO;
import kr.or.ddit.vo.IssueJoinVO;
import kr.or.ddit.vo.IssueboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IssueboardServiceImpl implements IIssueboardService{
	
	@Autowired
	private IIssueboardDAO issueboardDAO;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<IssueJoinVO> issueboardList(Map<String, String> params) throws Exception {
		return issueboardDAO.issueboardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public IssueJoinVO issuboardInfo(Map<String, String> params)
			throws Exception {
		return issueboardDAO.issuboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertIssueboardInfo(IssueboardVO issueboardInfo)
			throws Exception {
		return issueboardDAO.insertIssueboardInfo(issueboardInfo);
	}

}
