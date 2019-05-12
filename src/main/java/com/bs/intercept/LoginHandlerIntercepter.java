package com.bs.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bs.entity.User;

public class LoginHandlerIntercepter implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object arg2) throws Exception {
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null) {
                // 获取到项目名，以便下面进行重定向
                String projUrl = req.getContextPath();
             	// 如果是 ajax 请求，则设置 session 状态 、CONTEXTPATH 的路径值
             	// 如果是ajax请求响应头会有，x-requested-with
                if (req.getHeader("x-requested-with") != null && req.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
                	res.setHeader("SESSIONSTATUS", "TIMEOUT");
                	res.setHeader("CONTEXTPATH", projUrl+"/jsp/login.jsp");
                	res.setStatus(HttpServletResponse.SC_FORBIDDEN); 
                }else{
                    // 如果不是 ajax 请求，则直接跳转即可
                	res.sendRedirect(projUrl+"/jsp/login.jsp");
                }
                return false;
            }
            return true;
	}
}
