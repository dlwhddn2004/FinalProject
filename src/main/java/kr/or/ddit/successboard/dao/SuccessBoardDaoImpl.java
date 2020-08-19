package kr.or.ddit.successboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class SuccessBoardDaoImpl implements ISuccessBoardDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public List<SuccessBoardVO> successboardList() throws Exception {
		return client.queryForList("successboard.successboardList");
	}
	
	@Override
	public List<JoinVO> attendProjectList(Map<String, String> params)
			throws Exception {
		return client.queryForList("project.attendProjectList", params);
	}
	
	@Override
	public SuccessBoardVO selectSuccessBoardInfo(Map<String, String> params)
			throws Exception {
		return (SuccessBoardVO) client.queryForObject("successboard.selectSuccessBoardInfo", params);
	}
	
	@Override
	public ProjectVO selectProjectInfo(Map<String, String> params)
			throws Exception {
		return (ProjectVO) client.queryForObject("project.selectProjectInfo", params);
	}

	@Override
	public void insertSuccessBoard(SuccessBoardVO successboardInfo)
			throws Exception {
		client.insert("successboard.insertSuccessBoard", successboardInfo);
	}

	@Override
	public int modifySuccessBoard(SuccessBoardVO successboardInfo)
			throws Exception {
		return client.update("successboard.modifySuccessBoard", successboardInfo);
	}
}
