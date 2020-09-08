package kr.or.ddit.career.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.career.dao.ICareerDao;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface ICareerService {
	public List<Map<String, String>> selectCareer(Map<String, String> params) throws Exception;
	public int insertCareer(Map<String, String> params) throws Exception;
	public int deleteCareer(Map<String, String> params) throws Exception;
}
