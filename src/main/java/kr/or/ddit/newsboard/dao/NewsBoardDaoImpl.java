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

	@Override
	public void insertNewsboard(newsboardVO newsboardInfo) throws Exception {
		// TODO Auto-generated method stub
	 client.insert("newsboard.insertNewsboard",newsboardInfo);
	}

	@Override
	public newsboardVO newsboardInfo(Map<String, String>params) throws Exception {
		
		return (newsboardVO) client.queryForObject("newsboard.newsboardInfo",params);
	}

	@Override
	public int modifyNewsBoard(newsboardVO newsboardInfo) throws Exception {
		// TODO Auto-generated method stub
		return client.update("newsboard.modifyNewsBoard", newsboardInfo);
	}

	@Override
	public int deleteNewsBoard(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return client.update("newsboard.deleteNewsBoard",params);
	}


}
