package kr.or.ddit.freeboard.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.fileitem.dao.IFileItemDAO;
import kr.or.ddit.fileitem.dao.IFileItemDAOImpl;
import kr.or.ddit.freeboard.dao.IFreeboardDAO;
import kr.or.ddit.freeboard.dao.IFreeboardDAOImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FreeboardVO;

// 설정파일 : <bean name="iFreeboardServiceImpl" Class="kr.or.ddit.freeboard.service.IFreeboardServiceImpl" />
// Service어노테이션에 이름을 넣으면 빈등록시 이름이 바뀜
@Service("freeboardService")
public class IFreeboardServiceImpl implements IFreeboardService {

	@Autowired
	private IFreeboardDAO freeboardDAO;
	@Autowired
	private IFileItemDAO fileitemDAO;




	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<FreeboardVO> freeboardList(Map<String, String> params) throws Exception{
			return freeboardDAO.freeboardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertFreeboard(FreeboardVO fVO, MultipartFile[] items) throws Exception{
			String bo_no = freeboardDAO.insertFreeboard(fVO);
			List<FileItemVO> fileItemList = AttachFileMapper.mapper(items, bo_no);
			fileitemDAO.insertFileItem(fileItemList);
			return bo_no;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertFreeboard(FreeboardVO fVO) throws Exception{
			String bo_no = freeboardDAO.insertFreeboard(fVO);
			return bo_no;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public FreeboardVO freeboardInfo(Map<String, String> params) throws Exception{
			return freeboardDAO.freeboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteFreeboard(Map<String, String> params) throws Exception{
			return freeboardDAO.deleteFreeboard(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateFreeboard(FreeboardVO fVO) throws Exception{
		return	freeboardDAO.updateFreeboard(fVO);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertFreeboardReply(FreeboardVO fVO) throws Exception{
			return freeboardDAO.insertFreeboardReply(fVO);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public String totalCount(Map<String, String> params) throws Exception{
			return freeboardDAO.totalCount(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void hitUp(Map<String, String> params) throws Exception {
			freeboardDAO.hitUp(params);
		
	}
}
