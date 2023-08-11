package com.gamevh.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateAccountDTO {
    private String username;
    private String password;
    private String fullName;
    private String email;
    private Boolean status;
}
