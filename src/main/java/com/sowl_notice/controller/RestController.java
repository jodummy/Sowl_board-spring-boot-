package com.sowl_notice.controller;

import com.sowl_notice.model.BoardModel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RestController {
	
	
	@RequestMapping(value = "/" , method=RequestMethod.GET)
	public BoardModel test(){
		return null;
	}

}
