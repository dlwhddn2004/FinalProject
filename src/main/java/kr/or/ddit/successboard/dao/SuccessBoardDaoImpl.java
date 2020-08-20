package kr.or.ddit.successboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.lowagie.text.Paragraph;

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
	public int insertSuccessBoard(SuccessBoardVO successboardInfo)
			throws Exception {
		int chk = 0;
		
		Object obj = client.insert("successboard.insertSuccessBoard", successboardInfo);
		if (obj == null) {
			chk = 1;
		}
		
		return chk;
	}

	@Override
	public int modifySuccessBoard(SuccessBoardVO successboardInfo)
			throws Exception {
		return client.update("successboard.modifySuccessBoard", successboardInfo);
	}

	@Override
	public int deleteSuccessBoard(Map<String, String> params) throws Exception {
		return client.update("successboard.deleteSuccessBoard", params);
	}

	@Override
	public List<SuccessBoardCommentVO> selectCommentList(
			Map<String, String> params) throws Exception {
		return client.queryForList("successboard_comment.selectCommentList", params);
	}

	@Override
	public int insertSuccessComment(SuccessBoardCommentVO successCommentInfo)
			throws Exception {
		int chk = 0;
		
		Object obj = client.insert("successboard_comment.insertSuccessComment", successCommentInfo);
		
		if (obj == null) {
			chk = 1;
		}
		
		return chk;
	}

	@Override
	public int deleteSuccessComment(Map<String, String> params)
			throws Exception {
		return client.delete("successboard_comment.deleteSuccessComment", params);
	}
}
