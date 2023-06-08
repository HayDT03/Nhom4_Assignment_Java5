package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Product;
	
public interface  ProductDAO extends JpaRepository<Product, String> {
	@Query(value = "SELECT TOP 8 * FROM Products ORDER BY NEWID()", nativeQuery = true)
    List<Product> findSixRandomProducts();
}
