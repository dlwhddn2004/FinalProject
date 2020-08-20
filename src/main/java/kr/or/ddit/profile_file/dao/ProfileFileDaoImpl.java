package kr.or.ddit.profile_file.dao;

import java.util.Map;

import kr.or.ddit.vo.ProfileFileVO;

import org.springframework.beans.factory.annotation.Autowired;

import com.ibatis.sqlmap.client.SqlMapClient;

public class ProfileFileDaoImpl implements IProfileFileDao {

	@Autowired
	private SqlMapClient client;

	@Override
	public ProfileFileVO selectProfileFileInfo(Map<String, String> params)
			throws Exception {
		return null;
	}
	
}
