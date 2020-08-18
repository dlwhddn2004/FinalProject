package kr.or.ddit.utiles;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.FileItemVO;

// freeboard컨트롤러 다운로드 매서드에 model의 setName 이름 맞춰야한다.
// extends AbstractView 해줘야함.
@Component("fileDownloadView")
public class FileDownloadViewClazz extends AbstractView{
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
										  HttpServletRequest request,
										  HttpServletResponse response) throws Exception {
		//컨트롤러 클래스 ModelAndView.addObject("fileitemInfo", fileItemInfo)이 Map으로 주입
		FileItemVO fileitemInfo =  (FileItemVO) model.get("fileitemInfo");
																//실제 저장된 파일에 접근해야하니까~
		File downloadFile = new File(GlobalConstant.FILE_PATH, fileitemInfo.getFile_save_name());
		
		if (downloadFile.exists()) {
			// 다운로드 창에 출력할 진짜 이름(유저가 입력한 이름, file_name)
			String realName = URLEncoder.encode(fileitemInfo.getFile_name(), "utf-8");
			
			response.setHeader("Content-Disposition", "attachment;fileName=" + realName);
			response.setContentType("application/octet-streem");
			response.setContentLength((int)downloadFile.length());
			
			byte[] buffer = new byte[(int)downloadFile.length()];
			
			BufferedInputStream inputStream = new BufferedInputStream(
													new FileInputStream(
															downloadFile));
			
			BufferedOutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			
			int readCnt = 0;
			while((readCnt = inputStream.read(buffer)) != -1) {
								//buffer에 0번째 인덱스부터 readCnt만큼
				outputStream.write(buffer,0,readCnt);
			}
			inputStream.close();
			outputStream.close();
		}	
		
	}
	

}
