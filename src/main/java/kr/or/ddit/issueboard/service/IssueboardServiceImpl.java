package kr.or.ddit.issueboard.service;

import java.util.List;

import kr.or.ddit.issueboard.dao.IIssueboardDAO;
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
	public List<IssueboardVO> issueboardList() throws Exception {
		return issueboardDAO.issueboardList();
	}

}
