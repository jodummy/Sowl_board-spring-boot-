package com.sowl_notice.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sowl_notice.dao.BoardDao;
import com.sowl_notice.model.BoardModel;
import com.sowl_notice.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;

	@Override
	public List<BoardModel> getListBoard() {
		List<BoardModel> list = dao.getListBoard();
		return list;
	}

	@Override
	public int insertBoard(BoardModel boardModel) {
		return dao.insertBoard(boardModel);
	}

	@Override
	public BoardModel getBoard(int board_no) {
		return dao.getBoard(board_no);
	}

}