package com.gamevh.service;

import java.util.List;

import com.gamevh.entities.Location;

public interface LocationService {
	List<Location> findByAccountUsername(String username);
	
	Location findById(Integer locationId);
	
	Location createOrUpdateLocation(Location location);
}
