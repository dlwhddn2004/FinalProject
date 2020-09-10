package kr.or.ddit.reportboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.reportboard.dao.IReportBoardDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReportBoardServiceImpl implements IReportBoardService {
	@Autowired
	private IReportBoardDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, String>> reportboardList(Map<String, String> params) throws Exception {
		return dao.reportboardList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Map<String, String> selectReportboard(Map<String, String> params)
			throws Exception {
		return dao.selectReportboard(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertReportboard(Map<String, String> params)
			throws Exception {
		return dao.insertReportboard(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateReportboard(Map<String, String> params) throws Exception {
		return dao.updateReportboard(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteReportboard(Map<String, String> params) throws Exception {
		return dao.deleteReportboard(params);
	}

}
