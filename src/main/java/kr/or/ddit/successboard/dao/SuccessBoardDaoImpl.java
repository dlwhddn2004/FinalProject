package kr.or.ddit.successboard.dao;

import java.util.List;

import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class SuccessBoardDaoImpl implements ISuccessBoardDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public List<SuccessBoardVO> successboardList() throws Exception {
		List<SuccessBoardVO> list = null;
		
		list = client.queryForList("successboard.successboardList");
		
		return list;
	}

	@Override
	public void insertSuccessBoard(SuccessBoardVO successboardInfo)
			throws Exception {
		
		client.insert("successboard.insertSuccessBoard", successboardInfo);
	}

}
