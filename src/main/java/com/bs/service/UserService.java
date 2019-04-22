package com.bs.service;

import com.bs.entity.User;
import com.bs.result.ResponseResult;
 
public interface UserService
{
	ResponseResult register(User user);

	ResponseResult login(User user);

	ResponseResult sendVerify(User user);  
 
}
