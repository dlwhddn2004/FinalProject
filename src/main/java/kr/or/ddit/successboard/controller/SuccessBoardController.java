package kr.or.ddit.successboard.controller;

import java.util.List;

import kr.or.ddit.successboard.service.ISuccessBoardService;
import kr.or.ddit.vo.SuccessBoardVO;

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
	public ModelAndView successList(ModelAndView modelAndView) {
		List<SuccessBoardVO> successboardList = null;		
		try {
			successboardList = service.successboardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		modelAndView.addObject("successboardList", successboardList);
		modelAndView.setViewName("user/successboard/successboardList");
		
		return modelAndView;
	}
	
}
