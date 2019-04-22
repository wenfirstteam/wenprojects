package com.bs.mapper;

import com.bs.entity.User;

public interface UserMapper
{

	public User findPwdByUserName(String userName);

	public int findIsExist(User user);

	public int insertUser(User user);

	public User findEmailByUserName(String userName);

	public int updatePassword(User user);  

}
