package kr.or.ddit.noticeboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("noticeboardDAO")
public class NoticebaordDAOImpl implements INoticeboardDAO {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public List<NoticeboardVO> noticeboardList(Map<String, String> params)
			throws Exception {
		
		return client.queryForList("noticeboard.noticeboardList", params);
	}

}
