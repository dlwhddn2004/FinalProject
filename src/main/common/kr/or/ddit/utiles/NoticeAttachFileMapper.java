package kr.or.ddit.utiles;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.NoticefileVO;

public class NoticeAttachFileMapper {
   public static List<NoticefileVO> mapper(MultipartFile[] items,
                                 String notice_no) {
      List<NoticefileVO> fileItemList = new ArrayList<NoticefileVO>();
   
      if(items != null) {
         NoticefileVO fileItemInfo = null;
         for(MultipartFile item : items) {
            if(item.getSize()>0){
               
               fileItemInfo = new NoticefileVO();
               fileItemInfo.setNotice_no(notice_no);
               
               // 파일명 취득
               // 브라우저별 D:\\temp\image\a.png
               //         or a.png
               String fileRealName = FilenameUtils.getName(item.getOriginalFilename()); // 확장자를 포함한 이름
               fileItemInfo.setFile_realname(fileRealName);
               
               // 파일 실제 저장소 : D:\\temp\\files
               // 저장용 파일명을 별도로 작성
               // a.png => a
               String baseName = FilenameUtils.getBaseName(fileRealName); // 파일 이름만
               // a.png => png
               String extension = FilenameUtils.getExtension(fileRealName); // 확장자만
               // UUID(Univerally Unique Identifier) : 128bit 유일값 생성(-포함)
               String genID = UUID.randomUUID().toString().replace("-", "");
               
               //    |----유니크한 랜덤값----|
               // a3243445443434434346.png
               String saveFileName = baseName + genID + "." + extension;
               fileItemInfo.setFile_savename(saveFileName);
               
               fileItemInfo.setFile_content_type(item.getContentType());
               fileItemInfo.setFile_size(String.valueOf(item.getSize()));
               
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