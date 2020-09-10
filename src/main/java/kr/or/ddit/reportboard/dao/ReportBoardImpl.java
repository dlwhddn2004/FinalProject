package kr.or.ddit.reportboard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ReportBoardImpl implements IReportBoardDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<Map<String, String>> reportboardList(Map<String, String> params) throws Exception {
		return client.queryForList("reportboard.reportboardList", params);
	}

	@Override
	public Map<String, String> selectReportboard(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("reportboard.selectReportboard", params);
	}

	@Override
	public String insertReportboard(Map<String, String> params)
			throws Exception {
		return (String) client.insert("reportboard.insertReportboard", params);
	}

	@Override
	public int updateReportboard(Map<String, String> params) throws Exception {
		return client.update("reportboard.updateReportboard", params);
	}

	@Override
	public int deleteReportboard(Map<String, String> params) throws Exception {
		return client.delete("reportboard.deleteReportboard", params);
	}

}
