package com.gamevh.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FeedbackDTO{
    private Integer id;
    private String content;
    private Boolean status;
    private Integer star;
    private LocalDateTime createDate;
}
