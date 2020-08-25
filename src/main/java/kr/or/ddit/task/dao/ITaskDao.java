package kr.or.ddit.task.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface ITaskDao {
	public List<Map<String, String>> selectTaskList(Map<String, String> params) throws Exception;
}
