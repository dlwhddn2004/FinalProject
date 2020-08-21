package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.project.dao.IProjectDao;
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
	public ProjectVO selectProjectInfo(Map<String, String> params)
			throws Exception {
		return dao.selectProjectInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectProjectListById(
			Map<String, String> params) throws Exception {
		return dao.selectProjectListById(params);
	}
}
