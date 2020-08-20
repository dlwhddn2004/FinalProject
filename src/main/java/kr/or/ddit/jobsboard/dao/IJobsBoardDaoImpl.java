package kr.or.ddit.jobsboard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.JobsBoardVO;
@Repository("jobsBoardDao")
public class IJobsBoardDaoImpl implements IJobsBoardDao {

	@Autowired
	private SqlMapClient client;
	
	
	@Override
	public List<JobsBoardVO> JobsBoardList() throws Exception {
		return client.queryForList("JobsBoard.JobsBoardList");
	}


	@Override
	public void jobsBoardInsert(JobsBoardVO boardInfo) throws Exception {
		 client.insert("JobsBoard.InsertJobsBoard",boardInfo);
		
	}


	@Override
	public JobsBoardVO jobsBoardInfo(Map<String, String> parmas)
			throws Exception {
		return (JobsBoardVO) client.queryForObject("JobsBoard.jobsBoardInfo",parmas);
	}


	@Override
	public int modifyJobsBoard(JobsBoardVO vo) throws Exception {
		return client.update("JobsBoard.modifyJobsBoard",vo);
	}


	@Override
	public int hitup(Map<String, String> params) throws Exception {
		
		return client.update("JobsBoard.hitup",params);
	}

}
