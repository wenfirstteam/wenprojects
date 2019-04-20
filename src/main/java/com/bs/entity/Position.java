package com.bs.entity;
/**
 * Ö°Î»±í
 * @author Administrator
 *
 */
public class Position
{

	private Integer id;
	private Integer userId;
	private String CompanyName;
	private String position;
	private String jobNature;
	private String jobAge;
	private String degree;
	private Integer salaryLow;
	private Integer salaryHigh;
	private String skillsRequired;
	private String jobDescription;
	private String address;
	private Integer peopleNumber;
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public Integer getUserId()
	{
		return userId;
	}
	public void setUserId(Integer userId)
	{
		this.userId = userId;
	}
	public String getCompanyName()
	{
		return CompanyName;
	}
	public void setCompanyName(String companyName)
	{
		CompanyName = companyName;
	}
	public String getPosition()
	{
		return position;
	}
	public void setPosition(String position)
	{
		this.position = position;
	}
	public String getJobNature()
	{
		return jobNature;
	}
	public void setJobNature(String jobNature)
	{
		this.jobNature = jobNature;
	}
	public String getJobAge()
	{
		return jobAge;
	}
	public void setJobAge(String jobAge)
	{
		this.jobAge = jobAge;
	}
	public String getDegree()
	{
		return degree;
	}
	public void setDegree(String degree)
	{
		this.degree = degree;
	}
	public Integer getSalaryLow()
	{
		return salaryLow;
	}
	public void setSalaryLow(Integer salaryLow)
	{
		this.salaryLow = salaryLow;
	}
	public Integer getSalaryHigh()
	{
		return salaryHigh;
	}
	public void setSalaryHigh(Integer salaryHigh)
	{
		this.salaryHigh = salaryHigh;
	}
	public String getSkillsRequired()
	{
		return skillsRequired;
	}
	public void setSkillsRequired(String skillsRequired)
	{
		this.skillsRequired = skillsRequired;
	}
	public String getJobDescription()
	{
		return jobDescription;
	}
	public void setJobDescription(String jobDescription)
	{
		this.jobDescription = jobDescription;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public Integer getPeopleNumber()
	{
		return peopleNumber;
	}
	public void setPeopleNumber(Integer peopleNumber)
	{
		this.peopleNumber = peopleNumber;
	}
	
}
