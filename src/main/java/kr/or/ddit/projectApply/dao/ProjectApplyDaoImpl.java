package kr.or.ddit.projectApply.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;
import oracle.net.aso.p;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.lowagie.text.Paragraph;
import com.sun.swing.internal.plaf.metal.resources.metal;

@Repository
public class ProjectApplyDaoImpl implements IProjectApplyDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public int insertProjectApplyInformation(Map<String, String> params)
			throws Exception {
		int chk = 0;
		
		Object obj = client.insert("projectApplyInfo.insertProjectApplyInformation", params);
		if (obj == null) {
			chk = 1;
		}
		
		client.insert("projectApplyInfo.insertProjectApply", params);
		
		return chk;
	}

	@Override
	public Map<String, String> selectProjectApplyInfo(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("projectApplyInfo.selectProjectApplyInfo", params);
	}
}