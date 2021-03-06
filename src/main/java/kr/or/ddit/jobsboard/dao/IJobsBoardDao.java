package kr.or.ddit.jobsboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JobsBoardCommentVO;
import kr.or.ddit.vo.JobsBoardVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;

public interface IJobsBoardDao {

	public List<JobsBoardVO> JobsBoardList() throws Exception;
	public void jobsBoardInsert(JobsBoardVO boardInfo) throws Exception;
	public JobsBoardVO jobsBoardInfo(Map<String,String> parmas) throws Exception;
	public int modifyJobsBoard(JobsBoardVO vo) throws Exception;
	public int deleteJobsBoard(Map<String,String> params) throws Exception;
	
	public int hitup(Map<String,String> params) throws Exception;
//	댓글
	public List<JobsBoardCommentVO> jobsBoardCommentList(Map<String, String> params) throws Exception;
	public int insertJobsBoardComment(JobsBoardCommentVO jobsCommentInfo) throws Exception;
	public int deleteJobsComment(Map<String, String> params) throws Exception;
	public int modifyJobsComment(Map<String,String> params) throws Exception;
	
}
