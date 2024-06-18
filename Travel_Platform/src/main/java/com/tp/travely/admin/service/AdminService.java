package com.tp.travely.admin.service;

import java.util.ArrayList;

import com.tp.travely.board.model.vo.Board;
import com.tp.travely.member.model.vo.Member;


public interface AdminService  {
	
	
	ArrayList<Member> adminMemberList();
	
	ArrayList<Board> adminBoardListView();

	int boardSafe(int boardNo);
	
	int boardDelate(int boardNo);
	

}
