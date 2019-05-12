package com.bs.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * <p>ClassName: PositionServiceImpl</p>
 * <p>Description: [职位相关功能实现]</p> 
 * <p>2019年4月26日</p>
 */

import com.bs.entity.Position;
import com.bs.mapper.PositionMapper;
import com.bs.service.PositionService;

@Service
public class PositionServiceImpl implements PositionService
{
	@Autowired
	private PositionMapper positionMapper;

	@Override
	public String addPosition(Position position)
	{
		int result = positionMapper.addPosition(position);
		if (result == 1)
			return "";
		return "提交失败！";
	}

	@Override
	public String findPosition(Position position, HttpServletRequest request)
	{
		List<Position> positionList = null;
		try {
			positionList = positionMapper.findIntroduce(position);
			HttpSession session = request.getSession();
			session.setAttribute("positionList", positionList); 
		}catch(Exception e) {
			e.printStackTrace();
			return "查询失败！";
		}
		return "";
	}

	@Override
	public String deletePosition(Integer id)
	{
		int result = positionMapper.deletePosition(id);
		if (result == 1)
			return "";
		return "取消失败！";
	}

	@Override
	public String updatePosition(Position position)
	{
		int result = positionMapper.updatePosition(position);
		if(result == 1)
			return "";
		return "提交失败！";
	}

	@Override
	public String findPositionInfo(Position position,HttpServletRequest request)
	{
		Map<Object,Object> positionMap;
		try {
			positionMap = positionMapper.findPositionInfo(position);
			HttpSession session = request.getSession();
			session.setAttribute("positionMap", positionMap); 
		}catch(Exception e) {
			e.printStackTrace();
			return "查看失败！";
		}
		return "";
	}

}
