package com.bs.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.IOException;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.entity.User;
import com.bs.result.ResponseResult;
import com.bs.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController
{
	@Autowired
	private UserService userService;

    /**
	 * 登录
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@PostMapping("/login")
	public @ResponseBody ResponseResult login(@Valid User user)
	{
		return userService.login(user);
	}
	
	
	/**
	 * 注册
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@PostMapping("/register")
	public @ResponseBody ResponseResult register(@Valid User user)
	{
		//邮箱校验和长度这些在前端做，下面这个是邮箱的正则表达式，校验用正则
		//https://blog.csdn.net/u013033112/article/details/80278602
		if(user.getUserName().length() < 3)
			return ResponseResult.failAddMessage("用户名必须为3~20位！");
		if(user.getPassWord().length() < 6)
			return ResponseResult.failAddMessage("密码必须为6~20位！");
		if(!user.getEmail().contains("@"))
			return ResponseResult.failAddMessage("邮箱格式不正确！");
		return userService.register(user);
	}
	
	/**
	 * 发送邮件
	 * @return
	 */
	@GetMapping("/verify")
	@ResponseBody
	public ResponseResult sendEmail(@Valid User user) {
		String result = userService.sendEmailById(user);
		try {
			if((Integer)Integer.parseInt(result) instanceof Integer) {
				return ResponseResult.successAddData(result);
			}
		}catch(Exception e) {
			return ResponseResult.failAddMessage(result);
		}
		return ResponseResult.success();
	}
	/**
	 * 修改密码
	 * @return
	 */
	@PostMapping("/updataPwd")
	public @ResponseBody ResponseResult updataPwd(@Valid User user) {
		boolean result = userService.updatePwd(user);
		if(result)
			return ResponseResult.success();
		return ResponseResult.fail();
	}
}
