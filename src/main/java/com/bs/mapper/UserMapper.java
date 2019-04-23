package com.bs.mapper;

import org.springframework.stereotype.Component;

import com.bs.entity.User;

@Component
public interface UserMapper
{

	public User findPwdByUserName(String userName);

	public int findIsExist(User user);

	public int insertUser(User user);

	public User findEmailByUserName(String userName);

	public int updatePwd(User user);  
	
}
