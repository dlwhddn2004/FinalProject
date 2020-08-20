package kr.or.ddit.project.dao;

import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

public interface IProjectDao {
	public ProjectVO selectProjectInfo(Map<String, String> params) throws Exception;
}
