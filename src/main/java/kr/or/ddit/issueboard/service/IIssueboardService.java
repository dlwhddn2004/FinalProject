package kr.or.ddit.issueboard.service;

import java.util.List;

import kr.or.ddit.vo.IssueboardVO;

public interface IIssueboardService {
	
	public List<IssueboardVO> issueboardList() throws Exception; 

}
