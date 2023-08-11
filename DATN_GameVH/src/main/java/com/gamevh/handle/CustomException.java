package com.gamevh.handle;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.http.HttpStatus;

@AllArgsConstructor
@Data
public class CustomException extends Throwable {
    private String message;
    private HttpStatus status;
}
