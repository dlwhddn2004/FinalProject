package kr.or.ddit.newsboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.newsboard.dao.NewsBoardDao;
import kr.or.ddit.vo.newsboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service

public class NewsBoardServiceImpl implements NewsBoardService{
	@Autowired
	private NewsBoardDao dao;
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<newsboardVO> newsboardList() throws Exception {
		// TODO Auto-generated method stub
		return dao.newsboardList();
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public void insertNewsboard(newsboardVO newsboardInfo) throws Exception {
		
	 dao.insertNewsboard(newsboardInfo);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public newsboardVO newsboardInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return dao.newsboardInfo(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int modifyNewsBoard(newsboardVO newsboardInfo) throws Exception {
		
		return dao.modifyNewsBoard(newsboardInfo);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteNewsBoard(Map<String, String> params) throws Exception {
	
		return dao.deleteNewsBoard(params);
	}
	
	

}
