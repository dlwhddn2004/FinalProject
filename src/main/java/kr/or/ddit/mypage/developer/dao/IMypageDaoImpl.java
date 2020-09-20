package kr.or.ddit.mypage.developer.dao;

import java.sql.SQLException;
import java.util.List;
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
		cnt = (int) client.queryForObject("mypage.projectNum",params);
		return cnt;
	}

	@Override
	public int portfolioFinishNumber(Map<String, String> params) throws Exception {
		int cnt = 0;
		cnt = (int) client.queryForObject("mypage.portfolioNum",params);
		return cnt;
	}

	@Override
	public String insertMyabout(Mypage_memberVO vo) throws Exception {
		String test =null;
		Object obj = null;
		if(obj == client.insert("mypage.insertMyabout",vo)){
			test ="1";
		}
		return test;
	}

	@Override
	public Mypage_memberVO selectMypageInfo(Map<String, String> params)
			throws Exception {
		return (Mypage_memberVO) client.queryForObject("mypage.selectMypageInfo",params);
	}

	@Override
	public String modifyMyabout(Mypage_memberVO vo) throws Exception {
		
		return String.valueOf(client.update("mypage.modifyMyabout",vo));
	}

	
	@Override
	public void insertMypageDeveloper(Mypage_memberVO mypageInfo)
			throws Exception {
		client.insert("mypage.insertAll", mypageInfo);
		
	}

	@Override
	public List<Map<String, String>> projectTechnologiesChart(
			Map<String, String> params) throws Exception {
		return client.queryForList("mypage.projectTechnologiesChart", params);
	}

	@Override
	public List<Map<String, String>> portfolioMypageList(
			Map<String, String> params) throws Exception {
		return client.queryForList("mypage.portfolioMypageList",params);
	}

	@Override
	public Map<String, String> mypageTechnologiesCheck(
			Map<String, String> params) throws Exception {
		return (Map<String, String>) client.queryForObject("mypage.mypageTechnologiesCheck", params);
	}

	@Override
	public int updateTechnologies(Map<String, String> params) throws Exception {
		return client.update("mypage.updateTechnologies", params);
	}

	@Override
	public void updateTechnologiesCount(Map<String,String> params) throws Exception {
		client.update("mypage.updateTechnologiesCount", params);
	}

	@Override
	public List<Map<String, String>> carrerList(Map<String, String> params)
			throws Exception {
		return client.queryForList("mypage.selectCarrerList", params);
	}

	@Override
	public void insertPartnersmypage(Mypage_memberVO mypageInfo)
			throws Exception {
		client.insert("mypage.insertPartnersmypage", mypageInfo);
	}

	@Override
	public List<Map<String, String>> partnersProjectChart(
			Map<String, String> params) throws Exception {
		return client.queryForList("mypage.partnersProjectChart",params);
	}

	@Override
	public Mypage_memberVO partnersmypageInfo(Map<String, String> params)
			throws Exception {
		return (Mypage_memberVO) client.queryForObject("mypage.partnersmypageInfo",params);
	}

	@Override
	public String modifyPartnerAbout(Mypage_memberVO vo) throws Exception {
		return String.valueOf(client.update("mypage.modifyPartnerAbout",vo));
	}

	@Override
	public int partnersProjectNum(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("mypage.partnersProjectNum",params);
	}
}
