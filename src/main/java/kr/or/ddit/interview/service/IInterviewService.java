package kr.or.ddit.interview.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface IInterviewService {
	
	public List<Map<String, String>> selectNotConfirmApplyList(Map<String, String> params) throws Exception;
	
	// ********************************************* JSON ************* ******************************** //
	// 면접 설정
	// 1. 기본 설정
	public String insertInterview(Map<String, String> params) throws Exception;
	
	// 신청자 명단
	public List<Map<String, String>> selectConfirmApplyList(Map<String, String> params) throws Exception;
	public Map<String, String> infographic(Map<String, String> params) throws Exception;
	public int hireMember(Map<String, String> params) throws Exception;
	public Map<String, String> selectMypageDeveloper(Map<String, String> params) throws Exception;
	
	// 면접 캘린더
	public List<CalendarVO> selectInterviewCalendar(Map<String, String> params) throws Exception;
	
	public String insertInterviewCalendar(Map<String, String> params) throws Exception;
	
	public Map<String, String> selectMemberInfo(Map<String, String> params) throws Exception;
	
	public int modifyInterviewCalendar(Map<String, String> params) throws Exception;
	
	public int deleteInterviewCalendar(Map<String, String> params) throws Exception;
	
	public int updateInterviewCalendar(Map<String, String> params) throws Exception;
	
	// 공통
	public Map<String, String> selectProjectApply(Map<String, String> params) throws Exception;
	
	public int insertProjectApply(Map<String, String> params) throws Exception;
	
	public int deleteProjectApply(Map<String, String> params) throws Exception;
	
	public Map<String, String> selectInterview(Map<String, String> params) throws Exception;
	
	public int updateInterview(Map<String, String> params) throws Exception;
	
	public Map<String, String> selectIntervieweeInfo(Map<String, String> params) throws Exception;
	
	public int insertInterviewee(Map<String, String> params) throws Exception;
	
	public int deleteInterviewee(Map<String, String> params) throws Exception;
	
	// 사용자 정보
	// - 진행한 프로젝트 수
	public int selectSuccessProjectCnt(Map<String, String> params) throws Exception;
	
	// - 등록한 포트폴리오 수
	public int selectInsertPortfolioCnt(Map<String, String> params) throws Exception;
	
	// - 경력 수
	public int selectCareerCnt(Map<String, String> params) throws Exception;
	
	////////////////////////////////////
	
	public List<Map<String, String>> selectAttendInterview(Map<String, String> params) throws Exception;
	
	public int endInterviewSchedule(String id) throws Exception;
	
	public Map<String, String> selectCalendarInterview(String id) throws Exception;
}
