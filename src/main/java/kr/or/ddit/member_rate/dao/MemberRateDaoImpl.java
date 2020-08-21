package kr.or.ddit.member_rate.dao;

import java.util.Map;

import kr.or.ddit.vo.MemberRateVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class MemberRateDaoImpl implements IMemberRateDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public MemberRateVO selectMemberRateInfo(Map<String, String> params)
			throws Exception {
		return (MemberRateVO) client.queryForObject("member_rate.selectMemberRateInfo", params);
	}
}
