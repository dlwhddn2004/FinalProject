package kr.or.ddit.project.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProfileFileVO;
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
	public Map<String, String> selectProjectInfo(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("project.selectProjectInfo", params);
	}
	
	@Override
	public List<Map<String, String>> selectProjectList(
			Map<String, String> params) throws Exception {
		return client.queryForList("project.selectProjectList", params);
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
	
	@Override
	public List<Map<String, String>> selectTimelineList(
			Map<String, String> params) throws Exception {
		return client.queryForList("timeline.selectTimelineList");
	}
	
	@Override
	public List<Map<String, String>> selectTodo(Map<String, String> params)
			throws Exception {
		return client.queryForList("project.selectTodo", params);
	}

	@Override
	public String insertTODO(Map<String, String> params) throws Exception {
		return (String) client.insert("project.insertTODO", params);
	}

	@Override
	public int deleteTodo(Map<String, String> params) throws Exception {
		return client.delete("project.deleteTodo", params);
	}
// 덕년 리스트 구현
	@Override
	public List<ProjectVO> projectList(Map<String,String>params) throws Exception {
		List<ProjectVO> list = null;
		
		list = client.queryForList("projectsearch.projectList");
		
		return list;
	}
	//project insert
	@Override
	public String insertProjectInfo(Map<String, String> params) throws Exception {
		return (String) client.insert("projectRegist.insertProjectInfo", params);
	}

	@Override
	public int insertProjectReady(Map<String, String> params)
			throws Exception {
		return client.update("projectRegist.insertProjectReady", params);
	}

	@Override
	public int insertProjectDetail(Map<String, String> params) throws Exception {
		return client.update("projectRegist.insertProjectDetail", params);
	}
	
	@Override
	public int insertProjectBudget(Map<String, String> params) throws Exception {
		return client.update("projectRegist.insertProjectBudget", params);
	}
	
	@Override
	public int insertProjectMeeting(Map<String, String> params)
			throws Exception {
		return client.update("projectRegist.insertProjectMeeting", params);
	}
	
	@Override
	public int insertProjectMozip(Map<String, String> params) throws Exception {
		return client.update("projectRegist.insertProjectMozip", params);
	}

	@Override
	public int insertProjectAdd(Map<String, String> params) throws Exception {
		return client.update("projectRegist.insertProjectAdd", params);
	}

	@Override
	public ProjectVO projectInfo(Map<String, String> params) throws Exception {
		
		return (ProjectVO) client.queryForObject("projectsearch.projectInfo",params);
	}
	@Override
	public String projectInfo6(Map<String, String> params) throws Exception {
		
		return (String) client.queryForObject("projectsearch.projectInfo6",params);
	}

	@Override
	public int projectInfo1(Map<String, String> params) throws Exception {
		int cnt =0;
		cnt = (int) client.queryForObject("projectsearch.projectInfo1",params);
		return cnt;
	}
	

	@Override
	public int projectInfo2(Map<String, String> params) throws Exception {
		int cnt =0;
		cnt = (int) client.queryForObject("projectsearch.projectInfo2",params);
		return cnt;
	}

	@Override
	public int projectInfo3(Map<String, String> params) throws Exception {
		int cnt =0;
		cnt = (int) client.queryForObject("projectsearch.projectInfo3",params);
		return cnt;
	}
	@Override
	public int projectInfo4(Map<String, String> params) throws Exception {
		int cnt =0;
		cnt = (int) client.queryForObject("projectsearch.projectInfo4",params);
		return cnt;
	}
	@Override
	public void insertProjectParticipants(Map<String, String> params)
			throws Exception {
		client.insert("project.insertParticipant", params);
	}

	@Override
	public int projectInfo5(Map<String, String> params) throws Exception {
		int cnt =0;
		cnt = (int) client.queryForObject("projectsearch.projectInfo5",params);
		return cnt;
	}

	@Override
	public Map<String, String> readNotProject(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("projectRegist.readNotProject", params);
	}
	@Override
	public void insertprojectsupport(ProjectVO projectInfo) throws Exception {
		
		client.insert("projectsearch.insertproject",projectInfo);
		
	}
	






}
