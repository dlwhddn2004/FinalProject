package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.IMemberDAOImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;

// 설정 파일 : <bean name="iMemberServiceImpl"
//			class="kr.or.ddit.member.service.IMemberServiceImpl" />
@Service
public class IMemberServiceImpl implements IMemberService {
	@Autowired
	private IMemberDAO dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception {
			return dao.memberInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<MemberVO> memberList(Map<String, String> params) throws Exception {

		return	dao.memberList(params);
	}
//
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void deleteMemberInfo(Map<String, String> params) throws Exception{
			dao.deleteMemberInfo(params);
	}
//	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void updateMemberInfo(MemberVO memberInfo) throws Exception {

			dao.updateMemberInfo(memberInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void insertMemberInfo(MemberVO memberInfo)  throws Exception{

			dao.insertMemberInfo(memberInfo);

	}
	/*@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public String totalCount(Map<String, String> params) throws Exception{
		
	
		return dao.totalCount(params);
		
	}
	
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void memberDeleteSuccess(Map<String, String> params)throws Exception {
		
		
			dao.memberDeleteSuccess(params);
	}
*/
	
//	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
//	@Override
//	public String totalCount(Map<String, String> params) throws Exception{
//			return  dao.totalCount(params);
//	}

}
