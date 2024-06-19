package com.tp.travely.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tp.travely.member.model.vo.Member;


@Repository
public class MemberDao {
	
	
	
public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
	}
	
	public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
		
		return sqlSession.selectOne("memberMapper.emailCheck", checkEmail);
	}
	
	public String findUserIdByEmail(SqlSessionTemplate sqlSession, String email) {
        return sqlSession.selectOne("memberMapper.findUserIdByEmail", email);
    }
	
	public Member findMemberByEmail(SqlSessionTemplate sqlSession, String email) {
        return sqlSession.selectOne("memberMapper.findMemberByEmail", email);
    }

    public int updatePassword(SqlSessionTemplate sqlSession, Member member) {
        return sqlSession.update("memberMapper.updatePassword", member);
    }
    
    
	
	
	
	
	
	

	
	

}
