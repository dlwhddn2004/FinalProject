package kr.or.ddit.reportboard.service;

import java.util.List;
import java.util.Map;

public interface IReportBoardService {
	public List<Map<String, String>> reportboardList(Map<String, String> params) throws Exception;
	public Map<String, String> selectReportboard(Map<String, String> params) throws Exception;
	public String insertReportboard(Map<String, String> params) throws Exception;
	public int updateReportboard(Map<String, String> params) throws Exception;
	public int deleteReportboard(Map<String, String> params) throws Exception;
	public int updateReportStatus(Map<String, String> params) throws Exception;
	
	//comment
	public List<Map<String, String>> reportCommentList (Map<String, String> params) throws Exception;
	public int insertReportComment(Map<String, String> params) throws Exception;
	public int deleteReportComment(Map<String, String> params) throws Exception;
	public int updateReportComment(Map<String, String> params) throws Exception;
}
