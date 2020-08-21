package kr.or.ddit.project.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_ProjectParticipantsVO;

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

	@Override
	public List<Map<String, String>> selectNotProjectListById(
			Map<String, String> params) throws Exception {
		return client.queryForList("project.selectNotProjectListById", params);
	}

	@Override
	public List<Map<String, String>> selectFinishProjectListById(
			Map<String, String> params) throws Exception {
		return client.queryForList("project.selectFinishProjectListById", params);
	}
}
