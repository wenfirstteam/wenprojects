package com.bs.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.entity.Resume;
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
}