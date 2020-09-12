package kr.or.ddit.interviewee.dao;

import java.util.HashMap;
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

	@Override
	public List<Map<String, String>> selectEndInterviewee(String project_no)
			throws Exception {
		return client.queryForList("interviewee.selectEndInterviewee", project_no);
	}

	@Override
	public boolean confirmInterviewee(Map<String, String> params)
			throws Exception {
		Boolean result = true;
		
		String[] mem_id_arr = (String.valueOf(params.get("mem_id_all"))).split(",");
		
		for (int i = 0; i < mem_id_arr.length; i++) {
			params.put("mem_id", mem_id_arr[i]);
			int chk = client.update("interviewee.updateIntervieweeStatus", params);
			
			if (!(chk > 0)) {
				result = false;
			}
		}
		
		return result;
	}

	@Override
	public boolean failInterviewee(Map<String, String> params) throws Exception {
		Boolean result = true;
		
		String[] mem_id_arr = (String.valueOf(params.get("mem_id_all"))).split(",");
		
		for (int i = 0; i < mem_id_arr.length; i++) {
			params.put("mem_id", mem_id_arr[i]);
			int chk = client.delete("interviewee.deleteInterviewee", params);
			
			if (!(chk > 0)) {
				result = false;
			}
		}
		
		return result;
	}
}