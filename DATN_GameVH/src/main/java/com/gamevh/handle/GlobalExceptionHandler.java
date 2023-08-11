package com.gamevh.handle;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler
    public ResponseEntity<Map<String, String>> handleCustomException(CustomException e){
        Map<String, String> errorMessage = new HashMap<>();
        errorMessage.put("message", e.getMessage());
        return new ResponseEntity<>(errorMessage, e.getStatus());
    }
}
