package com.gamevh.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BlogDTO {
    private Integer id;
    private String title;
    private String content;
    private String image;
    private LocalDate createDate;
    private String username;
    private Integer commentCount;
    private Integer status;
}
