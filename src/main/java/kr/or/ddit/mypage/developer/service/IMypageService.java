package kr.or.ddit.mypage.developer.service;

import java.util.Map;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.Mypage_memberVO;

import org.springframework.web.multipart.MultipartFile;

public interface IMypageService {

	public int projectFinishNumber(Map<String,String> params) throws Exception;
	public int portfolioFinishNumber(Map<String,String> params) throws Exception;
	public String insertMyabout(Mypage_memberVO vo, MultipartFile[] items)throws Exception;
	public Mypage_memberVO selectMypageInfo(Map<String,String> params) throws Exception;
	public String modifyMyabout(Mypage_memberVO vo, MultipartFile[] items ) throws Exception;
	
}
