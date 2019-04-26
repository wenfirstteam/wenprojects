package com.bs.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.entity.Introduction;
import com.bs.mapper.IntroductionMapper;
import com.bs.service.IntroductionService;
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

}
