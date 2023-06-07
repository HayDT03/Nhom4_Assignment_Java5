package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Products")
public class Product implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	String id;
	@ManyToOne
	@JoinColumn(name = "CategoryID")
	Category category;
	String name;
	Double price;
	Integer quantity;
	String description;
	String image;
	Integer like;
	Double author;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product")
	List<Cart> carts;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product")
	List<Favorite> favorites;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetails;
}