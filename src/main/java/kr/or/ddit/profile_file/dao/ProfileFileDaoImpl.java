package kr.or.ddit.profile_file.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.ibatis.sqlmap.client.SqlMapClient;

public class ProfileFileDaoImpl implements IProfileFileDao {

	@Autowired
	private SqlMapClient client;
	
}
