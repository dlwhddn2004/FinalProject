package kr.or.ddit.mypage.developer.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.vo.Mypage_memberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

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

	@Override
	public String insertMyabout(Mypage_memberVO vo) throws Exception {
		String test =null;
		Object obj = null;
		if(obj == client.insert("mypageDeverloper.insertMyabout",vo)){
			test ="1";
		}
		return test;
	}

	@Override
	public Mypage_memberVO selectMypageInfo(Map<String, String> params)
			throws Exception {
		return (Mypage_memberVO) client.queryForObject("mypageDeverloper.selectMypageInfo",params);
	}

	@Override
	public String modifyMyabout(Mypage_memberVO vo) throws Exception {
		
		return String.valueOf(client.update("mypageDeverloper.modifyMyabout",vo));
	}

	@Override
	public void insertMypageDeveloper(Mypage_memberVO mypageInfo)
			throws Exception {
		client.insert("mypageDeverloper.insertAll", mypageInfo);
		
	}

}
