package kr.or.ddit.riskboard.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.riskboard.service.IRiskboardService;
import kr.or.ddit.timeline.service.ITimelineService;
import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.ProjectParticipantsVO;
import kr.or.ddit.vo.Project_ProjectParticipantsVO;
import kr.or.ddit.vo.RiskJoinVO;
import kr.or.ddit.vo.RiskboardCommentVO;
import kr.or.ddit.vo.RiskboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.bcel.internal.generic.Select;


@Controller
@RequestMapping("user/riskboard")
public class RiskboardController{
	
	@Autowired
	private IRiskboardService riskboardservice;
	@Autowired
	private IProfileFileService profileservice;
	@Autowired
	private IProjectService projectService;
	@Autowired
	private ITimelineService timelineService;
	
	@RequestMapping("riskboardList")
	public ModelAndView riskList(HttpServletRequest request,
								 ModelAndView modelView,
								 Map<String, String>params,
								 @RequestParam String project_no,
								 String risk_no) throws Exception{
		
		params.put("project_no", project_no);
		
		List<RiskJoinVO> riskboardList = this.riskboardservice.riskboardList(params);
		
		Map<String, String> projectInfo = projectService.selectProjectInfo(params);
		
		modelView.addObject("breadcrumb_title", "프로젝트");
		modelView.addObject("breadcrumb_first", "위험 관리 게시판");
		modelView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/riskboard/riskboardList.do?project_no=" + project_no);
		
		modelView.addObject("riskboardList", riskboardList);
		modelView.addObject("projectInfo", projectInfo);
		modelView.setViewName("user/riskboard/riskboardList");
		
		return modelView;
	}
	
	@RequestMapping("riskboardForm")
	public ModelAndView riskboardForm(HttpServletRequest request,
									  ModelAndView modelView,
									  String project_no) throws Exception{
		
		modelView.addObject("breadcrumb_title" , "프로젝트");
		modelView.addObject("breadcrumb", "위험 관리 게시판");
		modelView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/riskboard/riskboardList.do?project_no=" + project_no);
		modelView.addObject("breadcrumb_second", "위험 관리 게시글 등록");
		
		modelView.setViewName("user/riskboard/riskboardForm");
		
		return modelView;
	}
	
	@RequestMapping("riskboardView")
	public ModelAndView riskboardView(ModelAndView modelView,
									  String risk_no,
									  String mem_id,
									  String project_no,
									  String risk_errorstatus,
									  HttpServletRequest request) throws Exception{
		
		modelView.addObject("breadcrumb_title", "프로젝트");
		modelView.addObject("breadcrumb_first", "위험 관리 게시판");
		modelView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/riskboard/riskboardList.do?project_no=" + project_no);
		modelView.addObject("breadcrumb_second", "위험 관리 게시글 보기");
		
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("risk_no", risk_no);
		params.put("mem_id", mem_id);
		params.put("project_no", project_no);
		params.put("risk_errorstatus", risk_errorstatus);
		
		RiskboardVO riskboardInfo = riskboardservice.riskboardInfo(params);
		List<RiskboardCommentVO> commentList = riskboardservice.commentList(params);
		
		riskboardservice.updateHit(params);
		ProfileFileVO profileInfo = profileservice.selectProfileFileInfo(params);
		
		modelView.addObject("profileInfo", profileInfo);
		modelView.addObject("commentList", commentList);
		modelView.addObject("riskboardInfo", riskboardInfo);
		
		return modelView;
	
	}
	
	@RequestMapping("insertRiskboard")
	public String insertRiskboard(HttpServletRequest request,
								  HttpServletResponse response,
								  String risk_title,
								  String risk_content,
								  String project_no,
								  String mem_id,
								  String risk_errorstatus,
								  String timeline_title,
								  String timeline_content,
								  String timeline_tag,
								  String timeline_category)throws Exception{
		Map<String, String> no = new HashMap<String, String>();
		no.put("project_no", project_no);
		
		RiskboardVO riskboardInfo = new RiskboardVO();
		riskboardInfo.setProject_no(project_no);
		riskboardInfo.setMem_id(mem_id);
		riskboardInfo.setRisk_title(risk_title);
		riskboardInfo.setRisk_content(risk_content);
		riskboardInfo.setRisk_errorstatus(risk_errorstatus);
		
		riskboardservice.insertRiskboard(riskboardInfo);
		
		Map<String, String> projectInfo = projectService.selectProjectInfo(no);
		
		List<String> list = new ArrayList<String>();
		if (projectInfo.get("PL") != null) {
			list.add(String.valueOf(projectInfo.get("PL")));
		}
		if (projectInfo.get("DA") != null) {
			list.add(String.valueOf(projectInfo.get("DA")));
		}
		if (projectInfo.get("TA") != null) {
			list.add(String.valueOf(projectInfo.get("TA")));
		}
		if (projectInfo.get("UA") != null) {
			list.add(String.valueOf(projectInfo.get("UA")));
		}
		if (projectInfo.get("AA") != null) {
			list.add(String.valueOf(projectInfo.get("AA")));
		}
		

		
		for (int i = 0; i < list.size(); i++) {
			
				Map<String, String> params = new HashMap<String, String>();
				params.put("mem_id",list.get(i));
				params.put("project_no", project_no);
				params.put("timeline_title", "위험요소 발생");
				params.put("timeline_content", "새로운 위험요소가 등록되었습니다");
				params.put("timeline_tag", "RISK");
				params.put("timeline_category", "N");

				timelineService.insertTimeline(params);
			
			
		}

		
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = URLEncoder.encode("게시글이 정상적으로 등록되었습니다.", "UTF-8");

		return "redirect:/user/riskboard/riskboardList.do?project_no=" + project_no + "&taskResult=" + taskResult + "&message" + message;
	}
	
