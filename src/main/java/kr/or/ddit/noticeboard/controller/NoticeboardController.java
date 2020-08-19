package kr.or.ddit.noticeboard.controller;

import java.util.List;
import java.util.Map;

import kr.or.ddit.noticeboard.service.INoticeboardService;
import kr.or.ddit.vo.NoticeboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/noticeboard")
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
									

}
