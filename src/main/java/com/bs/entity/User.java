package com.bs.entity;

import lombok.Data;

@Data
public class User
{

	/**
	 * 用户id
	 */
	private Integer id;
	
	/**
	 * 用户账号
	 */
	private String userName;
	
	/**
	 * 登录密码
	 */
	private String passWord;
	
	/**
	 * 标志
	 */
	private Integer flag;
	
	/**
	 * 电子邮箱
	 */
	private String email;
	
}
