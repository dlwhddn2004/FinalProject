package kr.or.ddit.successboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SuccessBoardVO;

public interface ISuccessBoardDao {
	public List<SuccessBoardVO> successboardList() throws Exception;
	public SuccessBoardVO selectSuccessBoardInfo(Map<String, String> params) throws Exception;
	public void insertSuccessBoard(SuccessBoardVO successboardInfo) throws Exception;
}
