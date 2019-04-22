package com.bs.serviceImpl;

import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.entity.User;
import com.bs.mapper.UserMapper;
import com.bs.result.ResponseResult;
import com.bs.service.UserService;
import com.bs.util.EmailUtil;

@Service
public class UserServiceImpl implements UserService
{

	@Autowired
	private UserMapper userMapper;
	
	private EmailUtil emailUtil;

	@Override
	public ResponseResult register(User user)
	{
		boolean isExist = userMapper.findIsExist(user) > 0;
		if (isExist)
		{
			return ResponseResult.failAddMessage("用户名已存在！");
		}
		int result = userMapper.insertUser(user);
		if (result == 1)
			return ResponseResult.success();
		return ResponseResult.failAddMessage("注册失败！");
	}

	@Override
	public ResponseResult login(User user)
	{
		User userByName = userMapper.findPwdByUserName(user.getUserName());
		if (userByName == null) 
		{
			return ResponseResult.failAddMessage("用户名不存在！");
		}
		if (!userByName.getPassWord().equals(user.getPassWord()))
		{
			return ResponseResult.failAddMessage("密码错误！");
		}
		return ResponseResult.success();
	}

	@Override
	public ResponseResult sendVerify(User user)
	{
		//根据账号查到的用户
		User u = userMapper.findEmailByUserName(user.getUserName());
		if(u == null)
			return ResponseResult.failAddMessage("用户名输入有误，请重新输入！");
		if(u.getEmail().equals(user.getEmail()))
			return ResponseResult.failAddMessage("邮箱输入有误，请重新输入！");
		//生成验证码
		String verify = "";
		Random rd = new Random();
		for(int i = 0;i<=6;i++)
			verify += rd.nextInt(10);
		//发送验证码
//		EmailUtil.sendEmail(user.getEmail(), "汉中人才网", "您正在修改密码，验证码为"+verify);
		//验证成功后
		return ResponseResult.successAddData(verify);
	}

	@Override
	public Boolean sendEmailById(Integer id) {
		User user = userMapper.findUser(id);
		if(user == null) {
			return false;
		}
		//生成验证码
		String verify = "";
		Random rd = new Random();
		for(int i = 0;i<=6;i++) {
			verify += rd.nextInt(10);
		}
		//這裡是有可能發送失敗的
		return emailUtil.sendEmail(user.getEmail(), "汉中人才网", "您正在修改密码，验证码为:" + verify);
	}

}
