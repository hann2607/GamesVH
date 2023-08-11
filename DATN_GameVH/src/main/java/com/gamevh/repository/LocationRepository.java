package com.gamevh.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gamevh.entities.Location;

public interface LocationRepository extends JpaRepository<Location, Integer>{
	List<Location> findByAccountUsername(String username);
}
