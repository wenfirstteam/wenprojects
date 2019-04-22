package com.bs.service;

import org.springframework.transaction.annotation.Transactional;

import com.bs.entity.User;
import com.bs.result.ResponseResult;
 
@Transactional
public interface UserService
{
	ResponseResult register(User user);

	ResponseResult login(User user);

	ResponseResult sendVerify(User user);  
 
	Boolean sendEmailById(Integer id);
}
