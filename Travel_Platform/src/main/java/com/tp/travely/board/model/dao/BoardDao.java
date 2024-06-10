package com.tp.travely.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.tp.travely.board.model.vo.Board;
import com.tp.travely.board.model.vo.BoardImg;
import com.tp.travely.common.model.vo.PageInfo;

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

	public ArrayList<Board> selectListBoard(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectListBoard", null, rowBounds);
	}

	public ArrayList<BoardImg> selectListBoardImg(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectListBoardImg");
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	

}
