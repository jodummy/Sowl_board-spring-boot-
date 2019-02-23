package com.sowl_notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sowl_notice.dao.MemberDao;

@Service
public class MemberServiceImpl {
	
	@Autowired
	private MemberDao dao;

}
