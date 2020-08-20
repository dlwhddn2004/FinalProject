package kr.or.ddit.profile_file.service;

import java.util.Map;

import kr.or.ddit.profile_file.dao.IProfileFileDao;
import kr.or.ddit.vo.ProfileFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;

public class ProfileFileServiceImpl implements IProfileFileService {
	
	@Autowired
	private IProfileFileDao profileFileDao;

	@Override
	public ProfileFileVO selectProfileFileInfo(Map<String, String> params)
			throws Exception {
		return profileFileDao.selectProfileFileInfo(params);
	}

}
