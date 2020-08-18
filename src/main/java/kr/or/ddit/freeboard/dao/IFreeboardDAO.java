package kr.or.ddit.freeboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeboardVO;

public interface IFreeboardDAO {
	
	public List<FreeboardVO> freeboardList(Map<String, String> params) throws Exception;

	public String insertFreeboard(FreeboardVO fVO)throws Exception;
	
	public String insertFreeboardReply(FreeboardVO fVO) throws Exception;
	
	public int updateFreeboard(FreeboardVO fVO)throws Exception;
	
	public FreeboardVO freeboardInfo(Map<String, String> params) throws Exception;
	
	public int deleteFreeboard(Map<String, String> params) throws Exception;
	
	public String totalCount(Map<String, String> params) throws Exception;
	
	public void hitUp(Map<String,String> params) throws Exception;

}
