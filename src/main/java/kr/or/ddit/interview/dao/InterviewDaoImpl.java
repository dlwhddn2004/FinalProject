package kr.or.ddit.interview.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

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
}
