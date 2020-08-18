package kr.or.ddit.newsboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.newsboard.dao.NewsBoardDao;
import kr.or.ddit.vo.newsboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class NewsBoardServiceImpl implements NewsBoardService{
	@Autowired
	private NewsBoardDao dao;

	@Override
	public List<newsboardVO> newsboardList() throws Exception {
		// TODO Auto-generated method stub
		return dao.newsboardList();
	}
	
	

}
