package com.tp.travely.admin.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.travely.admin.dao.AdminDao;
import com.tp.travely.board.model.vo.Board;
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
	
	
	@Override
	public ArrayList<Board> adminBoardListView() {
		return adminDao.adminBoardListView(sqlSession);
	}


	@Override
	public int boardSafe(int boardNo) {
		return adminDao.boardSafe(sqlSession, boardNo);
	}
	
	@Override
	public int boardDelate(int boardNo) {
		return adminDao.boardDelate(sqlSession, boardNo);
	}


	@Override
	public ArrayList<GenderCount> genderCount() {
		return adminDao.genderCount(sqlSession);
	}


	@Override
	public ArrayList<Map> tourTypeCount() {
		return adminDao.tourTypeCount(sqlSession);
	}


	@Override
	public ArrayList<Map> uploadCount() {
		return adminDao.uploadCount(sqlSession);
	}
	
	
	
	
}
