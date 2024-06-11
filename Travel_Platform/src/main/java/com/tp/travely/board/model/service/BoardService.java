package com.tp.travely.board.model.service;

import java.util.ArrayList;

import com.tp.travely.board.model.vo.Board;
import com.tp.travely.board.model.vo.BoardImg;
import com.tp.travely.common.model.vo.PageInfo;
import com.tp.travely.member.model.vo.Member;

public interface BoardService {

	
	int insertBoard(Board b);
	
	int insertBoard(BoardImg bi);
	
	int selectListCount();
	
	ArrayList<Board> selectListBoard(PageInfo pi);
	
	ArrayList<BoardImg> selectListBoardImg();

	Board selectBoard(int bno);

	ArrayList<BoardImg> selectBoardImg(int bno);

	int increaseCount(int bno);

	ArrayList<Member> selectMember();

	Member selectDetailMember(int bno);
	
	
	
}
