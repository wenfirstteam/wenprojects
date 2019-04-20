package com.bs.entity;

public class User
{

	private Integer id;
	private String userName;
	private String passWord;
	//0：求职者  1：公司  2：系统管理
	private Integer flag;
	private String email;
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getPassWord()
	{
		return passWord;
	}
	public void setPassWord(String passWord)
	{
		this.passWord = passWord;
	}
	public Integer getFlag()
	{
		return flag;
	}
	public void setFlag(Integer flag)
	{
		this.flag = flag;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	
}
