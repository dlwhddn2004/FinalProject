package kr.or.ddit.career.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.lowagie.text.Paragraph;

@Repository
public class CareerDaoImpl implements ICareerDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<Map<String, String>> selectCareer(Map<String, String> params)
			throws Exception {
		return client.queryForList("career.selectCareer", params);
	}

	@Override
	public int insertCareer(Map<String, String> params) throws Exception {
		int chk = 0;
		
		Object obj = client.insert("career.insertCareer", params);
		
		if (obj == null) {
			chk = 1;
		}
		
		return chk;
	}

	@Override
	public int deleteCareer(Map<String, String> params) throws Exception {
		return client.delete("career.deleteCareer", params);
	}
}
