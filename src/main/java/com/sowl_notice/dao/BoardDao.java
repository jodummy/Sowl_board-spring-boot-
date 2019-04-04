package com.sowl_notice.dao;

import java.util.List;

import com.sowl_notice.model.BoardModel;
import com.sowl_notice.model.Criteria;
import com.sowl_notice.model.SearchCriteria;

public interface BoardDao {

	List<BoardModel> selectNoBoard();

	int insertBoard(BoardModel boardModel);

	BoardModel getBoard(int board_no);

	int delBoard(int board_no);

	int updateBoard(BoardModel boardModel);

	int selectBoardListCnt(SearchCriteria criteria) throws Exception;

	List<BoardModel> listSearchPaging(Criteria criteria) throws Exception;

	List<BoardModel> jsonList();

}
