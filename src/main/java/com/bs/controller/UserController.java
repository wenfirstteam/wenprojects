package com.bs.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.entity.User;
import com.bs.result.ResponseResult;
import com.bs.service.UserService;

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
	@PostMapping(value = "/login")
	public ResponseResult login(@PathVariable User user)
	{
		User userByName = userService.findPwdByUserName(user.getUserName());
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
	/**
	 * 
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * 
	 */
	@RequestMapping("/resetPwd")
	public void register(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userName = request.getParameter("username");
		boolean isExist = userService.findIsExist(userName);
		if (!isExist)
		{
			response.getWriter().print("<script language='javascript'>alert('�û��������ڣ����������룡')</script>");
			response.setHeader("refresh", "1;" + request.getContextPath() + "/jsp/reset_pwd.jsp");
		} else
		{
			String email = userService.findEmailByUserName(userName);
			String inputEmail = request.getParameter("email");
			if (!email.equals(inputEmail))
			{
				response.getWriter().print("<script language='javascript'>alert('���䲻��ȷ�����������룡')</script>");
				response.setHeader("refresh", "1;" + request.getContextPath() + "/jsp/reset_pwd.jsp");
			} else
			{

				// ��֤���߼�

				String pwd = request.getParameter("password");

				User user = new User();
				user.setUserName(userName);
				user.setPassWord(pwd);
				int result = userService.updatePassword(user);
				if (result == 1)
				{
					response.getWriter().print("<script language='javascript'>alert('�����޸ĳɹ���')</script>");
					response.setHeader("refresh", "1;" + request.getContextPath() + "/jsp/login.jsp");
				}
			}
		}
	}
}
