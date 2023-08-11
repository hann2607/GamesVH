package com.gamevh.mapper;

import org.mapstruct.Mapper;

import com.gamevh.dto.AccountDTO;
import com.gamevh.dto.LocationDTO;
import com.gamevh.entities.Account;
import com.gamevh.entities.Location;

@Mapper
public interface LocationMapper {
	
	LocationDTO modelToDto(Location location);
	
	Location dtoToModel (LocationDTO locationDTO);
	
}
