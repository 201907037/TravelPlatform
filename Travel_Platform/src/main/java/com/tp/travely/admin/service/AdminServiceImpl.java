package com.tp.travely.admin.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.travely.admin.dao.AdminDao;
import com.tp.travely.member.model.vo.Member;


@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDao adminDao;

	
	@Override
	public ArrayList<Member> adminMemberList() {
		
		
		
		return adminDao.adminMemberList(sqlSession);
	}
	
	
	
	
	
	
}
