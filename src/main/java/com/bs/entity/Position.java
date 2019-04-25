package com.bs.entity;

import lombok.Data;

/**
 * 职位
 * @author Administrator
 *
 */
@Data
public class Position
{

	private Integer id;
	private Integer userId;
	private String position;
	private String jobNature;
	private String jobAge;
	private String degree;
	private Integer salaryLow;
	private Integer salaryHigh;
	private String skillsRequired;
	private String jobDescription;
	private String peopleNumber;
	private Integer publish;
}
