package com.bs.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.entity.Introduction;
import com.bs.entity.Position;
import com.bs.mapper.IntroductionMapper;
import com.bs.service.IntroductionService;
/**
 * <p>ClassName: IntroductionServiceImpl</p>
 * <p>Description: [公司简介相关功能实现]</p> 
 * <p>2019年4月26日</p>
 */
@Service
public class IntroductionServiceImpl implements IntroductionService
{
	@Autowired
	private IntroductionMapper introductionMapper;
	@Override
	public String addIntroduce(Introduction introduction)
	{
		int result = introductionMapper.addIntroduce(introduction);
		if(result == 1)
			return "";
		return "提交失败！";
	}
	
	@Override
	public Boolean updateIntroduce(String id, String icon) {
		Introduction introduction = new Introduction();
		introduction.setIcon(icon);
		introduction.setId(Integer.parseInt(id));
		return introductionMapper.updateIntroduce(introduction) != 0;
	}

	@Override
	public String findIntroduction(Introduction introduction, HttpServletRequest request)
	{
		List<Position> introductionList = null;
		try {
			introductionList = introductionMapper.findIntroduce(introduction);
			HttpSession session = request.getSession();
			session.setAttribute("introductionList", introductionList); 
		}catch(Exception e) {
			e.printStackTrace();
			return "查询失败！";
		}
		return "";
	}

	@Override
	public String updateIntroduction(Introduction introduction)
	{
		int result = introductionMapper.updateIntroduce(introduction);
		if(result == 1)
			return "";
		return "提交失败！";
	}

}
