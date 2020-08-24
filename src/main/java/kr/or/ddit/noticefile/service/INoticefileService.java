package kr.or.ddit.noticefile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticefileVO;

public interface INoticefileService {
	public void insertNoticefile(List<NoticefileVO> noticefile) throws Exception;
	public NoticefileVO noticefileInfo(Map<String, String> params) throws Exception;
}
