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
	public List<NoticeboardVO> noticeboardList()
			throws Exception {
		
		return client.queryForList("noticeboard.noticeboardList");
	}

	@Override
	public NoticeboardVO noticeboardInfo(Map<String, String> params)
			throws Exception {
		
		return (NoticeboardVO) client.queryForObject("noticeboard.noticeboardInfo", params);
	}

	@Override
	public int insertNoticeboard(NoticeboardVO noticeboardInfo)
			throws Exception {
		int chk = 0;
		
		Object obj = client.insert("noticeboard.insertNoticeboard", noticeboardInfo);
		if (obj == null){
			chk = 1;
		}
		return chk;
	}

	@Override
	public int updateNoticeboard(NoticeboardVO noticeboardInfo)
			throws Exception {
		return client.update("noticeboard.updateNoticeboard", noticeboardInfo);
	}

	@Override
	public int deleteNoticeboard(Map<String, String> params)
			throws Exception {
		return client.update("noticeboard.deleteNoticeboard", params);
	}

	@Override
	public int updatehit(Map<String, String> params) throws Exception {
		return client.update("noticeboard.updatehit", params);
	}

}
