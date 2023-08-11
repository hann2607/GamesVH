package com.gamevh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamevh.entities.Location;
import com.gamevh.repository.LocationRepository;
import com.gamevh.service.LocationService;

@Service
public class LocationServiceImpl implements LocationService{

	@Autowired
	LocationRepository locationRepository;
	
	@Override
	public List<Location> findByAccountUsername(String username) {
		return locationRepository.findByAccountUsername(username);
	}

	@Override
	public Location findById(Integer locationId) {
		return locationRepository.findById(locationId).get();
	}

	@Override
	public Location createOrUpdateLocation(Location location) {
		return locationRepository.save(location);
	}

}
