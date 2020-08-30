package kr.or.ddit.task.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.task.dao.ITaskDao;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface ITaskService {
	public List<Map<String, String>> selectTaskList(Map<String, String> params) throws Exception;
	public Map<String, String> selectAverage(Map<String, String> params) throws Exception;
	public Map<String, String> selectPersonAverage(Map<String, String> params) throws Exception;
	
	public String insertTask(Map<String, String> params) throws Exception;
}
