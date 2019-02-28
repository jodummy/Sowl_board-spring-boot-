package com.sowl_notice.service;

import org.apache.ibatis.javassist.compiler.ast.Member;

import com.sowl_notice.model.MemberModel;

public interface MemberService {
	public MemberModel readUser(String user_id);
	
}
