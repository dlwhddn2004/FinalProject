package kr.or.ddit.interview.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.successboard.service.ISuccessBoardService;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;
import kr.or.ddit.vo.newsboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/interview/")
public class InterviewController {
	
	@RequestMapping("partnersMain")
	public ModelAndView successList(HttpServletRequest request,
									ModelAndView modelAndView,
									String mem_id,
									String project_no) throws Exception {
	
	// breadcrumb
	modelAndView.addObject("breadcrumb_title", "프로젝트");
	modelAndView.addObject("breadcrumb_first", "프로젝트 상세");
	modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/projectView.do?mem_id=" + mem_id + "&project_no=" + project_no);
	modelAndView.addObject("breadcrumb_second", "면접");
	
	modelAndView.setViewName("user/interview/interview-partners");
	
	return modelAndView;
	}
	
}
