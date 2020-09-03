package kr.or.ddit.project.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_ProjectParticipantsVO;

public interface IProjectDao {
	public Map<String, String> selectProjectInfo(Map<String, String> params) throws Exception;
	public List<Map<String, String>> selectProjectList(Map<String, String> params) throws Exception;
	public List<Map<String, String>> selectNotProjectListById(Map<String, String> params) throws Exception;
	public List<Map<String, String>> selectFinishProjectListById(Map<String, String> params) throws Exception;
	
	// TIMELINE
	public List<Map<String, String>> selectTimelineList(Map<String, String> params) throws Exception;
	
	// TODO LIST
	public List<Map<String, String>> selectTodo(Map<String, String> params) throws Exception;
	public String insertTODO(Map<String, String> params) throws Exception;
	public int deleteTodo(Map<String, String> params) throws Exception;
	
	//PROJECT INSERT
	public String insertProjectInfo(Map<String, String> params) throws Exception;
	public int insertProjectReady(Map<String, String> params) throws Exception;
	public int insertProjectDetail(Map<String, String> params) throws Exception;
	
	
	// 덕년 리스트 조회
	public List<ProjectVO> projectList() throws Exception;
	// 상세보기 조회
	public ProjectVO projectInfo(Map<String,String>params) throws Exception;
	public int projectInfo1(Map<String,String>params) throws Exception;
	public int projectInfo2(Map<String,String>params) throws Exception;
	public int projectInfo3(Map<String,String>params) throws Exception;
	public int projectInfo4(Map<String,String>params) throws Exception;
}
