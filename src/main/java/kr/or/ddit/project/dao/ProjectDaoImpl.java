package kr.or.ddit.project.dao;

import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ProjectDaoImpl implements IProjectDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public ProjectVO selectProjectInfo(Map<String, String> params)
			throws Exception {
		return (ProjectVO) client.queryForObject("project.selectProjectInfo", params);
	}

}
