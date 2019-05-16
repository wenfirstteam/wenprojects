package com.bs.mapper;

import java.util.List;

import com.bs.entity.News;

public interface NewsMapper
{

	int addNews(News news);

	int deleteNews(Integer id);

	int updateNews(News news);

	List<News> findNews(News news);

}
