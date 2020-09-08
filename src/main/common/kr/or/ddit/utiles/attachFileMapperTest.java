package kr.or.ddit.utiles;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.FileItemVO;

@Component
public class attachFileMapperTest {
	public static List<FileItemVO> mapper(MultipartFile[] items) {
		List<FileItemVO> fileItemList = new ArrayList<FileItemVO>();
	
		if(items != null) {
			FileItemVO fileItemInfo = null;
			for(MultipartFile item : items) {
				if(item.getSize()>0){
					
					fileItemInfo = new FileItemVO();
					
					// 파일명 취득
					// 브라우저별 D:\\temp\image\a.png
					//			or a.png
					String fileName = FilenameUtils.getName(item.getOriginalFilename()); // 확장자를 포함한 이름
					
					// 파일 실제 저장소 : D:\\temp\\files
					// 저장용 파일명을 별도로 작성
					// a.png => a
					String baseName = FilenameUtils.getBaseName(fileName); // 파일 이름만
					// a.png => png
					String extension = FilenameUtils.getExtension(fileName); // 확장자만
					// UUID(Univerally Unique Identifier) : 128bit 유일값 생성(-포함)
					String genID = UUID.randomUUID().toString().replace("-", "");
					
					// 	|----유니크한 랜덤값----|
					// a3243445443434434346.png
					String saveFileName = baseName + genID + "." + extension;
					fileItemInfo.setFile_save_name(saveFileName);									
					fileItemList.add(fileItemInfo);
					
					saveFile(saveFileName, item);
				}
				
			}
		}
		return fileItemList;
	}

	private static void saveFile(String saveFileName, MultipartFile item) {
		File saveFile = new File(GlobalConstant.FILE_PATH, saveFileName);
		
		try {
			item.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
