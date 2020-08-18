package kr.or.ddit.jobsboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.jobsboard.service.IJobsBoardService;
import kr.or.ddit.vo.JobsBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/jobsboard/")
public class JobsBoardController {
	
	@Autowired
	private IJobsBoardService jobsBoardSerivce;
	
	@RequestMapping("jobsBoardList")
	public ModelAndView josBoardList(ModelAndView modelAndView, HttpServletRequest request) throws Exception{
		
		List<JobsBoardVO> jobsBoardList = this.jobsBoardSerivce.JobsBoardList();
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
        modelAndView.addObject("breadcrumb_first", "체용 공고 게시판");
        modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/jobsboard/jobsBoardList.do");
		
		modelAndView.addObject("jobsBoardList",jobsBoardList);
		modelAndView.setViewName("user/jobsboard/jobsBoardList");
		
		return modelAndView;
	}
}
