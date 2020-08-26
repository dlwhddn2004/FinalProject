package kr.or.ddit.reviewboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.reviewboard.dao.IReviewBoardDao;
import kr.or.ddit.vo.ReviewBoardVO;

@Service
public class ReviewBoardServiceImpl implements IReviewBoardService {
	@Autowired
	private IReviewBoardDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> reviewboardList() throws Exception {
		return dao.reviewboardList();
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertReviewBoard(ReviewBoardVO reviewboardInfo)
			throws Exception {
		return dao.insertReviewBoard(reviewboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteReviewBoard(Map<String, String> params) throws Exception {
		return dao.deleteReviewBoard(params);
	}

}
