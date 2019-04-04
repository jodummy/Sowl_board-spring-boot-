package com.sowl_notice.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sowl_notice.model.BoardModel;
import com.sowl_notice.model.PageMaker;
import com.sowl_notice.model.SearchCriteria;
import com.sowl_notice.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/board/boardList", method = RequestMethod.GET)
	public String boardList(@ModelAttribute("criteria") SearchCriteria criteria, Model model, BoardModel boardModel)
			throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.selectBoardListCnt(criteria));
		model.addAttribute("list", boardService.listSearchPaging(criteria));
		model.addAttribute("totalCount", boardService.selectBoardListCnt(criteria));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("listNo", boardService.selectNoBoard());
		return "/board/boardList";
	}

	@RequestMapping(value = "/board/boardInsert", method = RequestMethod.GET) // URL 주소
	public String boardInsert(Model model, Principal principal) {		
		model.addAttribute("writer",principal.getName());
		return "/board/boardInsert";// JSP 파일명
	}

	@RequestMapping(value = "/boardInsertPage")
	public String boardInsertpage(BoardModel boardModel, @RequestParam("board_title") String board_title,
			@RequestParam("board_writer") String board_writer, @RequestParam("board_content") String board_content) {
		boardModel.setBoard_writer(board_writer);
		boardModel.setBoard_title(board_title);
		boardModel.setBoard_content(board_content);
		boardService.insertBoard(boardModel);
		return "redirect:/board/boardList";
	}

	@RequestMapping(value = "/board/boardDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardDetail(Model model, BoardModel boardModel, HttpServletRequest req) {
		// boardModel.setBoard_no(board_no);
		String no = req.getParameter("board_no");
		BoardModel dto = boardService.getBoard(Integer.parseInt(no));
		model.addAttribute("dto", dto);
		return "/board/boardDetail";// JSP 파일명
	}

	@RequestMapping(value = "/board/boardDelete", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardDelete(BoardModel boardModel, @RequestParam("board_no") String board_no) {
		int no = Integer.parseInt(board_no);
		if (no > 0 & board_no != null) {
			boardService.delBoard(no);
			return "redirect:/board/boardList";
		} else
			return "redirect:/board/boardDetail?board_no=" + board_no;

	}

	@RequestMapping(value = "/board/boardUpdate", method = RequestMethod.GET)
	public String boardUpdate(Model model, BoardModel boardModel, @RequestParam("board_no") int board_no) {
		boardModel = boardService.getBoard(board_no);
		model.addAttribute("dto", boardModel);
		return "/board/boardUpdate";
	}

	@RequestMapping("/boardUpdatePage")
	   public String boardUpdatePage(BoardModel boardModel) {
	      try {
	         boardModel.setBoard_no(boardModel.getBoard_no());
	         boardModel.setBoard_writer(boardModel.getBoard_writer());
	         boardModel.setBoard_title(boardModel.getBoard_title());
	         boardModel.setBoard_content(boardModel.getBoard_content());
	         boardService.updateBoard(boardModel);
	         return "redirect:/board/boardDetail?board_no=" + boardModel.getBoard_no();
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }
	      return "/board/boardUpdate?board_no=" + boardModel.getBoard_no();
	   }
}