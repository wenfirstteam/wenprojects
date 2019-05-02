package com.bs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
/**
 * <p>ClassName: UserController</p>
 * <p>Description: [用户相关接口]</p> 
 * <p>2019年4月26日</p>
 */
@Slf4j
@Controller
@RequestMapping("/user")
public class UserController
{
	@Autowired
	private UserService userService;

	/**
	 * <p>Title: login</p>  
	 * <p>Description: [用户登录]</p> 
	 * @param user,request
	 * @return ResponseResult
	 * @throws
	 */
	@PostMapping("/login")
	public @ResponseBody ResponseResult login(@Valid User user,HttpServletRequest request)
	{
		return userService.login(user,request);
	}
	
	
	/**
	 * <p>Title: register</p>  
	 * <p>Description: [用户注册]</p> 
	 * @param user
	 * @return ResponseResult
	 * @throws
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
	 * <p>Title: sendEmail</p>  
	 * <p>Description: [发送邮件]</p> 
	 * @param user
	 * @return ResponseResult
	 * @throws
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
	 * <p>Title: updataPwd</p>  
	 * <p>Description: [更新密码]</p> 
	 * @param user
	 * @return ResponseResult
	 * @throws
	 */
	@PostMapping("/updataPwd")
	public @ResponseBody ResponseResult updataPwd(@Valid User user) {
		boolean result = userService.updatePwd(user);
		if(result)
			return ResponseResult.success();
		return ResponseResult.fail();
	}
	
	/**
	 * <p>Title: findLogin</p>  
	 * <p>Description: [查询是否登录]</p> 
	 * @param request
	 * @return ResponseResult
	 * @throws
	 */
	@GetMapping("/isLogin")
	public @ResponseBody ResponseResult findLogin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null)
			return ResponseResult.successAddData(session.getAttribute("user"));
		return ResponseResult.fail();
	}
	
	/**
	 * <p>Title: logOut</p>  
	 * <p>Description: [退出登录]</p> 
	 * @param request
	 * @return ResponseResult
	 * @throws
	 */
	@GetMapping("/logOut")
	public @ResponseBody ResponseResult logOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return ResponseResult.success();
	}
}
