package kr.or.ddit.projectsupport.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.projectsupport.dao.IProjectSupportDao;
import kr.or.ddit.successboard.dao.ISuccessBoardDao;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProjectSupportServiceImpl implements IProjectSupportService {
	@Autowired
	private IProjectSupportDao dao;
	
	@Override
	public String sendMail(String to, String title, String content) throws Exception {
		return dao.sendMail(to, title, content);
	}

	@Override
	public String sms(String to, String text)
			throws Exception {
		
		return dao.sms(to, text);
	public int generateRandNum(int length) throws Exception {
		return dao.generateRandNum(length);
	}
	
}