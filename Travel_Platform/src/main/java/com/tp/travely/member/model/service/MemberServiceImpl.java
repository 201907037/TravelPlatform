package com.tp.travely.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tp.travely.member.model.dao.MemberDao;
import com.tp.travely.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(Member m) {
		
		// 1) SqlSessionTemplate 객체 생성
		// > root-context.xml 파일에
		//   해당 클래스 타입을 빈으로 등록해두었었음!!
		//   (전역변수로 빼고 Autowired 해둘 것)
		
		// 2) SqlSessionTemplate 객체와
		//    전달값을 넘기면서 DAO 로 요청 후 결과 받기
		Member loginUser 
			= memberDao.loginMember(sqlSession, m);
		
		// 3) 트랜잭션 처리 (select 문 이므로 패스)
		// > 앞으로 트랜잭션 관리도 스프링한테 맡길 예정!!
		
		// 4) SqlSessionTemplate 객체 반납
		// > SqlSessionTemplate 객체를 스프링이
		//   만들어 줬기 때문에 내가 반납을 신경쓸 필요 X
		
		// 5) 결과 리턴
		System.out.println(loginUser);
		return loginUser;
	}

	@Override
	@Transactional // 이 메소드를 하나의 트랜잭션으로 묶어주겠다.
	public int insertMember(Member m) {
		
		int result = memberDao.insertMember(sqlSession, m);
		
		// 트랜잭션을 관리해주는 빈 등록
		// > 자동으로 트랜잭션 관리
		
		return result;
	}

	@Override
	@Transactional
	public int updateMember(Member m) {

		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	@Transactional
	public int deleteMember(String userId) {

		return memberDao.deleteMember(sqlSession, userId);
	}

	@Override
	public int idCheck(String checkId) {
		
		return memberDao.idCheck(sqlSession, checkId);
	}

}
