package kr.or.ddit.fileitem.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.FileItemVO;

@Repository
public class IFileItemDAOImpl implements IFileItemDAO {

	@Autowired
	private SqlMapClient client;

	@Override
	public void insertFileItem(List<FileItemVO> fileitemList) throws Exception {
		// ibatis 트랜잭션
		// Commit : statrTransaction() => 쿼리 질의(전체 성공)
		// => commitTransaction();
		// => client.endTransaction();
		// Rollback : startTransaction() => 쿼리 질의(일부 성공 후 에러)
		// => commitTransaction();
		// => client.endTransaction();
		// client.startTransaction();
		try {
			client.startTransaction();
			for (FileItemVO fileitem : fileitemList) {
				client.insert("fileitem.insertFileItem", fileitem);
			}

			client.commitTransaction();
		} finally {
			client.endTransaction();
		}

	}

	@Override
	public FileItemVO fileitemInfo(Map<String, String> params) throws Exception {
		 return (FileItemVO) client.queryForObject("fileitem.fileitemInfo", params);
	
	}
}
