package kr.or.ddit.successboard.dao;

import java.util.List;

import kr.or.ddit.vo.SuccessBoardVO;

public interface ISuccessBoardDao {
	public List<SuccessBoardVO> successboardList() throws Exception;
	public void insertSuccessBoard(SuccessBoardVO successboardInfo) throws Exception;
}
