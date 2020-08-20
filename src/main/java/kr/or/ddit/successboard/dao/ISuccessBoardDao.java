package kr.or.ddit.successboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface ISuccessBoardDao {
	public List<SuccessBoardVO> successboardList() throws Exception;
	public List<JoinVO> attendProjectList(Map<String, String> params) throws Exception;
	public SuccessBoardVO selectSuccessBoardInfo(Map<String, String> params) throws Exception;
	public int insertSuccessBoard(SuccessBoardVO successboardInfo) throws Exception;
	public int modifySuccessBoard(SuccessBoardVO successboardInfo) throws Exception;
	public int deleteSuccessBoard(Map<String, String> params) throws Exception;
	
	// comment
	public List<SuccessBoardCommentVO> selectCommentList(Map<String, String> params) throws Exception;
	public int insertSuccessComment(SuccessBoardCommentVO successCommentInfo) throws Exception;
	public int deleteSuccessComment(Map<String, String> params) throws Exception;
	public int modifySuccessComment(Map<String, String> params) throws Exception;
}
