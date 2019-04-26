package com.bs.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.entity.Resume;
import com.bs.mapper.ResumeMapper;
import com.bs.service.ResumeService;

/**
 * <p>ClassName: ResumeServiceImpl</p>
 * <p>Description: [简历相关功能实现]</p> 
 * <p>2019年4月26日</p>
 */
@Service
public class ResumeServiceImpl implements ResumeService
{
	@Autowired
	private ResumeMapper resumeMapper;

	@Override
	public String addResume(Resume resume)
	{
		return resumeMapper.addResume(resume) == 1 ? "" : "提交失败！";
	}

}
