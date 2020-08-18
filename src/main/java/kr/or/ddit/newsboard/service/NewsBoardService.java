package kr.or.ddit.newsboard.service;

import java.util.List;



import kr.or.ddit.vo.newsboardVO;

public interface NewsBoardService {
	public List<newsboardVO> newsboardList() throws Exception;
}
