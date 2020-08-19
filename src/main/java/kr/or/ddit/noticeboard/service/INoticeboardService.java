package kr.or.ddit.noticeboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeboardVO;

public interface INoticeboardService {
	public List<NoticeboardVO> noticeboardList(Map<String, String> parmas) throws Exception;

}
