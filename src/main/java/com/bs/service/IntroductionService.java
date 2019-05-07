package com.bs.service;

import javax.servlet.http.HttpServletRequest;

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
	
	/**
	 * <p>Title: updateIntroduce</p>  
	 * <p>Description: [更新公司头像]</p> 
	 * @param id
	 * @param icon
	 * @return Boolean
	 * @throws
	 */
	Boolean updateIntroduce(String id, String icon);

	/**
	 * <p>Title: updateIntroduce</p>  
	 * <p>Description: [查询公司信息简介]</p> 
	 * @param introduction
	 * @param request
	 * @return String
	 * @throws
	 */
	String findIntroduction(Introduction introduction, HttpServletRequest request);

	/**
	 * <p>Title: updateIntroduce</p>  
	 * <p>Description: [修改司信息简介]</p> 
	 * @param introduction
	 * @param request
	 * @return String
	 * @throws
	 */
	String updateIntroduction(Introduction introduction);  

}
