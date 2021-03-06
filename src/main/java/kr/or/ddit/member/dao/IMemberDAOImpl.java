package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.MemberVO;

// 설정파일 : <bean name="iMemberDAOImpl" Class="kr.or.ddit.member.dao.IMemberDAOImpl" />
@Repository
public class IMemberDAOImpl implements IMemberDAO {
//	@Resource
//	@Inject
	@Autowired
	private SqlMapClient client;

	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception{

		return (MemberVO) client.queryForObject("member.memberInfo", params);
	}

	@Override
	public List<MemberVO> memberList(Map<String, String> params) throws Exception {

		return client.queryForList("member.memberList", params);
	}
//
	@Override
	public void deleteMemberInfo(Map<String, String> params) throws Exception {
		client.update("member.memberDelete",params);
		
	}

//
	@Override
	public void updateMemberInfo(MemberVO memberInfo) throws Exception {
		
		// update 쿼리
		// 테이블 생성
		// 프로시저, 펑션을 작성 및 호출
		// 오라클 객체 생성
		// client.update(arg0)
		client.update("member.updateMember", memberInfo);	
	}
//
	@Override
	public void insertMemberInfo(MemberVO memberInfo) throws Exception {
		client.insert("member.insertMember", memberInfo);
	}
	
/*	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("member.totalCount", params);
	}
	
	@Override
	public void memberDeleteSuccess(Map<String, String> params)
			throws Exception {
		client.update("member.memberDeleteSuccess", params);
		
	}*/
//
//	@Override
//	public String totalCount(Map<String, String> params) throws Exception {
//		return (String) client.queryForObject("member.totalCount", params);
//	}

	
	
	
	
	// 재석
	
	@Override
	public Map<String, String> selectMemberInfo(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("member.selectMemberInfo", params);
	}
}
