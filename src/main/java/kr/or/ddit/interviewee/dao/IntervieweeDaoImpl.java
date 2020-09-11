package kr.or.ddit.interviewee.dao;

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
public class IntervieweeDaoImpl implements IIntervieweeDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public int updateInterviewee(Map<String, String> params) throws Exception {
		return client.update("interviewee.updateInterviewee", params);
	}
}