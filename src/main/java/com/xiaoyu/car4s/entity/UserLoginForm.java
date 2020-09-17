package com.xiaoyu.car4s.entity;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class UserLoginForm {
	@NotBlank(message = "{user.login.username.blank}")
	@Length(min=6,max=16,message ="{user.login.username.length}")
	private String username;
	
	@NotBlank(message = "空空如也")
	@Length(min=1,max=6,message = "{user.login.password.length}")
	private String password;
	
}
