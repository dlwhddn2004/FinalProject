package kr.or.ddit.successboard.service;

import java.util.List;

import kr.or.ddit.vo.SuccessBoardVO;

public interface ISuccessBoardService {
	public List<SuccessBoardVO> successboardList() throws Exception;
	public void insertSuccessBoard(SuccessBoardVO successboardInfo) throws Exception;
}
