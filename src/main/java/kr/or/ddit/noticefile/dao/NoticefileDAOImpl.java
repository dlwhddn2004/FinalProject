package kr.or.ddit.noticefile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticefileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class NoticefileDAOImpl implements INoticefileDAO{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertNoticefile(List<NoticefileVO> noticefile)
			throws Exception {
	try{	
		client.startTransaction();
		
		for(NoticefileVO noticefileInfo : noticefile){
			client.insert("noticefile.insertnoticefile");
		}
		client.commitTransaction();
	}finally{
		client.endTransaction();
	}
}
	

	@Override
	public NoticefileVO noticefileInfo(Map<String, String> params)
			throws Exception {
		return (NoticefileVO) client.queryForObject("noticefile.noticefileInfo");
	}

}
