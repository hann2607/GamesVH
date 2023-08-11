package com.gamevh.dto;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocationDTO {
	@Id
    private Integer id;
    private String address;
    private String province;
    private String district;
    private String ward;
    private String phone;
    private String type;
    private Boolean addressDefault;
}
