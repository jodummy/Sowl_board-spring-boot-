package com.sowl_notice.dao;

import java.util.List;

import com.sowl_notice.model.QnAModel;

public interface QnADao {
	List<QnAModel> qnaList();	
	int qnaInsert(QnAModel qnaModel);
}
