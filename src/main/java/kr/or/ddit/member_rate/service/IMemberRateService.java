package kr.or.ddit.member_rate.service;

import java.util.Map;

import kr.or.ddit.vo.MemberRateVO;

public interface IMemberRateService {
	public MemberRateVO selectMemberRateInfo(Map<String, String> params) throws Exception;
	public void insertMemberRate(MemberRateVO rateVO) throws Exception;
}
