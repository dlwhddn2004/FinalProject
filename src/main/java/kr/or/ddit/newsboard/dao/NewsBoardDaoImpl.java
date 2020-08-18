package kr.or.ddit.newsboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.newsboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("NewsBoardDao")
public class NewsBoardDaoImpl implements NewsBoardDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public List<newsboardVO> newsboardList() throws Exception {
			List<newsboardVO> list = null;
			
			list = client.queryForList("newsboard.newsboardList");
		
		
		return list;
	}


}
