package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.project.dao.IProjectDao;
import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_ProjectParticipantsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProjectServiceImpl implements IProjectService {
	
	@Autowired
	private IProjectDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> selectProjectInfo(Map<String, String> params)
			throws Exception {
		return dao.selectProjectInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectProjectList(
			Map<String, String> params) throws Exception {
		return dao.selectProjectList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectNotProjectListById(
			Map<String, String> params) throws Exception {
		return dao.selectNotProjectListById(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectFinishProjectListById(
			Map<String, String> params) throws Exception {
		return dao.selectFinishProjectListById(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectTimelineList(
			Map<String, String> params) throws Exception {
		return dao.selectTimelineList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectTodo(Map<String, String> params)
			throws Exception {
		return dao.selectTodo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertTODO(Map<String, String> params) throws Exception {
		return dao.insertTODO(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteTodo(Map<String, String> params) throws Exception {
		return dao.deleteTodo(params);
	}
	//덕년 리스트 조회
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> projectList() throws Exception {
		
		return dao.projectList();
	}

	//insert project
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertProjectInfo(Map<String, String> params) throws Exception {
		return dao.insertProjectInfo(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProjectVO projectInfo(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return dao.projectInfo(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int projectInfo1(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return dao.projectInfo1(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int projectInfo2(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return dao.projectInfo2(params);
	}

	@Override
	public int projectInfo3(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return dao.projectInfo3(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertProjectReady(Map<String, String> params) throws Exception {
		return dao.insertProjectReady(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertProjectDetail(Map<String, String> params) throws Exception {
		return dao.insertProjectDetail(params);
	}

}
