package kr.or.ddit.jobsboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.jobsboard.dao.IJobsBoardDao;
import kr.or.ddit.vo.JobsBoardVO;

@Service("jobsBoardService")
public class IJobsBoardServiceImpl implements IJobsBoardService {

	@Autowired
	private IJobsBoardDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<JobsBoardVO> JobsBoardList() throws Exception {
		
		return dao.JobsBoardList();
	}


	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void jobsBoardInsert(JobsBoardVO boardInfo) throws Exception {
		dao.jobsBoardInsert(boardInfo);
		
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public JobsBoardVO jobsBoardInfo(Map<String, String> parmas)
			throws Exception {
		return dao.jobsBoardInfo(parmas);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int modifyJobsBoard(JobsBoardVO vo) throws Exception {
		return dao.modifyJobsBoard(vo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int hitup(Map<String, String> params) throws Exception {
		return dao.hitup(params);
	}

}
