package com.bs.controller;

import java.io.IOException;

import javax.validation.Valid;
import javax.validation.constraints.Min;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.entity.User;
import com.bs.result.ResponseResult;
import com.bs.service.UserService;
import com.bs.util.EmailUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController
{
	@Autowired
	private UserService userService;

	@Autowired
	private EmailUtil emailUtil;
	
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
			return ResponseResult.failAddMessage("用户名为3~20位！");
		if(user.getPassWord().length() < 6)
			return ResponseResult.failAddMessage("密码为6~20位！");
		if(!user.getEmail().contains("@"))
			return ResponseResult.failAddMessage("邮箱格式不正确！");
		return userService.register(user);
	}
	
	
	/**
	 * 发送验证码 
	 * @param request
	 * @param response
	 * @throws IOException
	 * 
	 */
	@PostMapping("/verify")
	public @ResponseBody ResponseResult resetPwd(@Valid User user)
	{
		return userService.sendVerify(user);
	}
	
	
	/**
	 * 发送邮件
	 * @return
	 */
	@GetMapping("/email")
	@ResponseBody
	public ResponseResult sendEmail(@Min(0) Integer id) {
	    return ResponseResult.isSuccess(userService.sendEmailById(id));
	}
}
