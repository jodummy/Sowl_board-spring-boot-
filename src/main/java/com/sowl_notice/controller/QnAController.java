package com.sowl_notice.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sowl_notice.model.QnAModel;
import com.sowl_notice.service.QnAService;

@Controller
public class QnAController {
   @Autowired
   QnAService qnaService;

   @RequestMapping(value = "/QnA/QnA", method = RequestMethod.GET)
   public String QnAList(Model model, Principal principal)   {
      List<QnAModel> list;
      list = qnaService.qnaList();
      model.addAttribute("writer", principal.getName());
      model.addAttribute("list", list);
      return "/QnA/QnA";
   }

   @RequestMapping(value = "/QnA/QnAInsert", method = RequestMethod.GET)
   public String QnAInsert(Model model, QnAModel qnaModel, @RequestParam Map<String, String> param) {
      qnaModel.setQna_content(param.get("qna_content"));
      qnaModel.setQna_writer(param.get("qna_writer"));
      qnaService.qnaInsert(qnaModel);
      return "redirect:/QnA/QnA";
   }

   @RequestMapping(value = "/QnA/QnADelete", method = RequestMethod.GET)
   public String QnADelete(Model model, QnAModel qnaModel,
         @RequestParam("qna_no") int qna_no) {
      qnaService.qnaDelete(qna_no);
      return "redirect:/QnA/QnA";
   }
   
   @RequestMapping(value = "/QnA/QnAUpdate", method = RequestMethod.GET)
   public String QnAUpdate(Model model, QnAModel qnaModel,
         @RequestParam Map<String, String> param) {
      qnaModel.setQna_no(Integer.parseInt(param.get("qna_no")));
      qnaModel.setQna_content(param.get("qna_content"));
      qnaService.qnaUpdate(qnaModel);
      return "redirect:/QnA/QnA";
   }
}