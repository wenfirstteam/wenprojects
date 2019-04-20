package com.bs.mapper;

import com.bs.entity.User;

public interface UserMapper
{

	public User findPwdByUserName(String userName);

	public int findIsExist(String userName);

	public int insertUser(User user);

	public String findEmailByUserName(String userName);

	public int updatePassword(User user);  

}
