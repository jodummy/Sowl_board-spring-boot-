package com.sowl_notice.config;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.annotation.Configuration;
//import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled= true)
//@Order(SecurityProperties.ACCESS_OVERRIDE_ORDER)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		//ADMIN 계정 정보 세팅 , 서버를 새로 업데이트한다(inMemoryAuthentication)
//		auth.inMemoryAuthentication().withUser("admin").password("{noop}master001").roles("ADMIN");
		auth.inMemoryAuthentication().withUser("test").password("{noop}1").roles("ADMIN");
		auth.inMemoryAuthentication().withUser("박동현").password("{noop}1").roles("ADMIN");
		auth.inMemoryAuthentication().withUser("김동욱").password("{noop}1").roles("ADMIN");
		auth.inMemoryAuthentication().withUser("감자2치킨1").password("{noop}1").roles("ADMIN");


	}

	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http.authorizeRequests().antMatchers("/webjars/**").permitAll();
		http.authorizeRequests().antMatchers("/resources/**").permitAll();
		http.authorizeRequests()
		.antMatchers("/board/**").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN') or hasRole('ROLE_SUPER')")
		.and()
		.formLogin().permitAll() //누구나 접근이 가능해야 한다.
		.and()
		.logout().permitAll().logoutSuccessUrl("/");
	}
	
	

}
