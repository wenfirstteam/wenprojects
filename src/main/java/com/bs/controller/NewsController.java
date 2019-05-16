package com.bs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.entity.News;
import com.bs.result.ResponseResult;
import com.bs.service.NewsService;
/**
 * <p>ClassName: NewsController</p>
 * <p>Description: [新闻相关接口]</p> 
 * <p>2019年4月26日</p>
 */
@Controller
@RequestMapping("/news")
public class NewsController
{
	@Autowired
	private NewsService newsService;

	/**
	 * <p>Title: addNews</p>  
	 * <p>Description: [添加新闻]</p> 
	 * @param news
	 * @return ResponseResult
	 * @throws
	 */
	@PostMapping("/addNews")
	public @ResponseBody ResponseResult addNews(@Valid News news )
	{
		String result;
		try {
			result = newsService.addNews(news);
		}catch(Exception e) {
			return ResponseResult.failAddMessage("输入有误，请重新输入!");
		}
		if("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}
	/**
	 * <p>Title: deleteNews</p>  
	 * <p>Description: [删除新闻]</p> 
	 * @param news
	 * @return ResponseResult
	 * @throws
	 */
	@GetMapping("/deleteNews")
	public @ResponseBody ResponseResult deleteNews(@RequestParam("id") Integer id)
	{
		String result = null;
		try {
			result = newsService.deleteNews(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}
	/**
	 * <p>Title: updateNews</p>  
	 * <p>Description: [修改新闻]</p> 
	 * @param news
	 * @return ResponseResult
	 * @throws
	 */
	@PostMapping("/updateNews")
	public @ResponseBody ResponseResult updateNews(@Valid News news )
	{
		String result = null;
		try {
			result = newsService.updateNews(news);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}
	/**
	 * <p>Title: findNews</p>  
	 * <p>Description: [查找新闻]</p> 
	 * @param news
	 * @return ResponseResult
	 * @throws
	 */
	@GetMapping("/findNews")
	public @ResponseBody ResponseResult findNews(@Valid News news,HttpServletRequest request)
	{
		String result = null;
		try {
			result = newsService.findNews(news,request);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}
}
