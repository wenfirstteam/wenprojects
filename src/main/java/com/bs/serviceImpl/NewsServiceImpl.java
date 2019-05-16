package com.bs.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.entity.News;
import com.bs.mapper.NewsMapper;
import com.bs.service.NewsService;
/**
 * <p>ClassName: NewsServiceImpl</p>
 * <p>Description: [新闻相关功能实现]</p> 
 * <p>2019年4月26日</p>
 */
@Service
public class NewsServiceImpl implements NewsService
{

	@Autowired
	private NewsMapper newsMapper;
	@Override
	public String addNews(News news)
	{
		int result = newsMapper.addNews(news);
		if(result == 1)
			return "";
		return "添加失败！";
	}
	@Override
	public String deleteNews(Integer id)
	{
		int result = newsMapper.deleteNews(id);
		if(result == 1)
			return "";
		return "删除失败！";
	}
	@Override
	public String updateNews(News news)
	{
		if(news.getFlag()!=null&&news.getFlag() == 0)
		{
			News news1 = new News();
			news1.setFlag(0);
			List<News> count = newsMapper.findNews(news1);
			if(count.size()==3) {
				return "最多发布三条！";
			}
		}
		int result = newsMapper.updateNews(news);
		if(result == 1)
			return "";
		return "修改失败！";
	}
	@Override
	public String findNews(News news, HttpServletRequest request)
	{
		List<News> newsList = null;
		try {
			newsList = newsMapper.findNews(news);
			HttpSession session = request.getSession();
			session.setAttribute("newsList", newsList); 
		}catch(Exception e) {
			e.printStackTrace();
			return "查询失败！";
		}
		return "";
	}

}
