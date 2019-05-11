package com.bs.service;

import javax.servlet.http.HttpServletRequest;

import com.bs.entity.Position;

/**
 * <p>ClassName: PositionServicce</p>
 * <p>Description: [职位相关功能]</p> 
 * <p>2019年4月26日</p>
 */
public interface PositionService
{
	String addPosition(Position position);

	String findPosition(Position position, HttpServletRequest request);

	String deletePosition(Integer id);

	String updatePosition(Position position);    
}
