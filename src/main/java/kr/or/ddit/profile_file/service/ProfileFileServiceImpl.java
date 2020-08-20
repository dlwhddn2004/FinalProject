package kr.or.ddit.profile_file.service;

import java.util.Map;

import kr.or.ddit.profile_file.dao.IProfileFileDao;
import kr.or.ddit.vo.ProfileFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProfileFileServiceImpl implements IProfileFileService {
	
	@Autowired
	private IProfileFileDao profileFileDao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProfileFileVO selectProfileFileInfo(Map<String, String> params)
			throws Exception {
		return profileFileDao.selectProfileFileInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertProfileFileInfo(ProfileFileVO profileInfo)
			throws Exception {
		profileFileDao.insertProfileFileInfo(profileInfo);
		
	}

}
