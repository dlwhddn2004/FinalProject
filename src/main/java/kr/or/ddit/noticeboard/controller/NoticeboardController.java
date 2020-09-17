package kr.or.ddit.noticeboard.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.noticeboard.service.INoticeboardService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.NoticeboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lowagie.text.pdf.PRAcroForm;

@Controller
@RequestMapping("/user/noticeboard/")
public class NoticeboardController {
	
	@Autowired
	private INoticeboardService noticeboardService;
	
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping("noticeboardList")
	public ModelAndView noticeList(HttpServletRequest request,
								  ModelAndView modelView,
								  String mem_id)throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		
		Map<String, String> memberInfo = memberService.selectMemberInfo(params);
		
		List<NoticeboardVO> noticeboardList = null;
		noticeboardList = noticeboardService.noticeboardList();
		
		modelView.addObject("breadcrumb_title", "뉴스 센터");
		modelView.addObject("breadcrumb_first", "공지사항 게시판");
		modelView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/noticeboard/noticeboardList.do");
		
		modelView.addObject("memberInfo", memberInfo);
		modelView.addObject("noticeboardList", noticeboardList);
		modelView.setViewName("user/noticeboard/noticeboardList");
		
		return modelView;
	}
	
	@RequestMapping("noticeboardForm")
	public ModelAndView noticeboardForm(HttpServletRequest request,
										ModelAndView modelView,
										String mem_id) throws Exception{
		
		modelView.addObject("breadcrumb_title", "뉴스 센터");
		modelView.addObject("breadcrumb_first", "공지사항 게시판");
		modelView.addObject("breadcrumb_first_url", request.getContextPath()+ "/user/noticeboard/noticeboardList.do");
		modelView.addObject("breadcrumb_second", "공지사항 게시글 등록");
		
		modelView.setViewName("user/noticeboard/noticeboardForm");
		
		
		return modelView;
	}
	
	@RequestMapping("noticeboardView")
	public ModelAndView noticeboardView(ModelAndView modelView,
										String notice_no,
										String mem_id,
										HttpServletRequest request) throws Exception{
		modelView.addObject("breadcrumb_title", "뉴스 센터");
		modelView.addObject("breadcrumb_first", "공지사항 게시판");
		modelView.addObject("breadcrumb_first_url", request.getContextPath()+"/user/noticeboard/noticeboardList.do");
		modelView.addObject("breadcrumb_second", "공지사항 게시판 보기");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("notice_no", notice_no);
		params.put("mem_id", mem_id);
		
		NoticeboardVO noticeboardInfo = noticeboardService.noticeboardInfo(params);
		noticeboardService.updatehit(params);
		
		modelView.addObject("noticeboardInfo", noticeboardInfo);
		modelView.setViewName("user/noticeboard/noticeboardView");
		
		return modelView;
	}
	
	@RequestMapping("insertNoticeboard")
	public String insertNoticeboard(HttpServletRequest request,
									HttpServletResponse response,
									String notice_title,
									String notice_content,
									String mem_id) throws Exception{
		
		NoticeboardVO noticeboardInfo = new NoticeboardVO();
		noticeboardInfo.setNotice_title(notice_title);
		noticeboardInfo.setMem_id(mem_id);
		noticeboardInfo.setNotice_content(notice_content);
		
		noticeboardService.insertNoticeboard(noticeboardInfo);
		
		String taskResult = null;
		String message = null;
		taskResult = "success";
		message = URLEncoder.encode("게시글이 정상적으로 등록되었습니다.", "UTF-8");
		
		return "redirect:/user/noticeboard/noticeboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
	
	@RequestMapping("updateNoticeboard")
	public String updateNoticeboard(NoticeboardVO noticeboardInfo) throws Exception{
		int chk = noticeboardService.updateNoticeboard(noticeboardInfo);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 수정되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("게시글 수정에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/noticeboard/noticeboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
	
	@RequestMapping("deleteNoticeboard")
	public String deleteNoticeboard(String notice_no) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("notice_no", notice_no);
		int chk = noticeboardService.deleteNoticeboard(params);
		
		String taskResult = null;
		String message = null;
		if (chk > 0) {
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 삭제되었습니다.", "UTF-8");
		} else {
			taskResult = "warning";
			message = URLEncoder.encode("게시글 삭제에 실패했습니다.", "UTF-8");
		}
		
		return "redirect:/user/noticeboard/noticeboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
}