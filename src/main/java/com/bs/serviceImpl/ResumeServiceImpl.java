package com.bs.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.entity.Resume;
import com.bs.mapper.ResumeMapper;
import com.bs.service.ResumeService;
@Service
public class ResumeServiceImpl implements ResumeService
{
	@Autowired
	private ResumeMapper resumeMapper;

	@Override
	public String addResume(Resume resume)
	{
		int result = resumeMapper.addResume(resume);
		if(result == 1)
			return "";
		return "提交失败！";
	}

}
