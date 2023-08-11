package com.gamevh.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RegisterAccountDTO {
    private String username;
    private String password;
    private String fullName;
    private String email;
    private Boolean status;
    private List<String> roleIds;
}
