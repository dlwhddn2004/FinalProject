package kr.or.ddit.reviewboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ReviewBoardVO;

public interface IReviewBoardDao {
	public List<Map<String, String>> reviewboardList() throws Exception;
	public int insertReviewBoard(ReviewBoardVO reviewboardInfo) throws Exception;
	public int deleteReviewBoard(Map<String, String> params) throws Exception;
}
