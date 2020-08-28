package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;

public interface IMemberService {
	
	public MemberVO memberInfo(Map<String, String> params) throws Exception;

	public List<MemberVO> memberList(Map<String, String> params) throws Exception;
//	
	public void deleteMemberInfo(Map<String, String> params)throws Exception;
//
	public void updateMemberInfo(MemberVO memberInfo) throws Exception;
//
	public void insertMemberInfo(MemberVO memberInfo) throws Exception;
	
/*	public void memberDeleteSuccess(Map<String, String> params)throws Exception;

	public String totalCount(Map<String, String> params)throws Exception;*/
//	
//	public String totalCount(Map<String, String> params) throws Exception;

	
	
	
	// 재석
	public Map<String, String> selectMemberInfo(Map<String, String> params) throws Exception;
}
