package kr.or.ddit.find.dao;

import java.util.Map;

import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class FindDAOImpl implements IFindDAO{
	
	@Autowired
	private SqlMapClient client;

	@Override
	public Map<String, String> findIDMail(Map<String, String> params) throws Exception {
		return (Map<String, String>) client.queryForObject("find.findIDMail", params);
	}

	@Override
	public Map<String, String> findIDTel(Map<String, String> params) throws Exception {
		return (Map<String, String>) client.queryForObject("find.findIDTel", params);
	}

	@Override
	public Map<String, String> findPW(Map<String, String> params) throws Exception {
		return (Map<String, String>) client.queryForObject("find.findPW", params);
	}

	@Override
	public int updatePW(Map<String, String> params) throws Exception {
		return client.update("find.updatePW", params);
	}

	

	

}
