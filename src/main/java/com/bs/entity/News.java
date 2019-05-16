package com.bs.entity;

import java.io.Serializable;

import lombok.Data;

/**
 * <p>ClassName: News</p>
 * <p>Description: [新闻实体类]</p> 
 * <p>2019年4月26日</p>
 */
@Data
public class News implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 新闻id
	 */
	private Integer id;
	/**
	 * 新闻图片
	 */
	private String pic;
	/**
	 * 新闻标题
	 */
	private String title;
	/**
	 * 新闻内容
	 */
	private String content;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 是否显示（0：显示 1：不显示）
	 */
	private Integer flag;
	
}