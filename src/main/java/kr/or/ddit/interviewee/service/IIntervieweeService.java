package kr.or.ddit.interviewee.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.interviewee.dao.IntervieweeDaoImpl;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface IIntervieweeService {
	public int updateInterviewee(Map<String, String> params) throws Exception;
	
	public List<Map<String, String>> selectEndInterviewee(String project_no) throws Exception;
	
	public boolean confirmInterviewee(Map<String, String> params) throws Exception;
	
	public boolean failInterviewee(Map<String, String> params) throws Exception;
}