package kr.or.ddit.project.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ProjectDaoImpl implements IProjectDao {
	
	@Autowired
	private SqlMapClient client;

}
