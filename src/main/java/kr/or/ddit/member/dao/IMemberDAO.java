package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDAO {
	
	public MemberVO memberInfo(Map<String, String> params) throws Exception;

 public List<MemberVO> memberList(Map<String, String> params) throws Exception;
//
	public void memberDelete(MemberVO vo)throws Exception;
//
	public void updateMemberInfo(MemberVO memberInfo) throws Exception;
//
	public void insertMemberInfo(MemberVO memberInfo) throws Exception;
//	
//	public String totalCount(Map<String, String> params) throws Exception;

	
	
	
	// 재석
	public Map<String, String> selectMemberInfo(Map<String, String> params) throws Exception;
}
