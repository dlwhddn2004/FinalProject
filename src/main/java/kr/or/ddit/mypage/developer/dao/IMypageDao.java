package kr.or.ddit.mypage.developer.dao;

import java.util.Map;

public interface IMypageDao {

	public int projectFinishNumber(Map<String,String> params) throws Exception;
	public int portfolioFinishNumber(Map<String,String> params) throws Exception;
	
}
