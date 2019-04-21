package com.bs.util;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.result.ResponseResult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class EmailUtil {
	
	@Autowired
	private JavaMailSenderImpl javaMailSender;
	
	/**
	 * @param toEmail 要发送到的邮箱地址
	 * @param subject 邮箱主题
	 * @param subject 邮箱内容
	 * 发送邮件
	 * @return
	 */
	public Boolean sendEmail(String toEmail, String subject, String text) {
	        MimeMessage mMessage=javaMailSender.createMimeMessage();//创建邮件对象
	        MimeMessageHelper mMessageHelper;
	        try {
	            mMessageHelper=new MimeMessageHelper(mMessage,true);
	            mMessageHelper.setFrom(javaMailSender.getUsername());//发件人邮箱
	            mMessageHelper.setTo(toEmail);//收件人邮箱
	            mMessageHelper.setSubject(subject);//邮件的主题
	            mMessageHelper.setText(text);//邮件的文本内容，true表示文本以html格式打开
	            javaMailSender.send(mMessage);//发送邮件
	        } catch (MessagingException e) {
	            log.info("email send failed, message: " + e.getMessage());
	            return false;
	        } 
	        log.info("email send success");
	        return true;
	    }
}
