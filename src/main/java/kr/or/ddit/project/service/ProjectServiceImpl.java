﻿
package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.project.dao.IProjectDao;
import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_ProjectParticipantsVO;
import kr.or.ddit.vo.projectapplyVO;

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
	public List<ProjectVO>projectList(Map<String,String>params) throws Exception {
		
		return dao.projectList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProjectVO projectInfo(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return dao.projectInfo(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public String projectInfo6(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return dao.projectInfo6(params);
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
	@Override
	public int projectInfo4(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return dao.projectInfo4(params);
	}
	@Override
	public int projectInfo5(Map<String, String> params) throws Exception {
		return dao.projectInfo5(params);
	}

	
	//insert project
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertProjectInfo(Map<String, String> params) throws Exception {
		return dao.insertProjectInfo(params);
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

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertProjectBudget(Map<String, String> params) throws Exception {
		return dao.insertProjectBudget(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertProjectMeeting(Map<String, String> params)
			throws Exception {
		return dao.insertProjectMeeting(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertProjectMozip(Map<String, String> params) throws Exception {
		return dao.insertProjectMozip(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertProjectAdd(Map<String, String> params) throws Exception {
		return dao.insertProjectAdd(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertProjectParticipants(Map<String, String> params)
			throws Exception {
		dao.insertProjectParticipants(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertprojectsupport(ProjectVO projectInfo) throws Exception {
		
		dao.insertprojectsupport(projectInfo);
		
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> readNotProject(Map<String, String> params)
			throws Exception {
		return dao.readNotProject(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<projectapplyVO> applyList(Map<String, String> params)
			throws Exception {
		return dao.applyList(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateapplyInfo(projectapplyVO applyInfo) throws Exception {
		
			 dao.updateapplyInfo(applyInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectMakeProjectList(
			Map<String, String> params) throws Exception {
		return dao.selectMakeProjectList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int projectEnd(Map<String, String> params) throws Exception {
		return dao.projectEnd(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> selectOnlyProjectInfo(String project_no)
			throws Exception {
		return dao.selectOnlyProjectInfo(project_no);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int endHire(Map<String, String> params) throws Exception {
		return dao.endHire(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteProject(Map<String, String> params) throws Exception {
		return dao.deleteProject(params);
	}

}
