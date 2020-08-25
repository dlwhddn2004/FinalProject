package kr.or.ddit.task.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.successboard.dao.ISuccessBoardDao;
import kr.or.ddit.task.dao.ITaskDao;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TaskServiceImpl implements ITaskService {
	@Autowired
	private ITaskDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectTaskList(Map<String, String> params)
			throws Exception {
		return dao.selectTaskList(params);
	}
}
