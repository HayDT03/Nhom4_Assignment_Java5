package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.entity.Product;
@Repository
public interface  ProductDAO extends JpaRepository<Product, String> {

	@Query("SELECT p FROM Product p WHERE p.quantity > 0")
	List<Product> findAll();
	
	@Query("UPDATE Product p SET p.quantity = 0 WHERE p.id =?1")
	Object entity(Product id);
}
