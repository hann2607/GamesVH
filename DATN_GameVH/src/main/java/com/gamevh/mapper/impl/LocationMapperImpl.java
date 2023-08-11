package com.gamevh.mapper.impl;

import javax.annotation.processing.Generated;

import org.springframework.stereotype.Service;

import com.gamevh.dto.LocationDTO;
import com.gamevh.entities.Location;
import com.gamevh.mapper.LocationMapper;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-07-24T10:00:16+0700",
    comments = "version: 1.5.5.Final, compiler: Eclipse JDT (IDE) 1.4.300.v20221108-0856, environment: Java 18.0.2.1 (Oracle Corporation)"
)
@Service
public class LocationMapperImpl implements LocationMapper {

    @Override
    public LocationDTO modelToDto(Location location) {
        if ( location == null ) {
            return null;
        }

        LocationDTO locationDTO = new LocationDTO();

        locationDTO.setAddress( location.getAddress() );
        locationDTO.setAddressDefault( location.getAddressDefault() );
        locationDTO.setProvince( location.getProvince() );
        locationDTO.setDistrict( location.getDistrict() );
        locationDTO.setId( location.getId() );
        locationDTO.setPhone( location.getPhone() );
        locationDTO.setType( location.getType() );
        locationDTO.setWard( location.getWard() );

        return locationDTO;
    }

    @Override
    public Location dtoToModel(LocationDTO locationDTO) {
        if ( locationDTO == null ) {
            return null;
        }

        Location location = new Location();

        location.setAddress( locationDTO.getAddress() );
        location.setAddressDefault( locationDTO.getAddressDefault() );
        location.setProvince( locationDTO.getProvince() );
        location.setDistrict( locationDTO.getDistrict() );
        location.setId( locationDTO.getId() );
        location.setPhone( locationDTO.getPhone() );
        location.setType( locationDTO.getType() );
        location.setWard( locationDTO.getWard() );

        return location;
    }
}
