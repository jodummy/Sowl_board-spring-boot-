package com.sowl_notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sowl_notice.model.MemberModel;
import com.sowl_notice.service.MemberService;


@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping("/logIn") // URL 주소
	public String logIn() {
	   return "logIn";// JSP 파일명
	}
	
	@RequestMapping(value = "/logInDo",method=RequestMethod.POST)
	public String logIndo(
			@RequestParam("sowl_id") String sowl_id,
	         @RequestParam("sowl_password") String sowl_password,
	        MemberModel memberModel,
	        HttpServletRequest req,
	        Model model
			){
		MemberModel resultModel = new MemberModel();
		resultModel = memberService.loginAction(memberModel);
		 if(resultModel != null && !resultModel.getSowl_id().equals("") && !resultModel.getSowl_password().equals("")){
			 if(resultModel.getSowl_password().length() == memberModel.getSowl_password().length()) {
				 req.getSession().setAttribute("resultModel", resultModel);
				 return "redirect:/boardList";
			 }
			 model.addAttribute("msg", "패스워드가 일치하지 않습니다.");
	         return "redirect:/logIn";
        } else {
            model.addAttribute("msg", "사용자의 ID 혹은 패스워드가 일치하지 않습니다.");
            return "redirect:/logIn";
            
        }
	}
	
	
}
