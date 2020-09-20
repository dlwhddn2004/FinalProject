package kr.or.ddit.mypage.developer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.mypage.developer.dao.IMypageDao;
import kr.or.ddit.profile_file.dao.IProfileFileDao;
import kr.or.ddit.project.dao.IProjectDao;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.utiles.AttachFileMapperMember;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.Mypage_memberVO;
import kr.or.ddit.vo.ProfileFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
@Service("mypageService")
public class IMypageServiceImpl implements IMypageService{
	
	@Autowired
	private IMypageDao dao;
	
	@Autowired
	private IProfileFileDao fileDao;
	
	@Autowired
	private IProjectDao projectProfileDao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int projectFinishNumber(Map<String, String> params) throws Exception {
		return dao.projectFinishNumber(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int portfolioFinishNumber(Map<String, String> params)
			throws Exception {
		return dao.portfolioFinishNumber(params);
	}
	
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertMyabout(Mypage_memberVO vo, MultipartFile[] items)
			throws Exception {
		String mypage_no = dao.insertMyabout(vo);
		String mem_id = vo.getMem_id();
		List<ProfileFileVO> fileItemList = AttachFileMapperMember.mapper(items, mypage_no,mem_id);
		fileDao.insertMypageFileInfo(fileItemList);
		
		return mypage_no;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Mypage_memberVO selectMypageInfo(Map<String, String> params)
			throws Exception {
		return dao.selectMypageInfo(params);
	}
	
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String modifyMyabout(Mypage_memberVO vo, MultipartFile[] items) throws Exception {
		String mypasge_no = null;
			mypasge_no = dao.modifyMyabout(vo);
			
		String mem_id =vo.getMem_id();
		List<ProfileFileVO> fileItemList = AttachFileMapperMember.mapper(items, mypasge_no, mem_id);
		fileDao.insertMypageFileInfo(fileItemList);
		
		return mypasge_no;
		
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertMypageDeveloper(Mypage_memberVO mypageInfo)
			throws Exception {
		dao.insertMypageDeveloper(mypageInfo);
		
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> projectTechnologiesChart(
			Map<String, String> params) throws Exception {
		return dao.projectTechnologiesChart(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> portfolioMypageList(
			Map<String, String> params) throws Exception {
		return dao.portfolioMypageList(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> mypageTechnologiesCheck(
			Map<String, String> params) throws Exception {
		return dao.mypageTechnologiesCheck(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateTechnologies(Map<String, String> params) throws Exception {
		return dao.updateTechnologies(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateTechnologiesCount(Map<String,String> params ) throws Exception {
		 dao.updateTechnologiesCount(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> carrerList(Map<String, String> params)
			throws Exception {
		return dao.carrerList(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertPartnersmypage(Mypage_memberVO mypageInfo)
			throws Exception {
		dao.insertPartnersmypage(mypageInfo);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> partnersProjectChart(
			Map<String, String> params) throws Exception {
		return dao.partnersProjectChart(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Mypage_memberVO partnersmypageInfo(Map<String, String> params)
			throws Exception {
		return dao.partnersmypageInfo(params);
	}
	
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String modifyPartnerAbout(Mypage_memberVO vo, MultipartFile[] items)
			throws Exception {
		String mypasge_no = dao.modifyPartnerAbout(vo);
		String mem_id =vo.getMem_id();
		List<ProfileFileVO> fileItemList = AttachFileMapperMember.mapper(items, mypasge_no, mem_id);
		fileDao.insertMypageFileInfo(fileItemList);
		
		return mypasge_no;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int partnersProjectNum(Map<String, String> params) throws Exception {
		return dao.partnersProjectNum(params);
	}

}
