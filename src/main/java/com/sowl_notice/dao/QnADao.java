package com.sowl_notice.dao;

import java.util.List;

import com.sowl_notice.model.QnAModel;

public interface QnADao {
   List<QnAModel> qnaList();   
   int qnaInsert(QnAModel qnaModel);
   int qnaDelete(int qna_no);
   int qnaUpdate(QnAModel qnaModel);
   int commentUpdate(QnAModel qnaModel);
   int deleteComment(int qna_no);
   int updateComment(QnAModel qnaModel);
   
}