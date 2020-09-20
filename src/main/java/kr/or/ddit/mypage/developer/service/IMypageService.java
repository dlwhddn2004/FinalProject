package kr.or.ddit.mypage.developer.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.Mypage_memberVO;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
@Service
public interface IMypageService {

	public int projectFinishNumber(Map<String,String> params) throws Exception;
	public int portfolioFinishNumber(Map<String,String> params) throws Exception;
	public String insertMyabout(Mypage_memberVO vo, MultipartFile[] items)throws Exception;
	public Mypage_memberVO selectMypageInfo(Map<String,String> params) throws Exception;
	public String modifyMyabout(Mypage_memberVO vo, MultipartFile[] items ) throws Exception;
	public String modifyPartnerAbout(Mypage_memberVO vo,MultipartFile[] items  ) throws Exception;
	
	
	public void insertMypageDeveloper(Mypage_memberVO mypageInfo) throws Exception;
	public List<Map<String,String>> projectTechnologiesChart (Map<String,String> params ) throws Exception;
	public List<Map<String,String>> portfolioMypageList(Map<String,String> params) throws Exception;
	public Map<String,String> mypageTechnologiesCheck(Map<String,String> params) throws Exception;
	
	public int updateTechnologies(Map<String,String> params) throws Exception;
	public void updateTechnologiesCount(Map<String,String> params) throws Exception;
	public List<Map<String,String>> carrerList (Map<String,String> params) throws Exception;
	
	public void insertPartnersmypage (Mypage_memberVO mypageInfo) throws Exception;
	public List<Map<String,String>> partnersProjectChart (Map<String,String> params) throws Exception;
	public Mypage_memberVO partnersmypageInfo (Map<String,String> params) throws Exception;
	public int partnersProjectNum(Map<String,String> params) throws Exception;
}
