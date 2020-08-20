package kr.or.ddit.jobsboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JobsBoardVO;

public interface IJobsBoardService {

	public List<JobsBoardVO> JobsBoardList() throws Exception;
	public void jobsBoardInsert(JobsBoardVO boardInfo) throws Exception;
	public JobsBoardVO jobsBoardInfo(Map<String,String> parmas) throws Exception;
	public int modifyJobsBoard(JobsBoardVO vo) throws Exception;
	
	public int hitup(Map<String,String> params) throws Exception;
}
