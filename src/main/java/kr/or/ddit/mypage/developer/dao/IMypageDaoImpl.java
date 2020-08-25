package kr.or.ddit.mypage.developer.dao;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("mypageDao")
public class IMypageDaoImpl implements IMypageDao {

	@Autowired
	private SqlMapClient client;
	
	@Override
	public int projectFinishNumber(Map<String, String> params) throws Exception {
		int cnt =0;
		cnt = (int) client.queryForObject("mypageDeverloper.projectNum",params);
		return cnt;
	}

	@Override
	public int portfolioFinishNumber(Map<String, String> params) throws Exception {
		int cnt = 0;
		cnt = (int) client.queryForObject("mypageDeverloper.portfolioNum",params);
		return cnt;
	}

}
