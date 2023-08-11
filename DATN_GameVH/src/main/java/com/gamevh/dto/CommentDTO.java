package com.gamevh.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDTO {
    private Integer id;
    private Integer blogId;
    private String content;
    private Date createDate;
    private String username;
    private String avatarUser;
    private Integer status;
}
