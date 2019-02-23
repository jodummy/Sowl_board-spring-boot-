package com.sowl_notice.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.sowl_notice.service.MemberService;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    
     @Autowired MemberService memberService;
    
     @Override
     protected void configure(HttpSecurity http) throws Exception {
          http
               .csrf().disable()
               .authorizeRequests()
                    .antMatchers("/user/login").permitAll()
                    .antMatchers("/user").hasAuthority("USER")
                    .antMatchers("/admin").hasAuthority("ADMIN")
                    .anyRequest().authenticated()
                    .and()
//               .formLogin()
//                    .and()
               .logout()
               ;              
     }
    
     @Override
     protected void configure(AuthenticationManagerBuilder auth) throws Exception {
          auth.userDetailsService(memberService)
               .passwordEncoder(memberService.passwordEncoder());
     }
    
     @Bean
     @Override
     public AuthenticationManager authenticationManagerBean() throws Exception {
          return super.authenticationManagerBean();
     }
}