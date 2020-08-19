package kr.or.ddit.jobsboard.service;

import java.util.List;

import kr.or.ddit.vo.JobsBoardVO;

public interface IJobsBoardService {

	public List<JobsBoardVO> JobsBoardList() throws Exception;
	
}
