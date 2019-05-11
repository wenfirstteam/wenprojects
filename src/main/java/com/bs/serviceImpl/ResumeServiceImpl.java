package com.bs.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

	@Override
	public String findResume(Resume resume, HttpServletRequest request)
	{
		List<Resume> resumeList = null;
		try {
			resumeList = resumeMapper.findResume(resume);
			HttpSession session = request.getSession();
			session.setAttribute("resumeList", resumeList); 
		}catch(Exception e) {
			e.printStackTrace();
			return "查询失败！";
		}
		return "";
	}

	@Override
	public String updateResume(Resume resume)
	{
		int result = resumeMapper.updateResume(resume);
		if(result == 1)
			return "";
		return "提交失败！";
	}

}