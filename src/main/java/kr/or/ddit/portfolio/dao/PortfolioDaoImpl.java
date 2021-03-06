package kr.or.ddit.portfolio.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Mypage_memberVO;
import kr.or.ddit.vo.PortFolioReviewVO;
import kr.or.ddit.vo.PortFolioVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class PortfolioDaoImpl implements IPortfolioDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<Map<String,String>> selectPortFolioList()  throws Exception{
		
		return client.queryForList("portfolio.selectPortFolioList");
	}

	@Override
	public Map<String, String> portfolioInfo(Map<String, String> params)
			throws Exception {							   
		return (Map<String, String>) client.queryForObject("portfolio.portfolioInfo",params);
	}

	@Override
	public Map<String, String> MaxPortfolioNo()
			throws Exception {
		return (Map<String, String>) client.queryForObject("portfolio.MaxPortfolioNo");
	}

	@Override
	public Map<String, String> totalAVG(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("portfolio.totalAVG",params);
	}

	@Override
	public Map<String, String> mainScoreChart(Map<String, String> params)
			throws Exception {
		
		return (Map<String, String>) client.queryForObject("portfolio.mainScoreChart",params);
	}

	@Override
	public void updatePortFolioLike(Map<String, String> params)
			throws Exception {
		 client.update("portfolio.updatePortFolioLike",params);
	}

	@Override
	public int InsertPortflio(PortFolioVO portfolioInfo) throws Exception {
		int cnt=0; 
		
		Object obj = client.insert("portfolio.InsertPortflio",portfolioInfo);
		if(obj == null){
			cnt = 1;
		}
		return cnt; 
	}

	@Override
	public int updatePortfolio(PortFolioVO portfolioInfo) throws Exception {
		int cnt;
		cnt = client.update("portfolio.updatePortfolio",portfolioInfo);
		return cnt;
	}

	@Override
	public int deleteportfolio(Map<String, String> params) throws Exception {
		int cnt= 0;
		cnt = client.delete("portfolio.deleteportfolio",params);
		return cnt;
	}

	
	@Override
	public List<Map<String,String>> selectPortfolioReview(Map<String,String> params) throws Exception {
		return client.queryForList("portfolio.selectPortfolioReview",params);
	}

	@Override
	public void insertPortfolioReview(PortFolioReviewVO reviewInfo)
			throws Exception {
		client.insert("portfolio.insertPortfolioReview",reviewInfo);
		
	}

	@Override
	public void updatePortfolioReview(PortFolioReviewVO reviewInfo)
			throws Exception {
		client.update("portfolio.updatePortfolioReview",reviewInfo);
	}

	@Override
	public Map<String, String> portfolioReviewInfo(Map<String, String> params)
			throws Exception {
		return (Map<String, String>) client.queryForObject("portfolio.portfolioReviewInfo", params);
	}

	@Override
	public void portfolioReviewDelete(Map<String, String> params)
			throws Exception {
		client.delete("portfolio.portfolioReviewDelete", params);
	}

	

}
