package kr.or.ddit.projectsupport.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.projectsupport.dao.IProjectSupportDao;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface IProjectSupportService {
	public String sendMail(String to, String title, String content) throws Exception;
<<<<<<< HEAD
	public String sms(String to, String text) throws Exception;
=======
	
	public int generateRandNum(int length) throws Exception;
>>>>>>> 39a4e0f6169168826377da490f73321f6f2b0f5d
}