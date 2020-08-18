package kr.or.ddit.jobsboard.service;

import java.util.List;

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
	
	
	@Override
	public List<JobsBoardVO> JobsBoardList() throws Exception {
		
		return dao.JobsBoardList();
	}

}
