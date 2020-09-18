package kr.or.ddit.reportboard.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.projectsupport.service.IProjectSupportService;
import kr.or.ddit.reportboard.service.IReportBoardService;
import kr.or.ddit.timeline.service.ITimelineService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProfileFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lowagie.text.pdf.PRAcroForm;
import com.sun.org.apache.regexp.internal.REProgram;

@Controller
@RequestMapping("/user/reportboard/")
public class ReportBoardController {
	@Autowired
	private IReportBoardService reportBoardService;
	@Autowired
	private IProjectService projectService;
	@Autowired
	private IProfileFileService profileFileService;
	@Autowired
	private IProjectSupportService projectSupportService;
	@Autowired
	private IMemberService memberService;
	@Autowired
	private ITimelineService timelineService;
	
	@RequestMapping("reportboardList")
	public ModelAndView reportboardList(HttpServletRequest request,
										ModelAndView modelAndView,
										String project_no,
										String mem_id
											)throws Exception{
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트 상세");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/projectView.do?project_no=" + project_no);
		modelAndView.addObject("breadcrumb_second", "보고서 게시판");
		modelAndView.addObject("breadcrumb_second_url", request.getContextPath() + "/reportboard/reportboardList.do?project_no=" +project_no );
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		
		List<Map<String, String>> reportboardList = null;
		reportboardList = reportBoardService.reportboardList(params);
		
		Map<String, String> projectInfo = projectService.selectProjectInfo(params);
				
		modelAndView.addObject("reportboardList", reportboardList);
		modelAndView.addObject("projectInfo", projectInfo);
		
		
		modelAndView.setViewName("user/reportboard/reportboardList");
		
