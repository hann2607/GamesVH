package com.gamevh.restcontroller;

import com.gamevh.entities.Account;
import com.gamevh.request.UserLoginRequest;
import com.gamevh.service.AccountService;
import com.gamevh.service.EncryptionService;
import jakarta.annotation.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.util.StringUtils;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/login")
public class LoginRC {
    @Resource
    private EncryptionService encryptionService;

    @Resource
    private AccountService accountService;

    @PostMapping
    public ResponseEntity<?> login(@RequestBody UserLoginRequest user) {
        if(StringUtils.isEmpty(user.getUserName())){
            return ResponseEntity.badRequest().build();
        }
        Account account = accountService.findByUsername(user.getUserName());
        if(account == null){
            return ResponseEntity.badRequest().build();
        }
        if(account.getAuthority().stream().anyMatch(s->(s.getRole().getName().equals("STAF") || s.getRole().getName().equals("DIRE")))){
            return ResponseEntity.badRequest().build();
        }
        if(!encryptionService.compare(user.getPassword(),account.getPassword())){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().body(account);
    }
}
