package kr.or.ddit.portfolio.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.Mypage_memberVO;
import kr.or.ddit.vo.PortFolioVO;

import org.springframework.web.multipart.MultipartFile;

public interface IPortfolioService {
	public List<Map<String,String>> selectPortFolioList() throws Exception;
	public Map<String,String> portfolioInfo(Map<String,String> params) throws Exception;
	public Map<String,String> MaxPortfolioNo() throws Exception;
	public Map<String,String> totalAVG(Map<String,String> params) throws Exception;
	public Map<String,String> mainScoreChart(Map<String,String> params) throws Exception;
	public void updatePortFolioLike(Map<String,String> params) throws Exception;
}
