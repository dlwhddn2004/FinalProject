package kr.or.ddit.timeline.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.lowagie.text.Paragraph;

@Repository
public class TimelineDaoImpl implements ITimelineDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public List<Map<String, String>> selectTimelineList(
			Map<String, String> params) throws Exception {
		return client.queryForList("timeline.selectTimelineList", params);
	}

	@Override
	public int insertTimeline(Map<String, String> params) throws Exception {
		int chk = 0;
		
		Object obj = client.insert("timeline.insertTimeline", params);
		if (obj == null) {
			chk = 1;
		}
		
		return chk;
	}
}
