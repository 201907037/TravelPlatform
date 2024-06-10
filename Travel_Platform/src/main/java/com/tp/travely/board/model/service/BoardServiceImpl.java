package com.tp.travely.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tp.travely.board.model.dao.BoardDao;
import com.tp.travely.board.model.vo.Board;
import com.tp.travely.board.model.vo.BoardImg;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao boardDao;
	
	@Transactional
	@Override
	public int insertBoard(Board b) {
		
		return boardDao.insertBoard(sqlSession, b);
	}

	@Transactional
	@Override
	public int insertBoard(BoardImg bi) {
		
		return boardDao.insertBoard(sqlSession, bi);
	}

	@Override
	public ArrayList<Board> selectListBoard() {
		
		return boardDao.selectListBoard(sqlSession);
	}

	@Override
	public ArrayList<BoardImg> selectListBoardImg() {
		
		return boardDao.selectListBoardImg(sqlSession);
	}
	
	
	
	
	
}
