
package kr.or.ddit.issueboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.IssueJoinVO;
import kr.or.ddit.vo.IssueboardVO;

public interface IIssueboardDAO {
	
	public List<IssueJoinVO> issueboardList(Map<String, String> params) throws Exception;
	public IssueJoinVO issuboardInfo(Map<String, String> params) throws Exception;
	public String insertIssueboardInfo(IssueboardVO issueboardInfo) throws Exception;
	

}
