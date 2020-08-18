package kr.or.ddit.successboard.service;

import java.util.List;

import kr.or.ddit.successboard.dao.ISuccessBoardDao;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SuccessBoardServiceImpl implements ISuccessBoardService {
	
	@Autowired
	private ISuccessBoardDao dao;

	@Override
	public List<SuccessBoardVO> successboardList() throws Exception {
		return dao.successboardList();
	}

}
