package kr.or.ddit.reviewboard.service;

import java.util.List;

import kr.or.ddit.vo.ReviewBoardVO;

public interface IReviewBoardService {
	public List<ReviewBoardVO> reviewboardList() throws Exception;
	public int insertReviewBoard(ReviewBoardVO reviewboardInfo) throws Exception;
}
