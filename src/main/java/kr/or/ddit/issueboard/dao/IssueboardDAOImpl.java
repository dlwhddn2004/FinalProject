package kr.or.ddit.issueboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.IssueJoinVO;
import kr.or.ddit.vo.IssueboardCommentVO;
import kr.or.ddit.vo.IssueboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IssueboardDAOImpl implements IIssueboardDAO{
	
	@Autowired SqlMapClient client;

	@Override
	public List<IssueJoinVO> issueboardList(Map<String, String> params) throws Exception {
		return client.queryForList("issueboard.issueboardList", params);
	}

	@Override
	public IssueJoinVO issuboardInfo(Map<String, String> params)
			throws Exception {
		return (IssueJoinVO) client.queryForObject("issueboard.issueboardInfo",params);
	}

	@Override
	public int insertIssueboard(IssueboardVO issueboardInfo)
			throws Exception {
		int chk = 0;
		
		Object obj = client.insert("issueboard.insertIssueboard", issueboardInfo);
		if (obj == null){
			chk = 1;
		}
		return chk;
	}

	@Override
	public int updateIssueboard(IssueJoinVO issueboardInfo) throws Exception {
		return client.update("issueboard.updateIssueboard", issueboardInfo);
	}

	@Override
	public int deleteIssueboard(Map<String, String> params) throws Exception {
		return client.update("issueboard.deleteIssueboard", params);
	}

	@Override
	public List<IssueboardCommentVO> commentList(Map<String, String> params)
			throws Exception {
		return client.queryForList("issueboard_comment.issuecommentList", params);
	}

	@Override
	public int insertComment(IssueboardCommentVO issuecommentInfo)
			throws Exception {
		int chk = 0;
		
		Object obj = client.insert("issueboard_comment.insertissueComment", issuecommentInfo);
		
		if (obj == null) {
			chk = 1;
		}
		
		return chk;
	}

	@Override
	public int updateComment(Map<String, String> params) throws Exception {
		return client.update("issueboard_comment.updateissueComment", params);
	}

	@Override
	public int deleteComment(Map<String, String> params) throws Exception {
		return client.delete("issueboard_comment.deleteissueComment", params);
	}

	@Override
	public int updateHit(Map<String, String> params) throws Exception {
		return client.update("issueboard.updatehit", params);
	}

}
