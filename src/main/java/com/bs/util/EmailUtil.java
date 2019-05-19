package com.bs.util;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
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
	public Map<String,String> sendEmail(String toEmail, String subject, String text) {
	        MimeMessage mMessage=javaMailSender.createMimeMessage();//创建邮件对象
	        MimeMessageHelper mMessageHelper;
	        Map<String,String> result = new HashMap<String,String>();
	        try {
	            mMessageHelper=new MimeMessageHelper(mMessage,true);
	            mMessageHelper.setFrom(javaMailSender.getUsername());//发件人邮箱
	            mMessageHelper.setTo(toEmail);//收件人邮箱
	            mMessageHelper.setSubject(subject);//邮件的主题
	            mMessageHelper.setText(text);//邮件的文本内容，true表示文本以html格式打开
	            javaMailSender.send(mMessage);//发送邮件
	        } catch (MessagingException e) {
	        	result.put("sendResult", "fail"); 
	            log.info("email send failed, message: " + e.getMessage());
	            return result;
	        } 
	        log.info("email send success");
	        result.put("sendResult", "success");
			return result;
	    }
}
