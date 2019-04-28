package com.bs.entity;

import lombok.Data;
/**
 * <p>ClassName: Introduction</p>
 * <p>Description: [公司简介实体类]</p> 
 * <p>2019年4月26日</p>
 */
@Data
public class Introduction
{

	/**
	 * 公司简介id
	 */
	private Integer id;
	/**
	 * 用户id
	 */
	private Integer userId;
	/**
	 * 公司名称
	 */
	private String companyName;
	/**
	 * 代表人姓名
	 */
	private String name;
	/**
	 * 代表人职位
	 */
	private String position;
	/**
	 * 邮箱
	 */
	private String email;
	/**
	 * 电话
	 */
	private String telphone;
	/**
	 * 地址
	 */
	private String address;
	/**
	 * 公司规模
	 */
	private String people;
	
	/**
	 * 公司头像
	 */
	private String icon;
}
