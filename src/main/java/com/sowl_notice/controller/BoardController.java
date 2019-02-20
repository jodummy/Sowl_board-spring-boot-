package com.sowl_notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sowl_notice.model.BoardModel;
import com.sowl_notice.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String list(Model model) {
		List<BoardModel> list = boardService.getListBoard();
		model.addAttribute("list", list);

		return "boardList"; // JSP 파일명
	}

	@RequestMapping("/main") // URL 주소
	public String main() {
		return "main";// JSP 파일명
	}

	@RequestMapping(value = "/boardInsert", method = RequestMethod.GET) // URL 주소
	public String boardInsert() {
		return "boardInsert";// JSP 파일명
	}

	@RequestMapping(value = "/boardInsertpage", method = { RequestMethod.GET, RequestMethod.POST }) // URL 주소
	public @ResponseBody void boardInsertpage(HttpServletRequest req, BoardModel boardModel) {
		System.out.println("inset page");
		// System.out.println(req.getParameter("board_writer"));
		// System.out.println(req.getParameter("board_title"));
		// System.out.println(req.getParameter("board_content"));

		boardModel.setBoard_writer(req.getParameter("board_writer"));
		boardModel.setBoard_title(req.getParameter("board_title"));
		boardModel.setBoard_content(req.getParameter("board_content"));

		boardService.insertBoard(boardModel);
		// return "boardList";
	}
	@RequestMapping(value = "/boardDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardDetail(Model model, BoardModel boardModel,HttpServletRequest req) {
		// boardModel.setBoard_no(board_no);
		System.out.println("boardDetail");
		String no = req.getParameter("board_no");
		BoardModel dto = boardService.getBoard(Integer.parseInt(no));
		model.addAttribute("dto",dto);
		return "boardDetail";// JSP 파일명
	}
}