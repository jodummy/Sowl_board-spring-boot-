package com.sowl_notice.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

@Getter@Setter

public class MemberModel {
   private String user_id;
   private String user_password;
   private String user_name;
   private boolean user_isAccountNonExpired; 
   private boolean user_isAccountNonLocked;
   private boolean user_isCredentialsNonExpired;
   private boolean user_isEnabled;
   
   private Collection<? extends GrantedAuthority> authorities;
   
   public Collection<? extends GrantedAuthority> getAuthorities() {
       return authorities;
   }

   public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
       this.authorities = authorities;
   }

}