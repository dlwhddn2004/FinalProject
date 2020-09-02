package kr.or.ddit.issueboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.IssueJoinVO;
import kr.or.ddit.vo.IssueboardCommentVO;
import kr.or.ddit.vo.IssueboardVO;

public interface IIssueboardService {
	
	public List<IssueJoinVO> issueboardList(Map<String, String> params) throws Exception; 
	public IssueJoinVO issuboardInfo(Map<String, String> params) throws Exception;
	public int insertIssueboard(IssueboardVO issueboardInfo) throws Exception;
	public int updateIssueboard(IssueJoinVO issueboardInfo) throws Exception;
	public int deleteIssueboard(Map<String, String> params) throws Exception;
	
	
	//댓글
	public List<IssueboardCommentVO> commentList(Map<String, String> params) throws Exception;
	public int insertComment(IssueboardCommentVO issuecommentInfo) throws Exception;
	public int updateComment(Map<String, String> params) throws Exception;
	public int deleteComment(Map<String, String> params) throws Exception;
	
	//조회수
	public int updateHit(Map<String, String> params) throws Exception;
}
