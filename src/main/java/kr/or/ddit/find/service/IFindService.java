package kr.or.ddit.find.service;

import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface IFindService {
	
	// id 찾기 이메일
	public Map<String, String> findIDMail(Map<String, String> params) throws Exception;
	// id 찾기 전화번호
	public Map<String, String> findIDTel(Map<String, String> params) throws Exception;
	// pw 찾기
	public Map<String, String> findPW(Map<String, String> params) throws Exception;
	//임시비밀번호 업데이트
	public int updatePW(Map<String, String> params) throws Exception;

}
