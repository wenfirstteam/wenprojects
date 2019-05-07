package com.bs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.entity.Position;
import com.bs.entity.User;
import com.bs.result.ResponseResult;
import com.bs.service.PositionService;

/**
 * <p>
 * ClassName: PostionCortroller
 * </p>
 * <p>
 * Description: [职位相关接口]
 * </p>
 * <p>
 * 2019年4月26日
 * </p>
 */
@Controller
@RequestMapping("/position")
public class PostionCortroller
{

	@Autowired
	private PositionService positionServicce;

	/**
	 * <p>Title: addPosition</p> 
	 * <p>Description: [添加职位]</p>
	 * @param position 
	 * @return ResponseResult
	 * @throws
	 */
	@PostMapping("/addPosition")
	public @ResponseBody ResponseResult addPosition(@Valid Position position)
	{
		String result;
		try
		{
			result = positionServicce.addPosition(position);
		} catch (Exception e)
		{
			return ResponseResult.failAddMessage("输入有误，请重新输入!");
		}
		if ("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}

	/**
	 * <p>Title: findPositionFromCompany</p> 
	 * <p>Description: [根据公司查找职位]</p> 
	 * @param position request
	 *  @return ResponseResult 
	 *  @throws
	 */
	@GetMapping("/findPositionFromCompany")
	public @ResponseBody ResponseResult findPositionFromCompany(@Valid Position position, HttpServletRequest request)
	{
		String result = null;
		try
		{
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user"); 
			position.setUserId(user.getId());
			result = positionServicce.findPosition(position,request);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if ("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}
	
	/**
	 * <p>Title: findPosition</p> 
	 * <p>Description: [根据条件查找职位]</p> 
	 * @param position request
	 *  @return ResponseResult 
	 *  @throws
	 */
	@GetMapping("/findPositionFormUser")
	public @ResponseBody ResponseResult findPositionFormUser(@Valid Position position, HttpServletRequest request)
	{
		String result = null;
		try
		{
			result = positionServicce.findPosition(position,request);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if ("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}
	
	/**
	 * <p>Title: deletePosition</p> 
	 * <p>Description: [取消职位]</p> 
	 * @param position request
	 *  @return ResponseResult 
	 *  @throws
	 */
	@GetMapping("/deletePosition")
	public @ResponseBody ResponseResult deletePosition(@RequestParam("id") Integer id)
	{
		String result = null;
		try
		{
			result = positionServicce.deletePosition(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if ("".equals(result))
			return ResponseResult.success();
		return ResponseResult.failAddMessage(result);
	}
}