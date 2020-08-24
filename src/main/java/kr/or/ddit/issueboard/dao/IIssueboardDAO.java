
package kr.or.ddit.issueboard.dao;

import java.util.List;

import kr.or.ddit.vo.IssueboardVO;

public interface IIssueboardDAO {
	
	public List<IssueboardVO> issueboardList() throws Exception;

}
