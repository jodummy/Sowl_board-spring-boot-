package com.sowl_notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sowl_notice.dao.MemberDao;

@Controller
public class MemberController {

	@Autowired
	MemberDao memberDao;


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcomePage(Authentication auth , HttpServletRequest req) {
		ModelAndView model = new ModelAndView();
		if(auth != null && auth.getName() != null) {
			return "main";
		}else {
			model.addObject("message", "welcom anonmous user");
		}
		
		model.setViewName("main");
		return "main";
	}

}
