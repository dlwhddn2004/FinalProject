package kr.or.ddit.issueboard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.IssueJoinVO;
import kr.or.ddit.vo.IssueboardVO;

@Repository
public class IssueboardDAOImpl implements IIssueboardDAO{
	
	@Autowired SqlMapClient client;

	@Override
	public List<IssueJoinVO> issueboardList(Map<String, String> params) throws Exception {
		return client.queryForList("issueboard.issueboardList", params);
	}

	@Override
	public IssueJoinVO issuboardInfo(Map<String, String> params)
			throws Exception {
		return (IssueJoinVO) client.queryForObject("issueboard.issueboardInfo",params);
	}

	@Override
	public String insertIssueboardInfo(IssueboardVO issueboardInfo)
			throws Exception {
		return (String) client.insert("issueboard.insertIssueboardInfo");
	}

}
