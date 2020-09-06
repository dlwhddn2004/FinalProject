package kr.or.ddit.noticeboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeboardVO;

public interface INoticeboardService {
	//공지사항 목록조회
	public List<NoticeboardVO> noticeboardList() throws Exception;
	//공지사항 세북 조회
	public NoticeboardVO noticeboardInfo(Map<String, String> params) throws Exception;
	//공지사항 등록(관리자)
	public int insertNoticeboard(NoticeboardVO noticeboardInfo) throws Exception;
	//공지사항 수정
	public int updateNoticeboard(NoticeboardVO noticeboardInfo) throws Exception;
	//공지사항 삭제
	public int deleteNoticeboard(Map<String, String> params) throws Exception;
	//조회수
	public int updatehit(Map<String, String> params) throws Exception;
}
