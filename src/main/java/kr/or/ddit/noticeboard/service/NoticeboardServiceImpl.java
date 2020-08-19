package kr.or.ddit.noticeboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.noticeboard.dao.INoticeboardDAO;
import kr.or.ddit.vo.NoticeboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("noticeboardService")
public class NoticeboardServiceImpl implements INoticeboardService{
	
	@Autowired
	private INoticeboardDAO noticebaordDAO;

	@Override
	public List<NoticeboardVO> noticeboardList(Map<String, String> parmas)
			throws Exception {

		return noticebaordDAO.noticeboardList(parmas);
	}

	@Override
	public NoticeboardVO noticeboardInfo(Map<String, String> params)
			throws Exception {
		
		return noticebaordDAO.noticeboardInfo(params);
	}

	@Override
	public String insertNoticeboard(NoticeboardVO noticeboardInfo)
			throws Exception {
		return noticebaordDAO.insertNoticeboard(noticeboardInfo);
	}

}
