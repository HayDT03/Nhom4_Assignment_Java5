package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Favorite;

public interface  FavoriteDAO extends JpaRepository<Favorite, Long> {
	@Query("SELECT c FROM Favorite c WHERE c.user.id =?1")
	List<Favorite> findByUserId(String userId);
}
