package kr.or.ddit.projectApply.controller;

import java.io.Reader;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.interview.service.IInterviewService;
import kr.or.ddit.interviewee.service.IIntervieweeService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.profile_file.service.IProfileFileService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.projectApply.service.IProjectApplyService;
import kr.or.ddit.successboard.service.ISuccessBoardService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardCommentVO;
import kr.or.ddit.vo.SuccessBoardVO;
import kr.or.ddit.vo.newsboardVO;

import org.openxmlformats.schemas.spreadsheetml.x2006.main.STRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lowagie.text.pdf.AcroFields.Item;

@Controller
@RequestMapping("/user/projectApply/")
public class ProjectApplyController {
	@Autowired
	private IProjectApplyService projectApplyService;
	@Autowired
	private IProjectService projectService;
	
	@RequestMapping("insertProjectApplyInformation")
	public String insertProjectApply(String project_no,
										   String mem_id,
										   String interviewee_gender,
										   String interviewee_engname,
										   String interviewee_hopesal,
										   String interviewee_presal,
										   String interviewee_hoperole,
										   String interviewee_region,
										   String interviewee_bloodtype,
										   String interviewee_hobby,
										   String interviewee_height,
										   String interviewee_bodyshape,
										   String interviewee_vision,
										   String interviewee_specialbodyproblem,
										   String interviewee_highschool,
										   String interviewee_university,
										   String interviewee_graduateuniversity,
										   String interviewee_foreignexperience,
										   String interviewee_pricerecord,
										   String interviewee_educationrecord,
										   String interviewee_schoolrecord,
										   String interviewee_volunteer,
										   String interviewee_country) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("mem_id", mem_id);
		params.put("apply_info_gender", interviewee_gender);
		params.put("apply_info_engname", interviewee_engname);
		params.put("apply_info_hopesal", interviewee_hopesal);
		params.put("apply_info_presal", interviewee_presal);
		params.put("apply_info_hoperole", interviewee_hoperole);
		params.put("apply_info_region", interviewee_region);
		params.put("apply_info_bloodtype", interviewee_bloodtype);
		params.put("apply_info_hobby", interviewee_hobby);
		params.put("apply_info_height", interviewee_height);
		params.put("apply_info_bodyshape", interviewee_bodyshape);
		params.put("apply_info_vision", interviewee_vision);
		params.put("apply_info_specialbodyproblem", interviewee_specialbodyproblem);
		params.put("apply_info_highschool", interviewee_highschool);
		params.put("apply_info_university", interviewee_university);
		params.put("apply_info_graduateuniversity", interviewee_graduateuniversity);
		params.put("apply_info_foreignexperience", interviewee_foreignexperience);
		params.put("apply_info_pricerecord", interviewee_pricerecord);
		params.put("apply_info_educationrecord", interviewee_educationrecord);
		params.put("apply_info_schoolrecord", interviewee_schoolrecord);
		params.put("apply_info_volunteer", interviewee_volunteer);
		params.put("apply_info_country", interviewee_country);
		
		int chk = projectApplyService.insertProjectApplyInformation(params);
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("프로젝트가 신청되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("프로젝트를 신청하는 과정에서 에러 발생", "UTF-8");
		}
		
		return "redirect:/user/projectsearch/projectsearch.do?taskResult=" + taskResult + "&message=" + message;
	}
	
	@RequestMapping("selectProjectApplyInfo")
	@ResponseBody
	public Map<String, String> selectProjectApplyInfo(String mem_id,
													  String project_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("project_no", project_no);
		
		return projectApplyService.selectProjectApplyInfo(params);
	}
	
	@RequestMapping("chkDuplicate")
	@ResponseBody
	public Map<String, String> chkDuplicate(String project_no,
								String mem_id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("project_no", project_no);
		params.put("mem_id", mem_id);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		
		Map<String, String> projectInfo = projectService.selectOnlyProjectInfo(project_no);
		resultMap.put("project_hirestatus", String.valueOf(projectInfo.get("PROJECT_HIRESTATUS")));
		
		Map<String, String> applyInfo = projectApplyService.chkDuplicate(params);
		if (applyInfo != null) {
			resultMap.put("result", "Y");
		} else {
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
}
