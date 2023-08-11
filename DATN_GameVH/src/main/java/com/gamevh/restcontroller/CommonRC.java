package com.gamevh.restcontroller;

import com.gamevh.service.CommonService;
import jakarta.annotation.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/common")
public class CommonRC {
    @Resource
    private CommonService commonService;

    @GetMapping("")
    public ResponseEntity<?> getAllTotalRecord(){
        return ResponseEntity.ok(commonService.getAllTotalRecord());
    }

    @GetMapping("/getAllDataChart")
    public ResponseEntity<?> getAllDataChart(){
        return ResponseEntity.ok(commonService.getAllDataChart());
    }
}
