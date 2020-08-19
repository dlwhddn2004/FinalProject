package kr.or.ddit.jobsboard.dao;

import java.util.List;

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

}
