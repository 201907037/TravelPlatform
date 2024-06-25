package com.tp.travely.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.tp.travely.board.model.vo.Board;
import com.tp.travely.board.model.vo.BoardImg;
import com.tp.travely.board.model.vo.BoardLike;
import com.tp.travely.board.model.vo.Reply;
import com.tp.travely.common.model.vo.PageInfo;
import com.tp.travely.member.model.vo.Member;

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

	// 게시글 목록 조회
	public ArrayList<Board> selectListBoard(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectListBoard", null, rowBounds);
	}

	// 게시글 목록이미지 조회
	public ArrayList<BoardImg> selectListBoardImg(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectListBoardImg", null, rowBounds);
	}

	// 게시글 갯수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	// 게시글 상세조회
	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo ) {
		
		return (Board)sqlSession.selectOne("boardMapper.selectBoard", boardNo);
		
		
	}

	// 게시글 이미지 상세조회
	public ArrayList<BoardImg> selectBoardImg(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardImg", boardNo);
	}

	// 조회수 증가용
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("boardMapper.increaseCount", boardNo);
	}

	// 게시글 회원 목록조회
	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectMember", null, rowBounds);
	}

	// 게시글 회원 한명조회
	public Member selectDetailMember(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (Member)sqlSession.selectOne("boardMapper.selectDetailMember", boardNo);
	}

	// 좋아요 체크
	public int likeCheck(SqlSessionTemplate sqlSession, BoardLike bl) {
		
		return sqlSession.selectOne("boardMapper.likeCheck", bl);
	}

	// 좋아요 추가
	public int insertLike(SqlSessionTemplate sqlSession, BoardLike bl) {
		
		return sqlSession.insert("boardMapper.insertLike", bl);
	}

	// 좋아요 삭제
	public int deleteLike(SqlSessionTemplate sqlSession, BoardLike bl) {
		
		return sqlSession.delete("boardMapper.deleteLike", bl);
	}

	// 게시글 목록별 좋아요 총갯수 조회
	public Integer likeListCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("boardMapper.likeListCount", boardNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", boardNo);
	}

	public Member selectReplyMember(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.selectOne("boardMapper.selectReplyMember", r);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.update("boardMapper.updateReply", r);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.update("boardMapper.deleteReply", r);
	}

	public int updateBiStatus(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("boardMapper.updateBiStatus", boardNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int updateBoardImg(SqlSessionTemplate sqlSession, BoardImg boardImg) {
		
		return sqlSession.insert("boardMapper.updateBoardImg", boardImg);
	}

	public int ajaxUpdate(SqlSessionTemplate sqlSession, int imgNo) {
		
		return sqlSession.update("boardMapper.ajaxUpdate", imgNo);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}

	// 검색 목록 게시글 카운트
	public int searchBoardCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("boardMapper.searchBoardCount", keyword);
	}

	// 검색 목록 게시글 리스트
	public ArrayList<Board> searchListBoard(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.searchListBoard", keyword, rowBounds);
	}

	// 검색 목록 썸네일
	public ArrayList<BoardImg> searchListBoardImg(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("boardMapper.searchListBoardImg", keyword);
	}

	// 검색 목록 게시글 회원 정보
	public ArrayList<Member> searchMember(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("boardMapper.searchMember", keyword);
	}

	

	

}
