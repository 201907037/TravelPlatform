package com.tp.travely.board.model.service;

import java.util.ArrayList;

import com.tp.travely.board.model.vo.Board;
import com.tp.travely.board.model.vo.BoardImg;

public interface BoardService {

	
	int insertBoard(Board b);
	
	int insertBoard(BoardImg bi);
	
	ArrayList<Board> selectListBoard();
	
	ArrayList<BoardImg> selectListBoardImg();
	
}
