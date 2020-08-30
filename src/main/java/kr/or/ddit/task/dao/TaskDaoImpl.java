package kr.or.ddit.task.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.lowagie.text.Paragraph;

@Repository
public class TaskDaoImpl implements ITaskDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<Map<String, String>> selectTaskList(Map<String, String> params)
			throws Exception {
		return client.queryForList("task.selectTaskList", params);
	}

	@Override
	public Map<String, String> selectAverage(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("task.selectAverage", params);
	}

	@Override
	public Map<String, String> selectPersonAverage(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("task.selectPersonAverage", params);
	}

	@Override
	public String insertTask(Map<String, String> params) throws Exception {
		return (String) client.insert("task.insertTask", params);
	}
	
	@Override
	public int updateTask(Map<String, String> params) throws Exception {
		return client.update("task.updateTask", params);
	}

	@Override
	public Map<String, String> selectTaskInfo(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("task.selectTaskInfo", params);
	}
}
