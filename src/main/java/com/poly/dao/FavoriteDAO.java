package com.poly.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.entity.Favorite;
import com.poly.entity.Product;
import com.poly.entity.User;

public interface  FavoriteDAO extends JpaRepository<Favorite, Long> {
	@Query("SELECT c FROM Favorite c WHERE c.user.id =?1")
	List<Favorite> findByUserId(String userId);
	
	@Query(value = "SELECT COUNT(*) FROM Favorites f WHERE f.UserID = :userID AND f.ProductID = :productID", nativeQuery = true)
	Integer isProductLikedByUser(@Param("userID") String userID, @Param("productID") String productID);
	
	Optional<Favorite> findByUserAndProduct(User user, Product product);
}
