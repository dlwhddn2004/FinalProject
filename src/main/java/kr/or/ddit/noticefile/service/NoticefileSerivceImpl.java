package kr.or.ddit.noticefile.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.noticefile.dao.INoticefileDAO;
import kr.or.ddit.vo.NoticefileVO;

@Service
public class NoticefileSerivceImpl implements INoticefileService{
	@Autowired
	private INoticefileDAO fileDAO;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertNoticefile(List<NoticefileVO> noticefile)
			throws Exception {
		
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public NoticefileVO noticefileInfo(Map<String, String> params)
			throws Exception {
		return fileDAO.noticefileInfo(params);
	}

}
