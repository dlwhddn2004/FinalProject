package kr.or.ddit.gantt.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.gantt.dao.IGanttDao;
import kr.or.ddit.successboard.dao.ISuccessBoardDao;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GanttServiceImpl implements IGanttService {
	@Autowired
	private IGanttDao dao;
}
