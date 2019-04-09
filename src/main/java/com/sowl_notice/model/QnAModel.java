package com.sowl_notice.model;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class QnAModel {
   private int    qna_no;
   private String qna_writer;
   private String qna_content;
   private String qna_insertdate;
   private String qna_comment;
   @Override
   public String toString() {
      return "QnAModel [qna_no=" + qna_no + ", qna_writer=" + qna_writer + ", qna_content=" + qna_content
            + ", qna_insertdate=" + qna_insertdate + ", qna_comment=" + qna_comment + "]";
   }
   
   
}