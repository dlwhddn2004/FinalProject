package kr.or.ddit.career.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.career.dao.ICareerDao;
import kr.or.ddit.successboard.dao.ISuccessBoardDao;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CareerServiceImpl implements ICareerService {
//	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
//	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	
	@Autowired
	private ICareerDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> selectCareer(Map<String, String> params)
			throws Exception {
		return dao.selectCareer(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int insertCareer(Map<String, String> params) throws Exception {
		return dao.insertCareer(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteCareer(Map<String, String> params) throws Exception {
		return dao.deleteCareer(params);
	}
}
