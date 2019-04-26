package com.bs.entity;

import lombok.Data;

/**
 * <p>ClassName: Position</p>
 * <p>Description: [职位实体类]</p> 
 * <p>2019年4月26日</p>
 */
@Data
public class Position
{

	/**
	 * 职位id
	 */
	private Integer id;
	/**
	 * 公司id
	 */
	private Integer userId;
	/**
	 * 发布的职位名称
	 */
	private String position;
	/**
	 * 工作性质
	 */
	private String jobNature;
	/**
	 * 工作年限
	 */
	private String jobAge;
	/**
	 * 学历
	 */
	private String degree;
	/**
	 * 最低薪水
	 */
	private Integer salaryLow;
	/**
	 * 最高薪水
	 */
	private Integer salaryHigh;
	/**
	 * 技能要求
	 */
	private String skillsRequired;
	/**
	 * 职位描述
	 */
	private String jobDescription;
	/**
	 * 招聘人数
	 */
	private String peopleNumber;
	/**
	 * 是否通过审核（0：未通过 1：通过 2：待审核）
	 */
	private Integer publish;
}
