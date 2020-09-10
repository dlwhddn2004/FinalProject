package kr.or.ddit.reportboard.service;

import java.util.List;
import java.util.Map;

public interface IReportBoardService {
	public List<Map<String, String>> reportboardList(Map<String, String> params) throws Exception;
	public Map<String, String> selectReportboard(Map<String, String> params) throws Exception;
	public String insertReportboard(Map<String, String> params) throws Exception;
	public int updateReportboard(Map<String, String> params) throws Exception;
	public int deleteReportboard(Map<String, String> params) throws Exception;
}
