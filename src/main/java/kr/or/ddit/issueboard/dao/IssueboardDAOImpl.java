package kr.or.ddit.issueboard.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.IssueboardVO;

@Repository
public class IssueboardDAOImpl implements IIssueboardDAO{
	
	@Autowired SqlMapClient clinet;

	@Override
	public List<IssueboardVO> issueboardList() throws Exception {
		return clinet.queryForList("issueboard.issueboardList");
	}

}
