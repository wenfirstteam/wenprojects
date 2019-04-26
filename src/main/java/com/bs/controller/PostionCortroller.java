package com.bs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * <p>ClassName: PostionCortroller</p>
 * <p>Description: [职位相关接口]</p> 
 * <p>2019年4月26日</p>
 */
@Controller
@RequestMapping("/position")
public class PostionCortroller
{

	/**
	 * <p>Title: addIntroduction</p>  
	 * <p>Description: [添加公司简介]</p> 
	 * @param introduction
	 * @return ResponseResult
	 * @throws
	 */
	@PostMapping()
	public @ResponseBody ResponseBody addPosition() {
		return null;
	}
}
