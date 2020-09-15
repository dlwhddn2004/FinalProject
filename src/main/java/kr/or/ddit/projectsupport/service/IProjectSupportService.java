package kr.or.ddit.projectsupport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.projectsupport.dao.IProjectSupportDao;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface IProjectSupportService {
	public String sendMail(String to, String title, String content) throws Exception;
	
	public int generateRandNum(int length) throws Exception;
}