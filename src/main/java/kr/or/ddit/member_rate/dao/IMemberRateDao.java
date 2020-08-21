package kr.or.ddit.member_rate.dao;

import java.util.Map;

import kr.or.ddit.vo.MemberRateVO;

public interface IMemberRateDao {
	public MemberRateVO selectMemberRateInfo(Map<String, String> params) throws Exception;
}
