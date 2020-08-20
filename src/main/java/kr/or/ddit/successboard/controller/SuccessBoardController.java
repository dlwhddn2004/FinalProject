package kr.or.ddit.successboard.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.successboard.service.ISuccessBoardService;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuccessBoardVO;
import kr.or.ddit.vo.newsboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/successboard/")
public class SuccessBoardController {
	
	@Autowired
	private ISuccessBoardService service;

	@RequestMapping("successboardList")
	public ModelAndView successList(HttpServletRequest request,
									ModelAndView modelAndView) throws Exception {
		List<SuccessBoardVO> successboardList = null;		
		successboardList = service.successboardList();
		
		// breadcrumb
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
		modelAndView.addObject("breadcrumb_first", "성공 사례 게시판");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/successboard/successboardList.do");
		
		modelAndView.addObject("successboardList", successboardList);
		modelAndView.setViewName("user/successboard/successboardList");
		
		return modelAndView;
	}
	
	@RequestMapping("successboardForm")
	public ModelAndView successboardForm(HttpServletRequest request,
										 ModelAndView modelAndView,
										 String mem_id) throws Exception {
		modelAndView.addObject("breadcrumb_title", "뉴스 센터");
		modelAndView.addObject("breadcrumb_first", "성공 사례 게시판");
		modelAndView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/successboard/successboardList.do");
		modelAndView.addObject("breadcrumb_second", "성공 사례 게시글 등록");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		List<JoinVO> tempList = service.attendProjectList(params);
		
		List<JoinVO> attendProjectList = new ArrayList<JoinVO>();
		for (int i = 0; i < tempList.size(); i++) {
			if (tempList.get(i).getProject_endstatus().equals("N")) {
				attendProjectList.add(tempList.get(i));
			}
		}
		modelAndView.addObject("attendProjectList", attendProjectList);
		
		modelAndView.setViewName("user/successboard/successboardForm");
		
		return modelAndView;
	}
	
	@RequestMapping("successboardView")
	public ModelAndView successboardView(ModelAndView modelAndView,
								         String success_no) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("success_no", success_no);
		
		SuccessBoardVO successboardInfo = service.selectSuccessBoardInfo(params);
		
		params.put("project_no", successboardInfo.getProject_no());
		ProjectVO projectInfo = service.selectProjectInfo(params);
		
		modelAndView.addObject("successboardInfo", successboardInfo);
		modelAndView.addObject("projectInfo", projectInfo);
		modelAndView.setViewName("user/successboard/successboardView");
		
		return modelAndView;
	}
	
	@RequestMapping("insertSuccessBoard")
	public String insertSuccessBoard(HttpServletRequest request,
								     HttpServletResponse response,
								     String success_title,
								     String success_content,
								     String project_no,
								     String mem_id) throws Exception {
		
		
		SuccessBoardVO successboardInfo = new SuccessBoardVO();
		successboardInfo.setProject_no(project_no);
		successboardInfo.setMem_id(mem_id);
		successboardInfo.setSuccess_title(success_title);
		successboardInfo.setSuccess_content(success_content);
		
		service.insertSuccessBoard(successboardInfo);
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = URLEncoder.encode("게시글이 정상적으로 등록되었습니다.", "UTF-8");
		
		return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
	
	@RequestMapping("modifySuccessBoard")
	public String modifySuccessBoard(SuccessBoardVO successboardInfo) throws Exception {
		int chk = service.modifySuccessBoard(successboardInfo);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 수정되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("게시글 수정에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
	
	@RequestMapping("deleteSuccessBoard")
	public String deleteSuccessBoard(String success_no) throws Exception {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("success_no", success_no);
		int chk = service.deleteSuccessBoard(params);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 삭제되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("게시글 삭제에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/successboard/successboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
}
