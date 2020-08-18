package kr.or.ddit.freeboard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.FreeboardVO;

@Repository("freeboardDAO")
public class IFreeboardDAOImpl implements IFreeboardDAO {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public List<FreeboardVO> freeboardList(Map<String, String> params) throws Exception {
		return client.queryForList("freeboard.freeboardList", params);
	}

	@Override
	public String insertFreeboard(FreeboardVO fVO) throws Exception {
		return (String) client.insert("freeboard.insertFreeboard", fVO);
	}

	@Override
	public FreeboardVO freeboardInfo(Map<String, String> params) throws Exception {
		return (FreeboardVO) client.queryForObject("freeboard.freeboardInfo", params);
	}

	@Override
	public int deleteFreeboard(Map<String, String> params) throws Exception {
		return client.update("freeboard.deleteFreeboard", params);
			
	}

	@Override
	public int updateFreeboard(FreeboardVO fVO) throws Exception {
		return client.update("freeboard.updateFreeboard", fVO);
		
	}

	@Override
	public String insertFreeboardReply(FreeboardVO fVO) throws Exception {
		// freeboardInfo : 댓글정보(bp_title, bo_nickname...bo_ip)
		// 					부모게시글 정보(bo_group, bo_seq, bo_depth)
		String bo_no = "";
		try {
			// 트랜잭션을 사용하는 이유 : DB에서 처리할 업무가 많아서 트랜잭션으로 처리
			 client.startTransaction();
			 
			 String bo_seq;
			 if ("0".intern() == fVO.getBo_seq().intern()) {
				 bo_seq = (String) client.queryForObject("freeboard.incrementSeq", fVO);
			 } else {
				 client.update("freeboard.updateSeq", fVO);
				 bo_seq = String.valueOf(Integer.parseInt(fVO.getBo_seq()) + 1);
			 }
			 
			 fVO.setBo_seq(bo_seq);
			 
			 String bo_depth = String.valueOf(Integer.parseInt(fVO.getBo_depth()) + 1);
			 fVO.setBo_depth(bo_depth);
			 
			 bo_no = (String) client.insert("freeboard.insertFreeboardReply", fVO);
			 
			 client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return bo_no;
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("freeboard.totalCount", params);
	}

	@Override
	public void hitUp(Map<String, String> params) throws Exception {
		client.update("freeboard.hupUp", params);
		
	}

}
