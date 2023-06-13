package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.entity.Cart;

public interface  CartDAO extends JpaRepository<Cart, Long> {
	
	@Query("SELECT c FROM Cart c WHERE c.user.id =?1")
	List<Cart> findByUserId(String userId);
	
	@Query("SELECT COUNT(c) FROM Cart c  WHERE c.user.id = ?1")
    Integer countProductsByUserId(String userId);
}
