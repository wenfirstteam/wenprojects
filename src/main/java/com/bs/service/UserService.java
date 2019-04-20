package com.bs.service;

import com.bs.entity.User;

public interface UserService
{

	User findPwdByUserName(String userName);

	boolean findIsExist(String userName);

	int insertUser(User user);

	String findEmailByUserName(String userName);

	int updatePassword(User user); 
 
}
