package com.bs.controller;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
//	@Autowired
//    private JavaMailSender javaMailSender;
//
//    @Value("${mail.smtp.username}")
//    private String emailFrom;

//    @Value("${mail.smtp.tousername}")
//    private String toEmail;

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

	@Autowired
	private JavaMailSenderImpl javaMailSender;
	
	/**
	 * 发送邮件
	 * @return
	 */
	@GetMapping("/email")
	@ResponseBody
	public ResponseResult sendEmail(String id) {
	        MimeMessage mMessage=javaMailSender.createMimeMessage();//创建邮件对象
	        MimeMessageHelper mMessageHelper;
	        try {
	            mMessageHelper=new MimeMessageHelper(mMessage,true);
	            mMessageHelper.setFrom(javaMailSender.getUsername());//发件人邮箱
	            mMessageHelper.setTo("359175524@qq.com");//收件人邮箱
	            mMessageHelper.setSubject("Spring的邮件发送");//邮件的主题
	            mMessageHelper.setText("aaa");//邮件的文本内容，true表示文本以html格式打开
	            javaMailSender.send(mMessage);//发送邮件
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        } 
	        log.info("send success");
	        return ResponseResult.successAddData("send success");
	    }
}
