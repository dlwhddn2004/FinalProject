package kr.or.ddit.successboard.service;

import java.util.List;

import kr.or.ddit.successboard.dao.ISuccessBoardDao;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SuccessBoardServiceImpl implements ISuccessBoardService {
	
	@Autowired
	private ISuccessBoardDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<SuccessBoardVO> successboardList() throws Exception {
		return dao.successboardList();
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertSuccessBoard(SuccessBoardVO successboardInfo)
			throws Exception {
		dao.insertSuccessBoard(successboardInfo);
	}

}
