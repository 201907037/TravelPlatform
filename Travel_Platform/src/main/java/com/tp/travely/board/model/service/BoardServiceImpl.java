package com.tp.travely.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tp.travely.board.model.dao.BoardDao;
import com.tp.travely.board.model.vo.Board;
import com.tp.travely.board.model.vo.BoardImg;
import com.tp.travely.board.model.vo.BoardLike;
import com.tp.travely.board.model.vo.Reply;
import com.tp.travely.common.model.vo.PageInfo;
import com.tp.travely.member.model.vo.Member;

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
	public ArrayList<Board> selectListBoard(PageInfo pi) {
		
		return boardDao.selectListBoard(sqlSession, pi);
	}

	@Override
	public ArrayList<BoardImg> selectListBoardImg() {
		
		return boardDao.selectListBoardImg(sqlSession);
	}

	@Override
	public int selectListCount() {
		
		return boardDao.selectListCount(sqlSession);
	}

	@Override
	public Board selectBoard(int bno) {
		
		return boardDao.selectBoard(sqlSession, bno);
	}

	@Override
	public ArrayList<BoardImg> selectBoardImg(int bno) {
		
		return boardDao.selectBoardImg(sqlSession, bno);
	}

	@Transactional
	@Override
	public int increaseCount(int bno) {
		
		return boardDao.increaseCount(sqlSession, bno);
	}

	@Override
	public ArrayList<Member> selectMember() {
		
		return boardDao.selectMember(sqlSession);
	}

	@Override
	public Member selectDetailMember(int bno) {
		
		return boardDao.selectDetailMember(sqlSession, bno);
	}

	@Override
	public int likeCheck(BoardLike bl) {
		
		return boardDao.likeCheck(sqlSession, bl);
	}
	
	@Transactional
	@Override
	public int insertLike(BoardLike bl) {
		
		return boardDao.insertLike(sqlSession, bl);
	}

	@Transactional
	@Override
	public int deleteLike(BoardLike bl) {
		
		return boardDao.deleteLike(sqlSession, bl);
	}

	@Override
	public Integer likeListCount(int boardNo) {
		
		return boardDao.likeListCount(sqlSession, boardNo);
	}

	@Transactional
	@Override
	public int insertReply(Reply r) {
		
		return boardDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bno) {
		
		return boardDao.selectReplyList(sqlSession, bno);
	}

	@Override
	public Member selectReplyMember(Reply r) {
		
		return boardDao.selectReplyMember(sqlSession, r);
	}

	@Transactional
	@Override
	public int updateReply(Reply r) {
		
		return boardDao.updateReply(sqlSession, r);
	}

	@Transactional
	@Override
	public int deleteReply(Reply r) {
		
		return boardDao.deleteReply(sqlSession, r);
	}

	@Transactional
	@Override
	public int updateBiStatus(int boardNo) {
		
		return boardDao.updateBiStatus(sqlSession, boardNo);
	}

	@Transactional
	@Override
	public int updateBoard(Board b) {
		
		return boardDao.updateBoard(sqlSession, b);
	}

	@Transactional
	@Override
	public int updateBoardImg(BoardImg bi) {
		
		return boardDao.updateBoardImg(sqlSession, bi);
	}

	@Transactional
	@Override
	public int ajaxUpdate(int imgNo) {
		
		return boardDao.ajaxUpdate(sqlSession, imgNo);
	}

	@Transactional
	@Override
	public int deleteBoard(int bno) {
		
		return boardDao.deleteBoard(sqlSession, bno);
	}

	
	
	
	
	
	
}
