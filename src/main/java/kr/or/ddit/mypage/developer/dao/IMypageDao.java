package kr.or.ddit.mypage.developer.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Mypage_memberVO;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
@RequestMapping
public interface IMypageDao {

	public int projectFinishNumber(Map<String,String> params) throws Exception;
	public int portfolioFinishNumber(Map<String,String> params) throws Exception;
	public String insertMyabout(Mypage_memberVO vo)throws Exception;
	//페이지 자기소개 정보
	public Mypage_memberVO selectMypageInfo(Map<String,String> params) throws Exception;
	
	public String modifyMyabout(Mypage_memberVO vo ) throws Exception; 

	
	public void insertMypageDeveloper(Mypage_memberVO mypageInfo) throws Exception;
	
	//참여한 프로젝트 Chart
	public List<Map<String,String>> projectTechnologiesChart (Map<String,String> params ) throws Exception;
	// 등록한 포트폴리오들
	public List<Map<String, String>> portfolioMypageList(Map<String, String> params) throws Exception;
	// 기술을 등록했는지 안했는지 체크
	public Map<String,String> mypageTechnologiesCheck(Map<String,String> params) throws Exception;
	// 마이페이지 관련 기술 , 경험 숙련도 업데이트
	public int updateTechnologies(Map<String,String> params) throws Exception;
	public void updateTechnologiesCount(Map<String,String> params) throws Exception;
	
}
