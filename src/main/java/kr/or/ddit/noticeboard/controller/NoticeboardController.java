package kr.or.ddit.noticeboard.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.noticeboard.service.INoticeboardService;
import kr.or.ddit.vo.NoticeboardVO;

import org.bouncycastle.asn1.ocsp.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/noticeboard")
// 공지사항 목록 조회
public class NoticeboardController {
	@Autowired
	private INoticeboardService noticeboardService;
	
	@RequestMapping("noticeboardList")
	public ModelAndView freeboardList(Map<String, String> params,
									 ModelAndView modelView,
									 HttpServletRequest request) throws Exception{
	List<NoticeboardVO> noticeboardList = this.noticeboardService.noticeboardList(params);
	
	modelView.addObject("breadcrumb_title", "뉴스센터");
	modelView.addObject("breadcrumb_first", "공지사항 게시판");
	modelView.addObject("breadcrumb_first_url", request.getContextPath() + "/user/noticeboard/noticeboardList.do");
	
	modelView.addObject("noticeboardList",noticeboardList);
	modelView.setViewName("user/noticeboard/noticeboardList");
	
	return modelView;
	
	}
	
	// 공지사항 상세 조회
	@RequestMapping("noticeboardView")
	@ModelAttribute("noticeboardInfo")
	public NoticeboardVO noticeView(String notice_no, String r,
									Map<String, String> params,
									NoticeboardVO noticeboardInfo) throws Exception{
		
		params.put("notice_no", notice_no);
		noticeboardInfo = this.noticeboardService.noticeboardInfo(params);
		
		return noticeboardInfo;
	}
	// 공지사항 등록
	@RequestMapping("insertNoticeboardInfo")
	public String insertNoticeboard(NoticeboardVO noticeboardInfo
									)throws Exception{
		this.noticeboardService.insertNoticeboard(noticeboardInfo);
		return "redirect:/user/noticeboard/noticeboardList.do";
	}
	@RequestMapping("noticeboardForm")
	public void noticeboardForm(){}
	
	@RequestMapping("updateNoticeboardInfo")
	public String updateNoticeboard(NoticeboardVO noticeboardInfo) throws Exception{
		int chk = noticeboardService.updateNoticeboard(noticeboardInfo);
		
		String taskResult = null;
		String message = null;
		if (chk > 0){
			taskResult = "success";
			message = URLEncoder.encode("게시글이 정상적으로 수정되었습니다", "UTF-8");
		}else{
			taskResult = "warning";
			message = URLEncoder.encode("게시글 수정에 실패했습니다", "UTF-8");
		}
		
		return "redirect:/user/noticeboard/noticeboardList.do?taskResult=" + taskResult + "&message=" + message;
	}
	
	
	
	
	
									

}
