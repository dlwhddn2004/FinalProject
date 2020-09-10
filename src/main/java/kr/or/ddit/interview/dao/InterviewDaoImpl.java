package kr.or.ddit.interview.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;
import oracle.net.aso.p;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.lowagie.text.Paragraph;
import com.sun.swing.internal.plaf.metal.resources.metal;

@Repository
public class InterviewDaoImpl implements IInterviewDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<Map<String, String>> selectNotConfirmApplyList(
			Map<String, String> params) throws Exception {
		return client.queryForList("interview.selectNotConfirmApplyList", params);
	}
	
	// ********************************************* JSON ********************************************* //
	
	// 신청자 명단
	@Override
	public List<Map<String, String>> selectConfirmApplyList(Map<String, String> params)
			throws Exception {
		return client.queryForList("interview.selectConfirmApplyList", params);
	}
	
	@Override
	public Map<String, String> infographic(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("interview.infographic", params);
	}

	@Override
	public int hireMember(Map<String, String> params) throws Exception {
		return client.update("interview.hireMember", params);
	}

	@Override
	public Map<String, String> selectMypageDeveloper(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("interview.selectMypageDeveloper", params);
	}
	
	// 면접 캘린더
	@Override
	public List<CalendarVO> selectInterviewCalendar(
			Map<String, String> params) throws Exception {
		return client.queryForList("interview.selectInterviewCalendar", params);
	}

	@Override
	public String insertInterviewCalendar(Map<String, String> params)
			throws Exception {
		return (String) client.insert("interview.insertInterviewCalendar", params);
	}

	@Override
	public Map<String, String> selectMemberInfo(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("interview.selectMemberInfo", params);
	}

	@Override
	public int modifyInterviewCalendar(Map<String, String> params)
			throws Exception {
		return client.update("interview.modifyInterviewCalendar", params);
	}

	@Override
	public int deleteInterviewCalendar(Map<String, String> params)
			throws Exception {
		return client.delete("interview.deleteInterviewCalendar", params);
	}

	@Override
	public Map<String, String> selectProjectApply(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("interview.selectProjectApply", params);
	}

	@Override
	public String insertInterview(Map<String, String> params) throws Exception {
		return (String) client.insert("interview.insertInterview", params);
	}

	@Override
	public Map<String, String> selectInterview(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("interview.selectInterview", params);
	}

	@Override
	public int updateInterview(Map<String, String> params) throws Exception {
		return client.update("interview.updateInterview", params);
	}

	@Override
	public int updateInterviewCalendar(Map<String, String> params)
			throws Exception {
		return client.update("interview.updateInterviewCalendar", params);
	}

	@Override
	public int insertInterviewee(Map<String, String> params) throws Exception {
		int chk = 0;
		
		Object obj = client.insert("interview.insertInterviewee", params);
		
		if (obj == null) {
			chk = 1;
		}
		
		return chk;
	}

	@Override
	public int deleteProjectApply(Map<String, String> params) throws Exception {
		return client.delete("interview.deleteProjectApply", params);
	}

	@Override
	public Map<String, String> selectIntervieweeInfo(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("interview.selectIntervieweeInfo", params);
	}

	@Override
	public int deleteInterviewee(Map<String, String> params) throws Exception {
		return client.delete("interview.deleteInterviewee", params);
	}

	@Override
	public int insertProjectApply(Map<String, String> params) throws Exception {
		int chk = 0;
		
		Object obj = client.insert("interview.insertProjectApply", params);
		
		if (obj == null) {
			chk = 1;
		}
		
		return chk;
	}

	@Override
	public int selectSuccessProjectCnt(Map<String, String> params)
			throws Exception {
		int result = 0;
		
		Object obj = client.queryForObject("interview.selectSuccessProjectCnt", params);
		if (obj == null) {
			result = 0;
		} else {
			result = (int) obj;
		}
		
		return result;
	}

	@Override
	public int selectInsertPortfolioCnt(Map<String, String> params)
			throws Exception {
		int result = 0;
		
		Object obj = client.queryForObject("interview.selectInsertPortfolioCnt", params);
		if (obj == null) {
			result = 0;
		} else {
			result = (int) obj;
		}
		
		return result;
	}

	@Override
	public int selectCareerCnt(Map<String, String> params) throws Exception {
		int result = 0;
		
		Object obj = client.queryForObject("interview.selectCareerCnt", params);
		if (obj == null) {
			result = 0;
		} else {
			result = (int) obj;
		}
		
		return result;
	}

	@Override
	public List<Map<String, String>> selectAttendInterview(
			Map<String, String> params) throws Exception {
		return client.queryForList("interview.selectAttendInterview", params);
	}
}
