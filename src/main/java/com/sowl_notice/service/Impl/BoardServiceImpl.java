package com.sowl_notice.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sowl_notice.dao.BoardDao;
import com.sowl_notice.model.BoardModel;
import com.sowl_notice.model.Criteria;
import com.sowl_notice.model.SearchCriteria;
import com.sowl_notice.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;

	@Override
	public int insertBoard(BoardModel boardModel) {
		return dao.insertBoard(boardModel);
	}

	@Override
	public BoardModel getBoard(int board_no) {
		return dao.getBoard(board_no);
	}
	
	@Override
	public int delBoard(int board_no) {
		return dao.delBoard(board_no);
	}

	@Override
	public int updateBoard(BoardModel boardModel) {
		return dao.updateBoard(boardModel);
	}

	@Override
	public int selectBoardListCnt(SearchCriteria criteria) throws Exception {
		return dao.selectBoardListCnt(criteria);
	}

	@Override
	public List<BoardModel> listSearchPaging(SearchCriteria criteria) throws Exception {
		return dao.listSearchPaging(criteria);
	}

	@Override
	public List<BoardModel> selectNoBoard() {
		return dao.selectNoBoard();
	}

}