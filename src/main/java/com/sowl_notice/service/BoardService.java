package com.sowl_notice.service;

import java.util.List;

import com.sowl_notice.model.BoardModel;

public interface BoardService {
	
	List<BoardModel> getListBoard();
	
	int insertBoard(BoardModel boardModel);
	
	BoardModel getBoard(int board_no);
}
