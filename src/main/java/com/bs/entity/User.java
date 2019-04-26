package com.bs.entity;

import lombok.Data;
/**
 * <p>ClassName: User</p>
 * <p>Description: [用户实体类]</p> 
 * <p>2019年4月26日</p>
 */
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
	 * 用户类型（0：求职者 1：公司 2：系统管理）
	 */
	private Integer flag;
	
	/**
	 * 电子邮箱
	 */
	private String email;
	
}
