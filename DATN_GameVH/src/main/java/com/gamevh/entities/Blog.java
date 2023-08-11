package com.gamevh.entities;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "blog", indexes = { @Index(name = "blog_Title_IX", columnList = "Title", unique = false) })
public class Blog implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false, precision = 10)
	private Integer id;

	@Column(name = "Title", unique = false, nullable = false, length = 255)
	private String title;

	@Column(name = "Content", nullable = false, columnDefinition = "LONGTEXT")
	private String content;

	@Column(name = "Image", nullable = true)
	private String image;

	@Column(name = "create_date", nullable = false)
	private LocalDate createDate;

	@Column(name = "Status", nullable = false, length = 1)
	private Integer status;

	@Transient
	private int commentCount;

	public int getCommentCount() {
		if (comment != null) {
			int count = 0;
			for (Comment c : comment) {
				if (c.getStatus() != 0) {
					count++;
				}
			}
			return count;
		}
		return 0;
	}

	@ManyToOne(optional = false)
	@JoinColumn(name = "account_id", nullable = false)
	private Account account;

	@JsonIgnore
	@OneToMany(mappedBy = "blog")
	private List<Comment> comment;

}
