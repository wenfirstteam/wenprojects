package com.bs.entity;

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
