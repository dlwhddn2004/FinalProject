package kr.or.ddit.task.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface ITaskDao {
	public List<Map<String, String>> selectTaskList(Map<String, String> params) throws Exception;
	public Map<String, String> selectAverage(Map<String, String> params) throws Exception;
	public Map<String, String> selectPersonAverage(Map<String, String> params) throws Exception;
	
	public String insertTask(Map<String, String> params) throws Exception;
	public int updateTask(Map<String, String> params) throws Exception;
	public Map<String, String> selectTaskInfo(Map<String, String> params) throws Exception;
}
