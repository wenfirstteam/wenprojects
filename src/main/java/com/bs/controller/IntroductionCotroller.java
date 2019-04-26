package com.bs.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.entity.Introduction;
import com.bs.result.ResponseResult;
import com.bs.service.IntroductionService;
/**
 * <p>ClassName: IntroductionCotroller</p>
 * <p>Description: [公司简介相关接口]</p> 
 * <p>2019年4月26日</p>
 */
@Controller
@RequestMapping("/introduction")
public class IntroductionCotroller
{
	@Autowired
	private IntroductionService introductionService;

	/**
	 * <p>Title: addIntroduction</p>  
	 * <p>Description: [添加公司简介]</p> 
	 * @param introduction
	 * @return ResponseResult
	 * @throws
	 */
	@PostMapping("/addIntroduction")
	public @ResponseBody ResponseResult addIntroduction(@Valid Introduction introduction )
	{
		String result;
		try {
			result = introductionService.addIntroduce(introduction);
		}catch(Exception e) {
			return ResponseResult.failAddMessage("输入有误，请重新输入!");
		}
		if("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}
}
