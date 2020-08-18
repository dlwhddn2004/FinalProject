package kr.or.ddit.newsboard.dao;

import java.util.List;
import java.util.Map;


import kr.or.ddit.vo.newsboardVO;

public interface NewsBoardDao {

	public List<newsboardVO> newsboardList() throws Exception;

}
