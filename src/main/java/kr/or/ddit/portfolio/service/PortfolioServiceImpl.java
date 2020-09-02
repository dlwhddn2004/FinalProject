package kr.or.ddit.portfolio.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.mypage.developer.dao.IMypageDao;
import kr.or.ddit.portfolio.dao.IPortfolioDao;
import kr.or.ddit.profile_file.dao.IProfileFileDao;
import kr.or.ddit.project.dao.IProjectDao;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.utiles.AttachFileMapperMember;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.Mypage_memberVO;
import kr.or.ddit.vo.PortFolioVO;
import kr.or.ddit.vo.ProfileFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
@Service
public class PortfolioServiceImpl implements IPortfolioService{
	
	@Autowired
	IPortfolioDao portfolioDao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String,String>> selectPortFolioList()
			throws Exception {
		return portfolioDao.selectPortFolioList();
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> portfolioInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return portfolioDao.portfolioInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> MaxPortfolioNo()
			throws Exception {
		return portfolioDao.MaxPortfolioNo();
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> totalAVG(Map<String, String> params)
			throws Exception {
		return portfolioDao.totalAVG(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> mainScoreChart(Map<String, String> params)
			throws Exception {
		return portfolioDao.mainScoreChart(params);
	}

	
		

}
