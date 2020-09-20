package kr.or.ddit.find.service;

import java.util.Map;

import kr.or.ddit.find.dao.IFindDAO;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FIndServiceImpl implements IFindService{
	
	@Autowired
	private IFindDAO finddao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> findIDMail(Map<String, String> params)
			throws Exception {
		return finddao.findIDMail(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> findIDTel(Map<String, String> params)
			throws Exception {
		return finddao.findIDTel(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> findPW(Map<String, String> params)
			throws Exception {
		return finddao.findPW(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updatePW(Map<String, String> params) throws Exception {
		return finddao.updatePW(params);
	}

	

	
	
	

}
