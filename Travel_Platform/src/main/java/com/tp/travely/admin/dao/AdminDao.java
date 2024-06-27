package com.tp.travely.admin.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.tp.travely.admin.service.GenderCount;
import com.tp.travely.board.model.vo.Board;
import com.tp.travely.member.model.vo.Member;

@Component
public class AdminDao {
	
	public ArrayList<Member> adminMemberList(SqlSessionTemplate sqlSession) {
		
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminMemberList");
	}
	
	public ArrayList<Board> adminBoardListView(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.adminBoardListView");
	}

	public int boardSafe(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.boardSafe", boardNo);
	}
	
	public int boardDelate(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.boardDelate", boardNo);
	}

	public ArrayList<GenderCount> genderCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.genderCount");
	}

	public ArrayList<Map> tourTypeCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.tourTypeCount");
//		System.out.println(sqlSession.selectList("adminMapper.tourTypeCount"));
//		return null;
	}

	public ArrayList<Map> uploadCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.uploadCount");
	}

}
