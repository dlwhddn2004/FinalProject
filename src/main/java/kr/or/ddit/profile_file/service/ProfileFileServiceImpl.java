package kr.or.ddit.profile_file.service;

import kr.or.ddit.profile_file.dao.IProfileFileDao;

import org.springframework.beans.factory.annotation.Autowired;

public class ProfileFileServiceImpl implements IProfileFileService {
	
	@Autowired
	private IProfileFileDao profileFileDao;

}
