package kr.or.ddit.noticeboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeboardVO;

public interface INoticeboardDAO {
	
	// 공지사항 목록 조회
	public List<NoticeboardVO> noticeboardList(Map<String, String> parmas) throws Exception;
	// 공지사항 상세보기
	public NoticeboardVO noticeboardInfo(Map<String, String> params) throws Exception;
	// 공지사항 등록(관리자)
	public String insertNoticeboard(NoticeboardVO noticeboardInfo) throws Exception;
	
}
