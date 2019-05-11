package com.bs.mapper;

import java.util.List;

import com.bs.entity.Resume;

public interface ResumeMapper
{

	int addResume(Resume resume);

	List<Resume> findResume(Resume resume);  
	
	int updateResume(Resume resume);

}
