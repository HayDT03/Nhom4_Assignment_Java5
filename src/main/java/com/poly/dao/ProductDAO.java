package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



import com.poly.entity.Product;
	
public interface  ProductDAO extends JpaRepository<Product, String> {

	@Query(value = "SELECT TOP 8 * FROM Products ORDER BY NEWID()", nativeQuery = true)
    List<Product> findRandomProducts();


	@Query("SELECT p FROM Product p WHERE p.quantity > 0")
	List<Product> findAll();
}
