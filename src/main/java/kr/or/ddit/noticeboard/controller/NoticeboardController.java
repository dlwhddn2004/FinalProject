package kr.or.ddit.noticeboard.controller;

import java.util.List;
import java.util.Map;

import kr.or.ddit.noticeboard.service.INoticeboardService;
import kr.or.ddit.vo.NoticeboardVO;

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
									 ModelAndView modelView) throws Exception{
	List<NoticeboardVO> noticeboardList = this.noticeboardService.noticeboardList(params);
	
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
	
	
									

}
