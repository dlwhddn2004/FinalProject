package kr.or.ddit.career.controller;

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

import kr.or.ddit.career.service.ICareerService;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/career/")
public class CareerController {
	@Autowired
	private ICareerService careerService;
	
	@RequestMapping("selectCareer")
	@ResponseBody
	public List<Map<String, String>> selectCareer(String mem_id) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		
		return careerService.selectCareer(params);
	}
	
	@RequestMapping("insertCareer")
	@ResponseBody
	public Map<String, String> insertCareer(String mypage_no,
										    String career_companyname,
										    String career_department,
										    String career_class,
										    String career_startdate,
										    String career_enddate) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mypage_no", mypage_no);
		params.put("career_companyname", career_companyname);
		params.put("career_department", career_department);
		params.put("career_class", career_class);
		
		SimpleDateFormat wildFormat = new SimpleDateFormat("MM/dd/YYYY");
		SimpleDateFormat wantFormat = new SimpleDateFormat("YYYY-MM-dd");
		
		Date tempDate = null;
		tempDate = wildFormat.parse(career_startdate);
		career_startdate = wantFormat.format(tempDate);
		
		tempDate = wildFormat.parse(career_enddate);
		career_enddate = wantFormat.format(tempDate);
		
		params.put("career_startdate", career_startdate);
		params.put("career_enddate", career_enddate);
		
		int chk = careerService.insertCareer(params);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		if (chk > 0) {
			resultMap.put("result", "Y");
		} else {
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
	
	@RequestMapping("deleteCareer")
	@ResponseBody
	public Map<String, String> deleteCareer(String career_seq) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("career_seq", career_seq);
		
		int chk = careerService.deleteCareer(params);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		if (chk > 0) {
			resultMap.put("result", "Y");
		} else {
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
}
