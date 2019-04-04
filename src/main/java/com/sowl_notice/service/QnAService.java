package com.sowl_notice.service;

import java.util.List;

import com.sowl_notice.model.QnAModel;

public interface QnAService {
	List<QnAModel> qnaList();
	int qnaInsert(QnAModel qnaModel);

}