		return modelAndView;
	}
	
	@RequestMapping("reportboardView")
	public ModelAndView reportboardView(HttpServletRequest request,
										ModelAndView modelAndView,
										String report_no,
										String mem_id,
										String project_no
											)throws Exception{
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트 상세");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/projectView.do?project_no=" + project_no);
		modelAndView.addObject("breadcrumb_second", "보고서 게시판");
		modelAndView.addObject("breadcrumb_second_url", request.getContextPath() + "/reportboard/reportboardList.do?project_no=" +project_no );
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("report_no", report_no);
		params.put("project_no", project_no);
		params.put("mem_id", mem_id);
		
		Map<String, String> reportInfo = reportBoardService.selectReportboard(params);
		List<Map<String, String>> commentList = reportBoardService.reportCommentList(params);
		
		ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(params);
		
		
		modelAndView.addObject("reportInfo", reportInfo);
		modelAndView.addObject("commentList", commentList);
		modelAndView.addObject("profileInfo", profileInfo);
		
		modelAndView.setViewName("user/reportboard/reportboardView");
		
		return modelAndView;
		
	}
	
	@RequestMapping("reportboardForm")
	public ModelAndView reportboardForm(HttpServletRequest request,
										ModelAndView modelAndView,
										String project_no
										) throws Exception{
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "프로젝트");
		modelAndView.addObject("breadcrumb_first", "프로젝트 상세");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/project/projectView.do?project_no=" + project_no);
		modelAndView.addObject("breadcrumb_second", "보고서 게시판");
		modelAndView.addObject("breadcrumb_second_url", request.getContextPath() + "/reportboard/reportboardList.do?project_no=" +project_no );
		
		modelAndView.addObject("project_no", project_no);
		modelAndView.setViewName("user/reportboard/reportboardForm");
		
		return modelAndView;
	}
	
	@RequestMapping("insertReportboard")
	public ModelAndView insertReportboard ( HttpServletRequest request,
											ModelAndView modelAndView,
											String mem_id,
											String project_no,
											String report_title,
											String report_content
											) throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("project_no", project_no);
		params.put("report_title", report_title);
		params.put("report_content", report_content);
		
		String report_no = reportBoardService.insertReportboard(params);
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = "게시글 등록에 성공하였습니다!";
		
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("report_no", report_no);
		modelAndView.addObject("taskResult", taskResult);
		modelAndView.addObject("message", message);
		
		
		List<Map<String, String>> reportboardList = null;
		reportboardList = reportBoardService.reportboardList(params);
		
		Map<String, String> projectInfo = projectService.selectProjectInfo(params);

		// 타임라인에 등록!
		Date nowDate = new Date();
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		Map<String, String> timelinePL = new HashMap<String, String>();
		
		timelinePL.put("project_no", project_no);
		timelinePL.put("mem_id", mem_id);
		timelinePL.put("timeline_title", "보고서 등록");
		timelinePL.put("timeline_tag", "NEW,REPORT");
		timelinePL.put("timeline_content",  format.format(nowDate) + "에 보고서가 등록되었습니다.");
		timelinePL.put("timeline_category",  "Y");
		timelineService.insertTimeline(timelinePL);
		
		Map<String, String> timelinePartner = new HashMap<String, String>();
		timelinePartner.put("project_no", project_no);
		String partnerID = String.valueOf(projectInfo.get("MEM_ID"));
		timelinePartner.put("mem_id", partnerID);
		timelinePartner.put("timeline_title", "보고서 등록");
		timelinePartner.put("timeline_tag", "NEW,REPORT");
		timelinePartner.put("timeline_content",  format.format(nowDate) + "에 " + mem_id +"님이 보고서를 등록했습니다.");
		timelinePartner.put("timeline_category",  "Y");
		timelineService.insertTimeline(timelinePartner);
		
		modelAndView.addObject("reportboardList", reportboardList);
		modelAndView.addObject("projectInfo", projectInfo);
		
		modelAndView.setViewName("user/reportboard/reportboardList");
		
		return modelAndView;
	}
	
	@RequestMapping("updateReportBoard")
	public ModelAndView updateReportBoard(HttpServletRequest request,
											ModelAndView modelAndView,
											String report_no,
											String project_no,
											String report_title,
											String report_content
											)throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("report_no", report_no);
		params.put("report_title", report_title);
		params.put("report_content", report_content);

		int chk = reportBoardService.updateReportboard(params);
		
		List<Map<String, String>> reportboardList = null;
		reportboardList = reportBoardService.reportboardList(params);
		
		Map<String, String> projectInfo = projectService.selectProjectInfo(params);
		
		modelAndView.addObject("report_no", report_no);
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("reportboardList", reportboardList);
		modelAndView.addObject("projectInfo", projectInfo);
		
		modelAndView.setViewName("user/reportboard/reportboardList");
		return modelAndView;
	}
	
	@RequestMapping("deleteReportboard")
	public ModelAndView deleteReportboard(HttpServletRequest request,
											ModelAndView modelAndView,
											String project_no,
											String report_no
											) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("report_no", report_no);
		
		int chk = reportBoardService.deleteReportboard(params);
		List<Map<String, String>> reportboardList = null;
		reportboardList = reportBoardService.reportboardList(params);
		
		Map<String, String> projectInfo = projectService.selectProjectInfo(params);
		
		modelAndView.addObject("report_no", report_no);
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("reportboardList", reportboardList);
		modelAndView.addObject("projectInfo", projectInfo);
		
		modelAndView.setViewName("user/reportboard/reportboardList");
		
		return modelAndView;
	}
	
	@RequestMapping("updateReportStatus")
	public ModelAndView updateReportStatus(String project_no,
											String report_no,
											String report_status,
											String mem_id,
											String report_title,
											ModelAndView modelAndView) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("report_no", report_no);
		params.put("report_status", report_status);
		params.put("mem_id", mem_id);
		params.put("report_title", report_title);
		
		MemberVO memberInfo = memberService.memberInfo(params);
		String mail = memberInfo.getMem_mail();
		
		if(report_status.equals("N")){
			projectSupportService.sendMail(mail, "CONNECTOR 보고서 결과.", mem_id + "님 " + report_title +" 보고서가 반려되었습니다.");						
		}else if(report_status.equals("Y")){
			projectSupportService.sendMail(mail, "CONNECTOR 보고서 결과.", mem_id + "님 " + report_title +" 보고서가 결재되었습니다.");			
		}
		
		
		int chk = reportBoardService.updateReportStatus(params);
		List<Map<String, String>> reportboardList = null;
		reportboardList = reportBoardService.reportboardList(params);
		
		Map<String, String> projectInfo = projectService.selectProjectInfo(params);
		
		modelAndView.addObject("report_no", report_no);
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("reportboardList", reportboardList);
		modelAndView.addObject("projectInfo", projectInfo);
		
		modelAndView.setViewName("user/reportboard/reportboardList");
		
		return modelAndView;
	}
	
	@RequestMapping("insertReportComment")
	public ModelAndView insertReportComment(String project_no,
											String mem_id,
											String report_no,
											String report_comment_content,
											ModelAndView modelAndView) throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("report_no", report_no);
		params.put("mem_id", mem_id);
		params.put("report_comment_content", report_comment_content);
		
		int chk = reportBoardService.insertReportComment(params);
		String taskResult = null;
		String message = null;
		if(chk > 0) {
			taskResult = "success";
			message = "댓글이 정상적으로 등록되었습니다.";
		}else{
			taskResult = "warning";
			message = "댓글 등록에 실패했습니다.";
		}
		Map<String, String> reportInfo = reportBoardService.selectReportboard(params);
		List<Map<String, String>> commentList = reportBoardService.reportCommentList(params);
		
		ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(params);
		
		modelAndView.addObject("taskResult", taskResult);
		modelAndView.addObject("message", message);
		modelAndView.addObject("reportInfo", reportInfo);
		modelAndView.addObject("commentList", commentList);
		modelAndView.addObject("profileInfo", profileInfo);
		
		modelAndView.setViewName("user/reportboard/reportboardView");
		
		return modelAndView;
	}
	
	@RequestMapping("deleteReportComment")
	public ModelAndView deleteReportComment(String project_no,
											String mem_id,
											String report_no,
											String report_seq,
											ModelAndView modelAndView) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("mem_id", mem_id);
		params.put("report_no", report_no);
		params.put("report_seq", report_seq);
		
		int chk = reportBoardService.deleteReportComment(params);
		Map<String, String> reportInfo = reportBoardService.selectReportboard(params);
		List<Map<String, String>> commentList = reportBoardService.reportCommentList(params);
		
		ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(params);
		
		modelAndView.addObject("reportInfo", reportInfo);
		modelAndView.addObject("commentList", commentList);
		modelAndView.addObject("profileInfo", profileInfo);
		
		modelAndView.setViewName("user/reportboard/reportboardView");
		
		return modelAndView;
	}
	@RequestMapping("updateReportComment")
	public ModelAndView updateReportComment(String project_no,
											String mem_id,
											String report_no,
											String report_seq,
											String report_comment_content,
											ModelAndView modelAndView) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("mem_id", mem_id);
		params.put("report_no", report_no);
		params.put("report_seq", report_seq);
		params.put("report_comment_content", report_comment_content);
		
		int chk = reportBoardService.updateReportComment(params);
		Map<String, String> reportInfo = reportBoardService.selectReportboard(params);
		List<Map<String, String>> commentList = reportBoardService.reportCommentList(params);
		
		ProfileFileVO profileInfo = profileFileService.selectProfileFileInfo(params);
		
		modelAndView.addObject("reportInfo", reportInfo);
		modelAndView.addObject("commentList", commentList);
		modelAndView.addObject("profileInfo", profileInfo);
		
		modelAndView.setViewName("user/reportboard/reportboardView");
		
		return modelAndView;
	}
}
