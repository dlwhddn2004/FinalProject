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
import kr.or.ddit.vo.ProfileFileVO;
import kr.or.ddit.vo.ProfileFileVO;
@Component
public class AttachFileMapperMember {
	public static List<ProfileFileVO> mapper(MultipartFile[] items,
											String profile_seq,String mem_id) {
		List<ProfileFileVO> fileItemList = new ArrayList<ProfileFileVO>();
	
		if(items != null) {
			ProfileFileVO fileItemInfo = null;
			for(MultipartFile item : items) {
				if(item.getSize()>0){
					
					fileItemInfo = new ProfileFileVO();
					fileItemInfo.setProfile_seq(profile_seq);
					fileItemInfo.setMem_id(mem_id);
					// 파일명 취득
					// 브라우저별 D:\\temp\image\a.png
					//			or a.png
					String fileName = FilenameUtils.getName(item.getOriginalFilename()); // 확장자를 포함한 이름
					fileItemInfo.setProfile_realname(fileName);
					
					// 파일 실제 저장소 : D:\\temp\\files
					// 저장용 파일명을 별도로 작성
					// a.png => a
					String baseName = FilenameUtils.getBaseName(fileName); // 파일 이름만
					// a.png => png
					String profile_contenttype = FilenameUtils.getExtension(fileName); // 확장자만
					// UUID(Univerally Unique Identifier) : 128bit 유일값 생성(-포함)
					String genID = UUID.randomUUID().toString().replace("-", "");
					
					// 	|----유니크한 랜덤값----|
					// a3243445443434434346.png
					String profile_savename = baseName + genID + "." + profile_contenttype;
					fileItemInfo.setProfile_savename(profile_savename);
					
					fileItemInfo.setProfile_contenttype(item.getContentType());
					fileItemInfo.setProfile_size(String.valueOf(item.getSize()));
					
					fileItemList.add(fileItemInfo);
					
					saveFile(profile_savename, item);
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
