package com.gamevh.entities;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "category", indexes = {
		@Index(name = "category_category_id_IX", columnList = "category_id", unique = true) })
public class Category implements Serializable {
	@Id()
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id", unique=true, nullable=false, precision=10)
    private Integer id;

    @Column(name="category_id", unique=true, length=10)
    private String categoryId;

    @Column(name="Name", length=255)
    private String name;

    @Column(name="Type", nullable=false, length=8)
    private String type;

    @JsonIgnore
    @OneToMany(mappedBy="category")
    private List<Product> product;
}
