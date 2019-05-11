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

import com.bs.entity.Resume;
import com.bs.entity.User;
import com.bs.result.ResponseResult;
import com.bs.service.ResumeService;

/**
 * <p>ClassName: ResumeController</p>
 * <p>Description: [简历相关接口]</p> 
 * <p>2019年4月26日</p>
 */
@Controller
@RequestMapping("/resume")
public class ResumeController
{
	@Autowired
	private ResumeService resumeService;

	/**
	 * <p>Title: addResume</p>  
	 * <p>Description: [添加简历]</p> 
	 * @param resume
	 * @return ResponseResult
	 * @throws
	 */
	@PostMapping("/addResume")
	public @ResponseBody ResponseResult addResume(@Valid Resume resume) {
		String result;
		try {
			result = resumeService.addResume(resume);
		}catch(Exception e) {
			return ResponseResult.failAddMessage("输入有误，请重新输入!");
		}
		if("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}
	
	/**
	 * <p>Title: findResumeByCompany</p> 
	 * <p>Description: [根据条件查找牛人]</p> 
	 * @param resume request
	 *  @return ResponseResult 
	 *  @throws
	 */
	@GetMapping("/findResumeByCompany")
	public @ResponseBody ResponseResult findResumeByCompany(@Valid Resume resume, HttpServletRequest request)
	{
		String result = null;
		try
		{
			result = resumeService.findResume(resume,request);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if ("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}
	/**
	 * <p>Title: findResumeByUser</p> 
	 * <p>Description: [根据条件查找牛人]</p> 
	 * @param resume request
	 *  @return ResponseResult 
	 *  @throws
	 */
	@GetMapping("/findResumeByUser")
	public @ResponseBody ResponseResult findResumeByUser(@Valid Resume resume, HttpServletRequest request)
	{
		String result = null;
		try
		{
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user"); 
			resume.setUserId(user.getId());
			result = resumeService.findResume(resume,request);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if ("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}

	
	/**
	 * <p>Title: editResume</p> 
	 * <p>Description: [修改简历]</p> 
	 * @param resume
	 *  @return ResponseResult 
	 *  @throws
	 */
	@PostMapping("/editResume")
	public @ResponseBody ResponseResult editResume(@Valid Resume resume) {
		String result = null;
		try
		{
			result = resumeService.updateResume(resume);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if ("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}
}