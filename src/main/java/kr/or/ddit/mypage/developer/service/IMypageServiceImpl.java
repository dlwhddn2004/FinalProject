package kr.or.ddit.mypage.developer.service;

import java.util.Map;

import kr.or.ddit.mypage.developer.dao.IMypageDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
@Service("mypageService")
public class IMypageServiceImpl implements IMypageService{

	
	@Autowired
	private IMypageDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int projectFinishNumber(Map<String, String> params) throws Exception {
		return dao.portfolioFinishNumber(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int portfolioFinishNumber(Map<String, String> params)
			throws Exception {
		return dao.portfolioFinishNumber(params);
	}

}
