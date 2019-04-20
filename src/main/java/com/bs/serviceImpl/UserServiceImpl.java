package com.bs.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.entity.User;
import com.bs.mapper.UserMapper;
import com.bs.service.UserService;
@Service
public class UserServiceImpl implements UserService
{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User findPwdByUserName(String userName)
	{
		// TODO Auto-generated method stub
		return userMapper.findPwdByUserName(userName);
	}
	
	@Override
	public boolean findIsExist(String userName)
	{
		// TODO Auto-generated method stub
		return userMapper.findIsExist(userName) > 0;
	}

	@Override
	public int insertUser(User user)
	{
		return userMapper.insertUser(user);
	}

	@Override
	public String findEmailByUserName(String userName)
	{
		return userMapper.findEmailByUserName(userName);
	}

	@Override
	public int updatePassword(User user)
	{
		// TODO Auto-generated method stub
		return userMapper.updatePassword(user);
	}

}
