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

	private Integer id;
	private Integer userId;
	private String name;
	private Integer sex;
	private Integer age;
	private String telphone;
	private String degree;
	private String jobAge;
	private String advantage;
	private String position;
	private Integer salary;
	private String school;
	private String professional;
	private String project_experience1;
	private String project_experience2;
	private String work_experience1;
	private String work_experience2;
	//自我评价
	private String evaluate;
}
