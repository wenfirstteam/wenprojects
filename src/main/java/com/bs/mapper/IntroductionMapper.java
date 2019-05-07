package com.bs.mapper;

import java.util.List;

import com.bs.entity.Introduction;
import com.bs.entity.Position;

public interface IntroductionMapper
{

	int addIntroduce(Introduction introduction); 
	
	Integer updateIntroduce(Introduction introduction);

	List<Position> findIntroduce(Introduction introduction);

}
