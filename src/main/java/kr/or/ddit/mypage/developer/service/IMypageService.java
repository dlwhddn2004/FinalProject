package kr.or.ddit.mypage.developer.service;

import java.util.Map;

public interface IMypageService {

	public int projectFinishNumber(Map<String,String> params) throws Exception;
	public int portfolioFinishNumber(Map<String,String> params) throws Exception;
}
