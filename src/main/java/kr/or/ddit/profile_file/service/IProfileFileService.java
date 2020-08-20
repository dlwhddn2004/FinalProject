package kr.or.ddit.profile_file.service;

import java.util.Map;

import kr.or.ddit.vo.ProfileFileVO;

public interface IProfileFileService {
	public ProfileFileVO selectProfileFileInfo(Map<String, String> params) throws Exception;
	
	public void insertProfileFileInfo(ProfileFileVO profileInfo) throws Exception;
}
