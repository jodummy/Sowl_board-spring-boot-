package com.sowl_notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sowl_notice.model.BoardModel;
import com.sowl_notice.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	@RequestMapping("/main") // URL 주소
	   public String main() {
	      return "main";// JSP 파일명
	   }

	   @RequestMapping(value = "/boardList", method = RequestMethod.GET)
	   public String list(Model model) {
	      List<BoardModel> list = boardService.getListBoard();
	      model.addAttribute("list", list);

	      return "boardList"; // JSP 파일명
	   }

	   @RequestMapping(value = "/boardInsert", method = RequestMethod.GET) // URL 주소
	   public String boardInsert() {
	      return "boardInsert";// JSP 파일명
	   }

	   @RequestMapping("/boardInsertpage")
	   public String boardInsertpage(BoardModel boardModel, @RequestParam("board_title") String board_title,
	         @RequestParam("board_writer") String board_writer, @RequestParam("board_content") String board_content) {
	      boardModel.setBoard_writer(board_writer);
	      boardModel.setBoard_title(board_title);
	      boardModel.setBoard_content(board_content);
	      boardService.insertBoard(boardModel);
	      return "redirect:/boardList";
	   }
	   
	@RequestMapping(value = "/boardDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardDetail(Model model, BoardModel boardModel, HttpServletRequest req) {
		// boardModel.setBoard_no(board_no);
		String no = req.getParameter("board_no");
		BoardModel dto = boardService.getBoard(Integer.parseInt(no));
		model.addAttribute("dto", dto);
		return "boardDetail";// JSP 파일명
	}

	@RequestMapping(value = "/boardDelete", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardDelete(
			BoardModel boardModel,
			@RequestParam("board_no") String board_no) {
		System.out.println("board delete");
		System.out.println(board_no);
		int no = Integer.parseInt(board_no);
		if (no > 0 & board_no != null) {
			boardService.delBoard(no);
			return "redirect:/boardList";
		} else
			return "redirect:/boardDetail?board_no=" + board_no;

	}
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
	public String boardUpdate(
			Model model,
			BoardModel boardModel,
			@RequestParam("board_no") int board_no){
		boardModel = boardService.getBoard(board_no);
		model.addAttribute("dto",boardModel);
		return "boardUpdate";
	}
	
	@RequestMapping("/boardUpdatePage")
	public String boardUpdatePage(
			@RequestParam("board_no")int board_no,
			@RequestParam("board_writer")String board_writer,
			@RequestParam("board_title")String board_title,
			@RequestParam("board_content")String board_content,
			BoardModel boardModel
			) 
	{
		try {
			boardModel.setBoard_no(board_no);
			boardModel.setBoard_writer(board_writer);
			boardModel.setBoard_title(board_title);
			boardModel.setBoard_content(board_content);
			boardService.updateBoard(boardModel);
			return "redirect:/boardDetail?board_no="+board_no;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "boardUpdate?board_no="+board_no;
		
	}
}