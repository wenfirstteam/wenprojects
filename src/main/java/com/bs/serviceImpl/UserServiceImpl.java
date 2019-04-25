package com.bs.serviceImpl;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	@Autowired
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
		if (result == 1) {
			User resultUser = userMapper.findUserByUserName(user.getUserName());
			return ResponseResult.successAddData(resultUser);
		}
		return ResponseResult.failAddMessage("注册失败！");
	}

	@Override
	public ResponseResult login(User user, HttpServletRequest request)
	{
		User userByName = userMapper.findUserByUserName(user.getUserName());
		if (userByName == null) 
		{
			return ResponseResult.failAddMessage("用户名不存在！");
		}
		if (!userByName.getPassWord().equals(user.getPassWord()))
		{
			return ResponseResult.failAddMessage("密码错误！");
		}
		HttpSession session = request.getSession();
		session.setAttribute("username", user.getUserName());
		return ResponseResult.successAddData(userByName); 
	}

	@Override
	public String sendEmailById(User user) {
		User u = userMapper.findUserByUserName(user.getUserName());
		if(u == null)
			return "用户名输入有误，请重新输入！";
		if(!u.getEmail().equals(user.getEmail()))
			return "邮箱输入有误，请重新输入！";
		//生成验证码
		String verify = "";
		Random rd = new Random();
		for(int i = 0;i<6;i++) {
			verify += rd.nextInt(10);
		}
		//這裡是有可能發送失敗的
		Map<String,String> result = emailUtil.sendEmail(user.getEmail(), "汉中人才网", "您正在修改密码，验证码为:" + verify);
		if("fail".equals(result.get("senResult")))
			return "验证码发送失败，请稍后再试！";
		return verify;
	}

	@Override
	public boolean updatePwd(User user)
	{
		int result = userMapper.updatePwd(user);
		return result > 0;
	}

}
