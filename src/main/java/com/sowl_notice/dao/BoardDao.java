package com.sowl_notice.dao;

import java.util.List;

import com.sowl_notice.model.BoardModel;

public interface BoardDao {
	List<BoardModel> getListBoard();
	int insertBoard(BoardModel boardModel);
	BoardModel getBoard(int board_no);
}
