package kr.or.ddit.projectApply.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface IProjectApplyService {
	public int insertProjectApplyInformation(Map<String, String> params) throws Exception;
	public Map<String, String> selectProjectApplyInfo(Map<String, String> params) throws Exception;
}