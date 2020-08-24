package kr.or.ddit.jobsboard.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.jobsboard.service.IJobsBoardService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.vo.JobsBoardCommentVO;
import kr.or.ddit.vo.JobsBoardVO;
import kr.or.ddit.vo.ProfileFileVO;

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
	@Autowired
	private IProfileFileService profileService;
	
	
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
	
	@RequestMapping("jobsBoardForm")
	public ModelAndView jobsBoardForm(HttpServletRequest request,
			 ModelAndView modelAndView){
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
        modelAndView.addObject("breadcrumb_first", "체용 공고 게시판");
        modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/jobsboard/jobsBoardList.do");
		
        modelAndView.addObject("breadcrumb_second", "채용 공고  게시글 등록");
		modelAndView.setViewName("user/jobsboard/jobsBoardForm");
		return modelAndView;
	}
	
	@RequestMapping("insertJobsBoard")
	public String jobsBoardInsert( HttpServletRequest request,
			String jobs_title, String jobs_content, String jobs_startdate, String jobs_enddate, String mem_id) throws Exception{
		
		JobsBoardVO jobsboardInfo = new JobsBoardVO();
		jobsboardInfo.setJobs_content(jobs_content);
		jobsboardInfo.setJobs_title(jobs_title);
		jobsboardInfo.setJobs_startdate(jobs_startdate);
		jobsboardInfo.setJobs_enddate(jobs_enddate);
		jobsboardInfo.setMem_id(mem_id);
		
		this.jobsBoardSerivce.jobsBoardInsert(jobsboardInfo);
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = URLEncoder.encode("게시글이 정상적으로 등록되었습니다.", "UTF-8");
		
		return "redirect:/user/jobsboard/jobsBoardList.do?taskResult=" + taskResult + "&message=" + message;
		
		
	}
	
	@RequestMapping("jobsBoardView")
	public ModelAndView jobsBoardView(Map<String, String> params , ModelAndView modelAndView,
			String jobs_no, HttpServletRequest request, String mem_id) throws Exception{
		params.put("jobs_no", jobs_no);
		params.put("mem_id", mem_id);
		JobsBoardVO jobsboardInfo = new JobsBoardVO();
		
		jobsboardInfo = this.jobsBoardSerivce.jobsBoardInfo(params);
		
		List<JobsBoardCommentVO> jobsBoardCommentInfo = null; 
		jobsBoardCommentInfo =  this.jobsBoardSerivce.jobsBoardCommentList(params);
		ProfileFileVO profileInfo = this.profileService.selectProfileFileInfo(params);
		
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
        modelAndView.addObject("breadcrumb_first", "체용 공고 게시판");
        modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/jobsboard/jobsBoardList.do");
		
        modelAndView.addObject("jobsboardInfo", jobsboardInfo);
        modelAndView.addObject("breadcrumb_second", "채용 공고  게시글 View");
        
        modelAndView.addObject("commentList",jobsBoardCommentInfo);
        modelAndView.addObject("profileInfo", profileInfo);
        
		modelAndView.setViewName("user/jobsboard/jobsBoardView");
		
//		조회수 올리기
		this.jobsBoardSerivce.hitup(params);
		return modelAndView;
	}
	
	
	@RequestMapping("updateJobsBoard")
	public String updateJobsBoard(JobsBoardVO vo) throws Exception{
		int cnt = this.jobsBoardSerivce.modifyJobsBoard(vo);
		System.out.println(vo.getJobs_title());
		String taskResult = null;
		String message = null;
		if (cnt > 0) {
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 수정되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("게시글 수정에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/jobsboard/jobsBoardList.do?taskResult=" + taskResult + "&message=" + message;
		
	}
	
	@RequestMapping("deleteJobsBoard")
	public String deleteJobsBoard(String jobs_no ) throws Exception{
		Map<String,String> params = new HashMap<String, String>();
		params.put("jobs_no", jobs_no);
		
		int cnt =this.jobsBoardSerivce.deleteJobsBoard(params);
		String taskResult= null;
		String message= null;
		if(cnt > 0){
			taskResult= "success";
			message= URLEncoder.encode("게시글이 정상적으로 삭제되었습니다.", "UTF-8");
		} else{
			taskResult= "warning";
			message= URLEncoder.encode("게시글 삭제에 실패했습니다 ","UTF-8");
		}
		return "redirect:/user/jobsboard/jobsBoardList.do?taskResult=" + taskResult + "&message=" + message;
	}
	
	@RequestMapping("insertJobsComment")
	public String insertJobsComment(JobsBoardCommentVO vo) throws Exception{
		
		System.out.println(vo);
		
		int cnt = this.jobsBoardSerivce.insertJobsBoardComment(vo);
		
		String taskResult= null;
		String message= null;
		if(cnt > 0){
			taskResult= "success";
			message= URLEncoder.encode("댓글이 정상적으로 작성되었습니다.", "UTF-8");
		}else{
			taskResult= "warning";
			message= URLEncoder.encode("댓글 작성이 실패되었습니다.", "UTF-8");
		}
		
		return "redirect:/user/jobsboard/jobsBoardView.do?taskResult=" + taskResult+ "&message=" +message + "&jobs_no=" + vo.getJobs_no() + "&mem_id=" + vo.getMem_id();
	}
	
	@RequestMapping("deleteJobsComment")
	public String deleteJobsComment(String comment_seq,String mem_id ,String jobs_no) throws Exception{
		Map<String,String> params = new HashMap<String, String>();
		params.put("comment_seq", comment_seq);
		int cnt = this.jobsBoardSerivce.deleteJobsComment(params);
		
		String taskResult= null;
		String message= null;
		if(cnt > 0 ){
			taskResult= "success";
			message=URLEncoder.encode("댓글이 정상적으로 삭제되었습니다.","UTF-8");
		}else{
			taskResult="warning";
			message=URLEncoder.encode("댓글 삭제가 실패되었습니다.","UTF-8");
		}
		
		return "redirect:/user/jobsboard/jobsBoardView.do?taskResult=" + taskResult+ "&message=" +message +"&jobs_no="+ jobs_no +"&mem_id=" + mem_id;
		
	}
	@RequestMapping("modifyJobsComment")
	public String modifyJobsComment(String comment_seq, String comment_content, String jobs_no, String mem_id) throws Exception{
		Map<String,String> params = new HashMap<String, String>();
		
		System.out.println(comment_content +"글");
		params.put("comment_seq", comment_seq);
		params.put("comment_content", comment_content);
		int cnt = this.jobsBoardSerivce.modifyJobsComment(params);
		
		
		String taskResult= null;
		String message= null;
		
		if(cnt > 0 ){
			taskResult= "success";
			message=URLEncoder.encode("댓글이 정상적으로 수정되었습니다.","UTF-8");
		}else{
			taskResult="warning";
			message=URLEncoder.encode("댓글 수정이 실패되었습니다.","UTF-8");
		}
		
		return "redirect:/user/jobsboard/jobsBoardView.do?taskResult=" + taskResult+ "&message=" +message +"&jobs_no="+ jobs_no +"&mem_id=" +mem_id;
	}
}




