package kr.or.ddit.project.service;

import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

public interface IProjectService {
	public ProjectVO selectProjectInfo(Map<String, String> params) throws Exception;
}
