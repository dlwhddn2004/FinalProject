package kr.or.ddit.profile_file.dao;

import java.util.Map;

import kr.or.ddit.vo.ProfileFileVO;

public interface IProfileFileDao {
	public ProfileFileVO selectProfileFileInfo(Map<String, String> params) throws Exception;
}
