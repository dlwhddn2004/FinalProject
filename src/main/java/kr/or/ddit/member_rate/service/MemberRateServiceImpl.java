package kr.or.ddit.member_rate.service;

import java.util.Map;

import kr.or.ddit.member_rate.dao.IMemberRateDao;
import kr.or.ddit.vo.MemberRateVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberRateServiceImpl implements IMemberRateService {
	@Autowired
	private IMemberRateDao memberRateDao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberRateVO selectMemberRateInfo(Map<String, String> params)
			throws Exception {
		return memberRateDao.selectMemberRateInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertMemberRate(MemberRateVO rateVO) throws Exception {
		memberRateDao.insertMemberRate(rateVO);
	}
}
