package com.bs.service;

import javax.servlet.http.HttpServletRequest;

import com.bs.entity.News;
/**
 * <p>ClassName: NewsService</p>
 * <p>Description: [新闻相关功能]</p> 
 * <p>2019年4月26日</p>
 */
public interface NewsService
{
	/**
	 * <p>Title: addNews</p>  
	 * <p>Description: [添加新闻]</p> 
	 * @param news
	 * @return String
	 * @throws
	 */
	String addNews(News news);
	/**
	 * <p>Title: deleteNews</p>  
	 * <p>Description: [删除新闻]</p> 
	 * @param news
	 * @return String
	 * @throws
	 */
	String deleteNews(Integer id);
	/**
	 * <p>Title: updateNews</p>  
	 * <p>Description: [修改新闻]</p> 
	 * @param news
	 * @return String
	 * @throws
	 */
	String updateNews(News news);
	/**
	 * <p>Title: findNews</p>  
	 * <p>Description: [查找新闻]</p> 
	 * @param news
	 * @return String
	 * @throws
	 */
	String findNews(News news, HttpServletRequest request);
}
