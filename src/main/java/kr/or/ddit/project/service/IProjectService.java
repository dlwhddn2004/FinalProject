package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_ProjectParticipantsVO;

public interface IProjectService {
	public ProjectVO selectProjectInfo(Map<String, String> params) throws Exception;
	public List<Map<String, String>> selectNotProjectListById(Map<String, String> params) throws Exception;
	public List<Map<String, String>> selectFinishProjectListById(Map<String, String> params) throws Exception;
}
