package com.bs.service;

import com.bs.entity.Introduction;
/**
 * <p>ClassName: IntroductionService</p>
 * <p>Description: [公司简介相关功能]</p> 
 * <p>2019年4月26日</p>
 */
public interface IntroductionService
{

	/**
	 * <p>Title: addIntroduce</p>  
	 * <p>Description: [添加公司简介]</p> 
	 * @param introduction
	 * @return String
	 * @throws
	 */
	String addIntroduce(Introduction introduction); 

}
