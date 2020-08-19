package kr.or.ddit.noticeboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeboardVO;

public interface INoticeboardDAO {
	
	public List<NoticeboardVO> noticeboardList(Map<String, String> parmas) throws Exception;

}
