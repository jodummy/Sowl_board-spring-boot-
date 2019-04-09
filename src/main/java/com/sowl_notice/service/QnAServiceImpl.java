package com.sowl_notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sowl_notice.dao.QnADao;
import com.sowl_notice.model.QnAModel;

@Service
public class QnAServiceImpl implements QnAService{
   
   @Autowired
   QnADao qnadao;

   @Override
   public List<QnAModel> qnaList() {
      return qnadao.qnaList();
   }

   @Override
   public int qnaInsert(QnAModel qnaModel) {
      return qnadao.qnaInsert(qnaModel);
   }

   @Override
   public int qnaDelete(int qna_no) {
      return qnadao.qnaDelete(qna_no);
   }

   @Override
   public int qnaUpdate(QnAModel qnaModel) {
      return qnadao.qnaUpdate(qnaModel);
   }

}