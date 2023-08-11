package com.gamevh.dto;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountDTO {
	@Id
	private Integer id;

	private String username;

	private String password;

	private String fullname;

	private String email;

	private String photo;

	private Boolean status;

	private String role;
	
	private String type;
	
	private String accessToken;
}
