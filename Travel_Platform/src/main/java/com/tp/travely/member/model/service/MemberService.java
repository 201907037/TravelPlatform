package com.tp.travely.member.model.service;

import com.tp.travely.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 서비스 (select)
		/* public abstract */ Member loginMember(Member m);

		// 회원가입 서비스 (insert)
		int insertMember(Member m);
		
		// 회원정보수정 서비스 (update)
		int updateMember(Member m);
		
		// 회원탈퇴 서비스 (update)
		int deleteMember(String userId);
		
		// 아이디 중복체크 서비스 (select) - ajax
		int idCheck(String checkId);
		
		int nickCheck(String checkNick);
		
		int emailCheck(String checkEmail);
		
		// 아이디 찾기
				String findUserIdByEmail(String email);
				
				// 비번찾기
				boolean sendResetPasswordEmail(String userEmail);
				
				// 비번변경
				boolean updatePassword(String userId, String currentPassword, String newPassword);
				
		
		

}
