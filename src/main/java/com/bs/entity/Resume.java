package com.bs.entity;

import lombok.Data;

/**
 * <p>ClassName: Resume</p>
 * <p>Description: [简历实体类]</p> 
 * <p>2019年4月26日</p>
 */
@Data
public class Resume
{

	/**
	 * 简历id
	 */
	private Integer id;
	/**
	 * 用户id
	 */
	private Integer userId;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 性别(0:男 1:女）
	 */
	private Integer sex;
	/**
	 * 年龄
	 */
	private Integer age;
	/**
	 * 电话
	 */
	private String telphone;
	/**
	 * 学历
	 */
	private String degree;
	/**
	 * 工作年限
	 */
	private String jobAge;
	/**
	 * 优势
	 */
	private String advantage;
	/**
	 * 职位
	 */
	private String position;
	/**
	 * 期望薪水
	 */
	private Integer salary;
	/**
	 * 学校
	 */
	private String school;
	/**
	 * 专业
	 */
	private String professional;
	/**
	 * 项目经历1
	 */
	private String project_experience1;
	/**
	 * 项目经历2
	 */
	private String project_experience2;
	/**
	 * 工作经历1
	 */
	private String work_experience1;
	/**
	 * 工作经历2
	 */
	private String work_experience2;
	/**
	 * 自我评价
	 */
	private String evaluate;
}
