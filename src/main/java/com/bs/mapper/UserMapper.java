package com.bs.mapper;

import org.apache.ibatis.annotations.Param;

import com.bs.entity.User;

public interface UserMapper
{

	public User findPwdByUserName(String userName);

	public int findIsExist(User user);

	public int insertUser(User user);

	public User findEmailByUserName(String userName);

	public int updatePassword(User user);  
	
	public User findUser(@Param("id") Integer id);

}
