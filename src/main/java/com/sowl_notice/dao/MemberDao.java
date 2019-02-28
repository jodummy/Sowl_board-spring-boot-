package com.sowl_notice.dao;

import java.util.List;

import com.sowl_notice.model.MemberModel;

public interface MemberDao {
   MemberModel readUser(String user_id);
   
   List<String> readAuthority(String user_id);

}