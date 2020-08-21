package kr.or.ddit.project.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_ProjectParticipantsVO;

public interface IProjectDao {
	public ProjectVO selectProjectInfo(Map<String, String> params) throws Exception;
	public List<Map<String, String>> selectProjectListByDevelopId(Map<String, String> params) throws Exception;
}
