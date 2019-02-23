package com.sowl_notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sowl_notice.dao.MemberDao;
import com.sowl_notice.model.MemberModel;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberModel loginAction(MemberModel memberModel) {
		return dao.loginAction(memberModel);
	}

}
