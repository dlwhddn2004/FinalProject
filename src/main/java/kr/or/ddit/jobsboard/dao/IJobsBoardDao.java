package kr.or.ddit.jobsboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JobsBoardVO;

public interface IJobsBoardDao {

	public List<JobsBoardVO> JobsBoardList() throws Exception;
}
