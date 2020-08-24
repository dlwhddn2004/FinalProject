package kr.or.ddit.timeline.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;

public interface ITimelineService {
	// project_no, mem_id를 넘겨줘서 타임라인 목록을 조회
	public List<Map<String, String>> selectTimelineList(Map<String, String> params) throws Exception;
}