	@RequestMapping("updateRiskboard")
	public String updateRiskboard(RiskboardVO riskboardInfo,
								  String project_no)throws Exception{
		
		int chk = riskboardservice.updateRiskboard(riskboardInfo);
		
		String taskResult = null;
		String message = null;
		if (chk > 0){
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 수정되었습니다", "UTF-8");
		}else{
			taskResult = "warning";
			message = URLEncoder.encode("게시글 수정에 실패했습니다", "UTF-8");
		}
		
		return "redirect:/user/riskboard/riskboardList.do?taskResult=" + taskResult + "&message=" + message + "&project_no=" + project_no;
	}
	
	@RequestMapping("deleteRiskboard")
	public String deleteRiskboard(String risk_no,
								  String project_no) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("risk_no", risk_no);
		params.put("project_no", project_no);
		int chk = riskboardservice.deleteRiskboard(params);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 삭제되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("게시글 삭제에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/riskboard/riskboardList.do?taskResult=" + taskResult + "&message=" + message + "&project_no=" + project_no;
		
	}
	
	@RequestMapping("insertriskComment")
	public String insertissueComment(RiskboardCommentVO riskcommentInfo
								     ,String project_no) throws Exception{
		

		
		int chk = riskboardservice.insertComment(riskcommentInfo);
		
		String taskResult = null;
		String message = null;
		if (chk > 0){
			taskResult = "success";
			message = URLEncoder.encode("댓글이 정상적으로 등록되었습니다.", "UTF-8");
		}else{
			taskResult = "warning";
			message = URLEncoder.encode("댓글 등록에 실패했습니다", "UTF-8");
		}
		
		return "redirect:/user/riskboard/riskboardView.do?taskResult=" + taskResult + "&message=" + message + "&risk_no=" + riskcommentInfo.getRisk_no() + "&mem_id=" + riskcommentInfo.getMem_id() + "&project_no=" + project_no;
	}
	
	@RequestMapping("updateriskComment")
	public String updateriskComment(String comment_seq,
									String risk_no,
									String mem_id,
									String comment_content,
									String project_no) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("comment_seq", comment_seq);
		params.put("comment_content", comment_content);
		params.put("project_no", project_no);
		
		int chk = riskboardservice.updateComment(params);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("댓글이 정상적으로 수정되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("댓글 수정에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/riskboard/riskboardView.do?taskResult=" + taskResult + "&message=" + message + "&risk_no=" + risk_no + "&mem_id=" + mem_id + "&project_no=" + project_no;
	}
	
	@RequestMapping("deleteriskComment")
	public String deleteriskComment(String comment_seq,
									String risk_no,
									String mem_id,
									String project_no) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("comment_seq", comment_seq);
		params.put("project_no", project_no);
		
		int chk = riskboardservice.deleteComment(params);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("댓글이 정상적으로 삭제되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("댓글 삭제에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/riskboard/riskboardView.do?taskResult" + taskResult + "&message" + message + "&risk_no=" + risk_no + "&mem_id=" + mem_id + "&project_no=" + project_no ;
		
	}
	
	@RequestMapping("updateErrorStatus")
	public String updateErrorStatus (HttpServletRequest request,
			  						 HttpServletResponse response,
									 RiskboardVO riskboardInfo,
									 String risk_errorstatus,
									 String project_no,
									 String mem_id,
									 String timeline_content,
									 String timeline_category,
									 String timeline_tag,
									 String timeline_title) throws Exception{
		
		
		int chk = riskboardservice.updateErrorStatus(riskboardInfo);
		
		String taskResult = null;
		String message = null;
		if (chk > 0){
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 수정되었습니다", "UTF-8");
			
		}else{
			taskResult = "warning";
			message = URLEncoder.encode("게시글 수정에 실패했습니다", "UTF-8");
		}
		
		Map<String, String> no = new HashMap<String, String>();
		no.put("project_no", project_no);
		
		Map<String, String> projectInfo = projectService.selectProjectInfo(no);
		
		List<String> list = new ArrayList<String>();
		if (projectInfo.get("PL") != null) {
			list.add(String.valueOf(projectInfo.get("PL")));
		}
		if (projectInfo.get("DA") != null) {
			list.add(String.valueOf(projectInfo.get("DA")));
		}
		if (projectInfo.get("TA") != null) {
			list.add(String.valueOf(projectInfo.get("TA")));
		}
		if (projectInfo.get("UA") != null) {
			list.add(String.valueOf(projectInfo.get("UA")));
		}
		if (projectInfo.get("AA") != null) {
			list.add(String.valueOf(projectInfo.get("AA")));
		}
		
		
		
		for (int i = 0; i < list.size(); i++) {
			
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", list.get(i));
		params.put("project_no", project_no);
		params.put("timeline_title", "위험요소 해결" );
		params.put("timeline_content", "위험요소가 해결되었습니다");
		params.put("timeline_tag", "RISK");
		params.put("timeline_category", "Y");
		
		timelineService.insertTimeline(params);
		}
		return "redirect:/user/riskboard/riskboardList.do?taskResult=" + taskResult + "&message=" + message + "&project_no=" + project_no;
		
	}
		
	
	
	

	
}