package com.tp.travely.admin.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.tp.travely.member.model.vo.Member;

@Component
public class AdminDao {
	
	public ArrayList<Member> adminMemberList(SqlSessionTemplate sqlSession) {
		
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminMemberList");
	}
	
	

}
