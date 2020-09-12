package kr.or.ddit.riskboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RiskJoinVO;
import kr.or.ddit.vo.RiskboardCommentVO;
import kr.or.ddit.vo.RiskboardVO;

public interface IRiskboardDAO {
	
	public  List<RiskJoinVO> riskboardList(Map<String, String> params) throws Exception;
	public RiskboardVO riskboardInfo(Map<String, String> params) throws Exception;
	public int insertRiskboard(RiskboardVO riskboardInfo) throws Exception;
	public int updateRiskboard(RiskboardVO riskboardInfo) throws Exception;
	public int deleteRiskboard(Map<String, String> params) throws Exception;
	
	//조회수
	public int updateHit(Map<String, String> params) throws Exception;
	
	//댓글
	public List<RiskboardCommentVO> commentList(Map<String, String> params) throws Exception;
	public int insertComment(RiskboardCommentVO riskcommentInfo) throws Exception;
	public int updateComment(Map<String, String> params) throws Exception;
	public int deleteComment(Map<String, String> params) throws Exception;
	
	//해결완료
	public int updateErrorStatus(RiskboardVO riskboardInfo) throws Exception;
	
	
}
