package com.tp.travely.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.tp.travely.board.model.vo.Board;
import com.tp.travely.board.model.vo.BoardImg;

@Component
public class BoardDao {

	// 게시글 작성 - board
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		
		
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	// 게시글 작성 - boardImg
	public int insertBoard(SqlSessionTemplate sqlSession, BoardImg bi) {
		
		return sqlSession.insert("boardMapper.insertBoardImg", bi);
	}

	public ArrayList<Board> selectListBoard(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectListBoard");
	}

	public ArrayList<BoardImg> selectListBoardImg(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectListBoardImg");
	}

	

}
