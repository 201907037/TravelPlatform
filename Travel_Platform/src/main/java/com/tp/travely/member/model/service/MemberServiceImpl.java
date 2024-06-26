package com.tp.travely.member.model.service;

import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tp.travely.member.model.dao.MemberDao;
import com.tp.travely.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
    private MailSendService mailSendService;
	
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
	
	@Override
	public int nickCheck(String checkNick) {
		
		return memberDao.nickCheck(sqlSession, checkNick);
	}
	
	@Override
	public int emailCheck(String checkEmail) {
		
		return memberDao.emailCheck(sqlSession, checkEmail);
	}
	
	// 아이디 찾기
	 @Override
	    public String findUserIdByEmail(String email) {
        return memberDao.findUserIdByEmail(sqlSession, email);
    }
	 
	 @Override
	 public boolean sendResetPasswordEmail(String userEmail) {
	     Member member = memberDao.findMemberByEmail(sqlSession, userEmail);
	     System.out.println(member);

	     if (member != null) {
	         String tempPassword = generateTemporaryPassword();
	         String encTempPassword = bcryptPasswordEncoder.encode(tempPassword);
	         member.setUserPwd(encTempPassword);
	         int result = memberDao.updatePassword(sqlSession, member);

	         if (result > 0) {
	             mailSendService.sendResetPasswordEmail(userEmail, tempPassword); // 이메일 전송 시 임시 비밀번호 함께 전달
	             return true;
	         } else {
	             System.out.println("비밀번호 업데이트 실패");
	             return false;
	         }
	     } else {
	         System.out.println("해당 이메일로 가입된 회원이 없습니다.");
	         return false;
	     }
	 }


	   
	 
	 @Override
	 @Transactional
	 public boolean updatePassword(String userId, String currentPassword, String newPassword) {
	     Member member = new Member();
	     member.setUserId(userId);
	     member.setUserPwd(currentPassword);
	     
	     Member authenticatedMember = memberDao.loginMember(sqlSession, member);
	     
	     if (authenticatedMember != null && bcryptPasswordEncoder.matches(currentPassword, authenticatedMember.getUserPwd())) {
	         String encNewPassword = bcryptPasswordEncoder.encode(newPassword);
	         authenticatedMember.setUserPwd(encNewPassword);
	         
	         int result = memberDao.updatePassword(sqlSession, authenticatedMember);
	         if (result > 0) {
	             return true; // 비밀번호 업데이트 성공
	         } else {
	             log.error("Failed to update password for user: {}", userId);
	             return false; // 비밀번호 업데이트 실패
	         }
	     } else {
	         return false; // 현재 비밀번호가 일치하지 않는 경우
	     }
	 }

	    // 임시 비밀번호 생성 메서드
	    private String generateTemporaryPassword() {
	        return java.util.UUID.randomUUID().toString().substring(0, 8); // UUID를 사용하여 임시 비밀번호 생성
	    }
	 
	 


}
