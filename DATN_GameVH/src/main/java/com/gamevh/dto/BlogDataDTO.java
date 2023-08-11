package com.gamevh.dto;

import java.time.LocalDate;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BlogDataDTO {
	@Id
	private Integer id;
    private String title;
    private String content;
    private String image;
    private LocalDate createDate;
    private String username;
    private Integer status;
}
