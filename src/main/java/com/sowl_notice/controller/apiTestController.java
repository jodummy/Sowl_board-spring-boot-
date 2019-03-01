package com.sowl_notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.sowl_notice.model.BoardModel;
import com.sowl_notice.service.BoardService;

@RestController
public class apiTestController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/ping", method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public List isRunning() {
		List<BoardModel> list = boardService.jsonList();
		
		return list;
	}

}
