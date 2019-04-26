package com.bs.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;

import com.bs.entity.User;
import com.bs.result.ResponseResult;
/**
 * <p>ClassName: UserService</p>
 * <p>Description: [用户相关功能]</p> 
 * <p>2019年4月26日</p>
 */
@Transactional
public interface UserService
{
	/**
	 * <p>Title: register</p>  
	 * <p>Description: [注册用户]</p> 
	 * @param user
	 * @return ResponseResult
	 * @throws
	 */
	ResponseResult register(User user);

	/**
	 * <p>Title: login</p>  
	 * <p>Description: [用户登录]</p> 
	 * @param user,request
	 * @return ResponseResult
	 * @throws
	 */
	ResponseResult login(User user, HttpServletRequest request);

	/**
	 * <p>Title: sendEmailById</p>  
	 * <p>Description: [发送邮件]</p> 
	 * @param user
	 * @return String
	 * @throws
	 */
	String sendEmailById(User user);

	/**
	 * <p>Title: updatePwd</p>  
	 * <p>Description: [更新密码]</p> 
	 * @param user
	 * @return boolean
	 * @throws
	 */
	boolean updatePwd(User user);
}
