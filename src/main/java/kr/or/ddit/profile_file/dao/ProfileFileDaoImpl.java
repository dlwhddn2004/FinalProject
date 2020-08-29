package kr.or.ddit.profile_file.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.ProfileFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ProfileFileDaoImpl implements IProfileFileDao {

	@Autowired
	private SqlMapClient client;

	@Override
	public ProfileFileVO selectProfileFileInfo(Map<String, String> params)
			throws Exception {
		return (ProfileFileVO) client.queryForObject("profile_file.selectProfileFileInfo", params);
	}

	@Override
	public void insertProfileFileInfo(ProfileFileVO profileInfo)
			throws Exception {
		client.insert("profile_file.insertProfileFile", profileInfo);
	}

	@Override
	public void insertMypageFileInfo(List<ProfileFileVO> fileitemList)
			throws Exception {
		
		for (ProfileFileVO fileitem : fileitemList) {
			client.update("profile_file.insertMypageFileInfo", fileitem);
		}
		
	}
	
}
