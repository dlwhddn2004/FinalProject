package kr.or.ddit.noticeboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.noticeboard.dao.INoticeboardDAO;
import kr.or.ddit.vo.NoticeboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("noticeboardService")
public class NoticeboardServiceImpl implements INoticeboardService{
	
	@Autowired
	private INoticeboardDAO noticebaordDAO;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<NoticeboardVO> noticeboardList(Map<String, String> parmas)
			throws Exception {

		return noticebaordDAO.noticeboardList(parmas);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public NoticeboardVO noticeboardInfo(Map<String, String> params)
			throws Exception {
		
		return noticebaordDAO.noticeboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertNoticeboard(NoticeboardVO noticeboardInfo)
			throws Exception {
		return noticebaordDAO.insertNoticeboard(noticeboardInfo);
	}
    
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateNoticeboard(NoticeboardVO noticeboardInfo)
			throws Exception {
		// TODO Auto-generated method stub
		return noticebaordDAO.updateNoticeboard(noticeboardInfo);
	}
	
	
	

}
