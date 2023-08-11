package com.gamevh.mapper;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.gamevh.dto.RegisterAccountDTO;
import com.gamevh.dto.UpdateAccountDTO;
import com.gamevh.entities.Account;
import com.gamevh.entities.Authority;
import com.gamevh.entities.Role;
import com.gamevh.handle.CustomException;
import com.gamevh.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
public class AccountChangeMapper {
    @Autowired
    RoleRepository roleDAO;


    public Account mapRegisterAccountToAccount(RegisterAccountDTO registerAccountDTO) throws CustomException {
        Account account = new Account();
        account.setFullname(registerAccountDTO.getFullName());
        account.setStatus(registerAccountDTO.getStatus());
        account.setEmail(registerAccountDTO.getEmail());
        account.setUsername(registerAccountDTO.getUsername());
        // Encrypt mật khẩu mới
        account.setPassword(new BCryptPasswordEncoder().encode(registerAccountDTO.getPassword()));
        account.setPhoto("");
        account.setBlog(new ArrayList<>());
        account.setComment(new ArrayList<>());
        account.setFavorite(new ArrayList<>());
        account.setFeedback(new ArrayList<>());
        account.setLocation(new ArrayList<>());
        account.setCouponOwner(new ArrayList<>());
        account.setOrderData(new ArrayList<>());
        List<Authority> authorities = new ArrayList<>();
        for (String roleId : registerAccountDTO.getRoleIds()) {
            Role role = roleDAO.findById(roleId)
                    .orElseThrow(() -> new CustomException("Không tìm thấy Role với id " + roleId, HttpStatus.NOT_FOUND));
            Authority authority = new Authority();
            authority.setAccount(account);
            authority.setRole(role);
            authorities.add(authority);
        }
        account.setAuthority(authorities);

        return account;
    }

    public RegisterAccountDTO parseRegisterAccountDTOFromJSON(String reisterAccountJSONString) throws CustomException {
        RegisterAccountDTO registerAccountDTO;
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            registerAccountDTO = objectMapper.readValue(reisterAccountJSONString, RegisterAccountDTO.class);
        } catch (IOException err) {
            throw new CustomException(err.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return registerAccountDTO;
    }

    public UpdateAccountDTO parseUpdateAccountDTOFromJSON(String updateAccountJSON) throws CustomException {
        UpdateAccountDTO registerAccountDTO;
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            registerAccountDTO = objectMapper.readValue(updateAccountJSON, UpdateAccountDTO.class);
        } catch (IOException err) {
            throw new CustomException(err.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return registerAccountDTO;
    }
}

