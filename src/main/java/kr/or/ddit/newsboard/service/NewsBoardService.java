package kr.or.ddit.newsboard.service;

import java.util.List;



import java.util.Map;

import kr.or.ddit.vo.SuccessBoardVO;
import kr.or.ddit.vo.newsboardVO;

public interface NewsBoardService {
	public List<newsboardVO> newsboardList() throws Exception;
	public void insertNewsboard(newsboardVO newsboardInfo) throws Exception;
	public newsboardVO newsboardInfo(Map<String, String>params) throws Exception;
	public int modifyNewsBoard(newsboardVO newsboardInfo) throws Exception;
	public int deleteNewsBoard(Map<String, String> params) throws Exception;
}
