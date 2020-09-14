package kr.or.ddit.interviewee.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface IIntervieweeDao {
	public int updateInterviewee(Map<String, String> params) throws Exception;
	
	public List<Map<String, String>> selectEndInterviewee(String project_no) throws Exception;
	
	public boolean confirmInterviewee(Map<String, String> params) throws Exception;
	
	public boolean failInterviewee(Map<String, String> params) throws Exception;
	
	public List<Map<String, String>> selectSuccessInterviewee(String project_no) throws Exception;
	
	public Boolean assignRole(Map<String, String> params) throws Exception;
}