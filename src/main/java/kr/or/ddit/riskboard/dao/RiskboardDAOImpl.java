package kr.or.ddit.riskboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RiskJoinVO;
import kr.or.ddit.vo.RiskboardCommentVO;
import kr.or.ddit.vo.RiskboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class RiskboardDAOImpl implements IRiskboardDAO{
	
	@Autowired SqlMapClient client;

	@Override
	public List<RiskJoinVO> riskboardList(Map<String, String> params)
			throws Exception {
		return client.queryForList("riskboard.riskboardList", params);
	}

	@Override
	public RiskboardVO riskboardInfo(Map<String, String> params)
			throws Exception {
		return (RiskboardVO) client.queryForObject("riskboard.riskboardInfo",params);
	}

	@Override
	public int insertRiskboard(RiskboardVO riskboardInfo) throws Exception {
		int chk = 0;
		
		Object obj = client.insert("riskboard.insertRiskboard", riskboardInfo);
		if (obj == null){
			chk = 1;
		}
		return chk;
	}

	@Override
	public int updateRiskboard(RiskboardVO riskboardInfo) throws Exception {
		
		return client.update("riskboard.updateRiskboard", riskboardInfo);
	}

	@Override
	public int deleteRiskboard(Map<String, String> params) throws Exception {
		return client.update("riskboard.deleteRiskboard", params);
	}

	@Override
	public int updateHit(Map<String, String> params) throws Exception {
		return client.update("riskboard.updatehit", params);
	}

	@Override
	public List<RiskboardCommentVO> commentList(Map<String, String> params)
			throws Exception {
		return client.queryForList("riskboard_comment.riskcommentList", params);
	}

	@Override
	public int insertComment(RiskboardCommentVO riskcommentInfo)
			throws Exception {
		
		int chk = 0;
		
		Object obj = client.insert("riskboard_comment.insertriskComment",riskcommentInfo);
		
		if(obj == null){
			chk = 1;
		}
		
		return chk;
	}

	@Override
	public int updateComment(Map<String, String> params) throws Exception {
		return client.update("riskboard_comment.updateriskComment", params);
	}

	@Override
	public int deleteComment(Map<String, String> params) throws Exception {
		return client.delete("riskboard_comment.deleteriskComment", params);
	}

	@Override
	public int updateErrorStatus(RiskboardVO riskboardInfo) throws Exception {
		return client.update("riskboard.updateErrorStatus", riskboardInfo);
	}
	
	
	

}
