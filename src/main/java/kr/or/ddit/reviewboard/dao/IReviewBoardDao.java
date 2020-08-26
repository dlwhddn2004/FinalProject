package kr.or.ddit.reviewboard.dao;

import java.util.List;

import kr.or.ddit.vo.ReviewBoardVO;

public interface IReviewBoardDao {
	public List<ReviewBoardVO> reviewboardList() throws Exception;
	public int insertReviewBoard(ReviewBoardVO reviewboardInfo) throws Exception;
}
