package kr.or.ddit.portfolio.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Mypage_memberVO;
import kr.or.ddit.vo.PortFolioReviewVO;
import kr.or.ddit.vo.PortFolioVO;

import org.springframework.web.multipart.MultipartFile;

public interface IPortfolioDao {
	public List<Map<String,String>> selectPortFolioList() throws Exception;
	public Map<String,String> portfolioInfo(Map<String,String> params) throws Exception;
	public Map<String,String> MaxPortfolioNo() throws Exception;
	public Map<String,String> totalAVG(Map<String,String> params) throws Exception;
	public Map<String,String> mainScoreChart(Map<String,String> params) throws Exception;
	
	public void updatePortFolioLike(Map<String,String> params) throws Exception;
	public int InsertPortflio(PortFolioVO portfolioInfo) throws Exception;
	public int updatePortfolio(PortFolioVO portfolioInfo) throws Exception;
	public int deleteportfolio(Map<String,String> params) throws Exception;
	
	// review
	public List<Map<String,String>> selectPortfolioReview(Map<String,String> params) throws Exception;
	public void insertPortfolioReview(PortFolioReviewVO reviewInfo) throws Exception;
	public void updatePortfolioReview(PortFolioReviewVO reviewInfo) throws Exception;
	public Map<String,String> portfolioReviewInfo(Map<String,String> params) throws Exception;
	public void portfolioReviewDelete(Map<String,String> params) throws Exception;
}
