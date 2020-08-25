package kr.or.ddit.reviewboard.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sun.misc.Cleaner;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.ReviewBoardVO;

@Repository
public class ReviewBoardDaoImpl implements IReviewBoardDao {
	@Autowired
	private SqlMapClient client;
	

	@Override
	public List<ReviewBoardVO> reviewboardList() throws Exception {
		
		return client.queryForList("reviewboard.reviewboardList");
	}


	@Override
	public int insertReviewBoard(ReviewBoardVO reviewboardInfo)
			throws Exception {
		int chk = 0;
		
		Object obj = client.insert("reviewboard.insertReviewboard", reviewboardInfo);
		if(obj == null){
			chk = 1;
		}
		return chk;
	}

}
