package com.gamevh.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FeedbackWebsiteDTO {

    private Integer id;
	
	private String content;
	
    private LocalDateTime createDate;
    
    private String username;
    
    private String fullname;
}
