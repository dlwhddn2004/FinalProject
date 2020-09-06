package kr.or.ddit.mypage.developer.dao;

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
}
