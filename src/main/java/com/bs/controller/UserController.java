package com.bs.controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	            mMessageHelper.setTo("1240388310@qq.com");//收件人邮箱
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
