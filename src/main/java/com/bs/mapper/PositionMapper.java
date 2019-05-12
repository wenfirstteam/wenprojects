package com.bs.mapper;

import java.util.List;
import java.util.Map;

import com.bs.entity.Position;

public interface PositionMapper
{

	int addPosition(Position position);

	List<Position> findIntroduce(Position position);

	int deletePosition(Integer id);  
	
	int updatePosition(Position position);

	Map<Object, Object> findPositionInfo(Position position); 

}
