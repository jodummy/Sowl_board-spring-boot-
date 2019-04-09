package com.sowl_notice.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sowl_notice.model.BoardModel;
import com.sowl_notice.model.PageMaker;
import com.sowl_notice.model.SearchCriteria;
import com.sowl_notice.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/board/boardList", method = RequestMethod.GET)
	public String boardList(SearchCriteria criteria, Model model, BoardModel boardModel, int board_category)
			throws Exception {
		criteria.setCategory(board_category);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.selectBoardListCnt(criteria));
		model.addAttribute("list", boardService.listSearchPaging(criteria));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("board_category", board_category);

		return "/board/boardList";
	}

	@RequestMapping(value = "/board/boardInsert", method = RequestMethod.GET) // URL 주소
	public String boardInsert(Model model, Principal principal, @RequestParam("board_category") String board_category) {
		model.addAttribute("writer", principal.getName());
		model.addAttribute("board_category", board_category);
		return "/board/boardInsert";// JSP 파일명
	}

	@RequestMapping(value = "/boardInsertPage")
	public String boardInsertpage(BoardModel boardModel, @RequestParam("board_category") String board_category) {
		System.out.println("board_category : " + board_category);
		boardModel.setBoard_category(Integer.parseInt(board_category));
		boardService.insertBoard(boardModel);
		return "redirect:/board/boardList?board_category=" + board_category;
	}

	@RequestMapping(value = "/board/boardDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardDetail(Model model, BoardModel boardModel, int board_category) {
		model.addAttribute("dto", boardService.getBoard(boardModel.getBoard_no()));
		model.addAttribute("board_category", board_category);
		return "/board/boardDetail";
	}

	@RequestMapping(value = "/boardDelete", method=RequestMethod.GET)
	public String boardDelete(BoardModel boardModel/*, @RequestParam("board_no") String board_no, int board_category*/) {
		System.out.println( boardModel.getBoard_category() + "++++++++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println( boardModel.getBoard_no() + "-------------------------------------------------");
		System.out.println("1");
		boardService.delBoard(boardModel.getBoard_no());
		System.out.println(2);
		return "redirect:/board/boardList?board_category=" + boardModel.getBoard_category();
	}

	@RequestMapping(value = "/board/boardUpdate", method = RequestMethod.GET)
	public String boardUpdate(Model model, BoardModel boardModel, @RequestParam("board_no") int board_no,
			int board_category) {
		boardModel.setBoard_category(board_category);
		model.addAttribute("dto", boardService.getBoard(board_no));
		model.addAttribute("board_category", board_category);
		return "/board/boardUpdate";
	}

	@RequestMapping("/boardUpdatePage")
	public String boardUpdatePage(BoardModel boardModel, int board_category) {
		try {
			boardModel.setBoard_no(boardModel.getBoard_no());
			boardModel.setBoard_writer(boardModel.getBoard_writer());
			boardModel.setBoard_title(boardModel.getBoard_title());
			boardModel.setBoard_content(boardModel.getBoard_content());
			boardService.updateBoard(boardModel);
			return "redirect:/board/boardDetail?board_no=" + boardModel.getBoard_no() + "&board_category="
					+ board_category;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "/board/boardUpdate?board_no=" + boardModel.getBoard_no() + "&board_category=" + board_category;
	}
}