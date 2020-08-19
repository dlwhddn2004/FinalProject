package kr.or.ddit.freeboard.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.fileitem.service.IFileItemService;
import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FreeboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user/freeboard/")
public class FreeboardController {
	@Autowired
	private CryptoGenerator cryptoGen;
	@Autowired
	private IFreeboardService freeboardService;

	@Autowired
	private RolePaginationUtil rolePagination;
	// http://localhost/user/freeboard/freeboardList.do

	@Autowired
	private IFileItemService fileItemService;

	@RequestMapping("freeboardList")
	public ModelAndView freeboardList(Map<String, String> params,
			String search_keycode, String search_keyword,
			HttpServletRequest request, ModelAndView modelView,
			HttpSession session, String currentPage,
			// @RequestHeader("취득하려는 키값")
			@RequestHeader("User-Agent") String agent,
			@RequestHeader("accept-Language") String language,
			// @CookieValue("전송되려는쿠키값")
			@CookieValue("JSESSIONID") String sessionID) throws Exception {
		
		Map<String, String> publicKeyMap = this.cryptoGen.generatePairKey(session);
		// String currentPage = request.getParameter("currentPage");

		if (currentPage == null) {
			currentPage = "1";
		}

		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);

		String totalCount = this.freeboardService.totalCount(params);

		this.rolePagination.RolePaginationUtilMethod(request,
				Integer.parseInt(currentPage), Integer.parseInt(totalCount));

		params.put("startCount",
				String.valueOf(this.rolePagination.getStartCount()));
		params.put("endCount",
				String.valueOf(this.rolePagination.getEndCount()));

		List<FreeboardVO> freeboardList = this.freeboardService
				.freeboardList(params);

		modelView.addObject("freeboardList", freeboardList);
		modelView.addObject("publicKeyMap", publicKeyMap);
		modelView.addObject("Pagination", this.rolePagination.getPagingHtmls());
		modelView.setViewName("user/freeboard/freeboardList");

		return modelView;
	}

	@RequestMapping("freeboardForm")
	public void freeboardForm() {
	}

	// 파일처리도 하자 RequestParam은 반드시 파일이 입력되어야하는데 그러면 없으면 에러난다... ;
	@RequestMapping("insertFreeboard")
	public String insertFreeboardInfo(FreeboardVO freeboardInfo,
			@RequestParam("files") MultipartFile[] items) throws Exception {
		this.freeboardService.insertFreeboard(freeboardInfo, items);
		String message = URLEncoder.encode("글작성완료.", "UTF-8");
		return "redirect:/user/freeboard/freeboardList.do?message=" + message;
	}

	@RequestMapping("freeboardView")
	@ModelAttribute("freeboardInfo")
	public FreeboardVO freeboardView(String bo_no, String r,
			Map<String, String> params, 
			FreeboardVO freeboardInfo) throws Exception {
		
		params.put("bo_no", bo_no);
		 freeboardInfo = this.freeboardService.freeboardInfo(params);
		
		this.freeboardService.hitUp(params);
		
//		modelView.addObject("freeboardInfo", freeboardInfo);
//		modelView.addObject("r", r);
//		modelView.setViewName("user/freeboard/freeboardView");
		return freeboardInfo;
	}

	@RequestMapping("updateFreeboard")
	public String updateFreeboard(FreeboardVO freeboardInfo) throws Exception {
		int cnt = 0;
		cnt = this.freeboardService.updateFreeboard(freeboardInfo);
		String message = null;
		if (cnt > 0) {
			message = URLEncoder.encode("글수정완료", "UTF-8");
		} else {
			message = URLEncoder.encode("글수정실패", "UTF-8");
		}
		return "redirect:/user/freeboard/freeboardList.do?message=" + message;
	}

	@RequestMapping("deleteFreeboard/{board_no}")
	public String deleteFreeboard(@PathVariable("board_no") String bo_no,
			Map<String, String> params) throws Exception {
		params.put("bo_no", bo_no);
		int cnt = 0;
		cnt = this.freeboardService.deleteFreeboard(params);
		String message = null;
		if (cnt > 0) {
			message = URLEncoder.encode("삭제완료", "UTF-8");
		} else {
			message = URLEncoder.encode("삭제실패", "UTF-8");
		}
		return "redirect:/user/freeboard/freeboardList.do?message=" + message;
	}

	@RequestMapping("freeboardReplyForm")
	public ModelAndView freeboardReplyForm(FreeboardVO rfFreeboardInfo,
			ModelAndView modelAndView) throws Exception {
		modelAndView.addObject("rfFreeboardInfo", rfFreeboardInfo);
		modelAndView.setViewName("user/freeboard/freeboardReplyForm");
		return modelAndView;

	}

	@RequestMapping("insertFreeboardReply")
	public String insertFreeboardReply(FreeboardVO repalyFreeboardInfo)
			throws Exception {
		String cnt = null;
		cnt = this.freeboardService.insertFreeboardReply(repalyFreeboardInfo);
		this.freeboardService.insertFreeboardReply(repalyFreeboardInfo);
		String message = null;
		// if(Integer.parseInt(cnt)>0){
		// message = URLEncoder.encode("답글완료","UTF-8");
		// }else{
		// message = URLEncoder.encode("답글실패","UTF-8");
		// }
		//
		// return "redirect:/user/freeboard/freeboardList.do?message="+message;
		return "redirect:/user/freeboard/freeboardList.do";
	}

	@RequestMapping("fileDownload")
	public ModelAndView fileDownload(String file_seq,
			Map<String, String> params, ModelAndView modelAndView)
			throws Exception {
		params.put("file_seq", file_seq);

		FileItemVO fileItemInfo = this.fileItemService.fileitemInfo(params);

		modelAndView.addObject("fileitemInfo", fileItemInfo);
		modelAndView.setViewName("fileDownloadView");
		return modelAndView;
	}
}
