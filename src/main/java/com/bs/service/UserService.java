package com.bs.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;

import com.bs.entity.User;
import com.bs.result.ResponseResult;
 
@Transactional
public interface UserService
{
	ResponseResult register(User user);

	ResponseResult login(User user, HttpServletRequest request);

	String sendEmailById(User user);

	boolean updatePwd(User user);
}
