package com.bs.service;

import org.springframework.transaction.annotation.Transactional;

import com.bs.entity.Resume;

/**
 * <p>ClassName: ResumeService</p>
 * <p>Description: [简历相关功能]</p> 
 * <p>2019年4月26日</p>
 */
@Transactional(rollbackFor = Exception.class)
public interface ResumeService
{
	/**
	 * <p>Title: addResume</p>  
	 * <p>Description: [添加简历]</p> 
	 * @param resume
	 * @return String
	 * @throws
	 */
	String addResume(Resume resume);

}
