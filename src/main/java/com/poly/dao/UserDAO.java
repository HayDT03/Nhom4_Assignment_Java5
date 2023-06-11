package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.User;

public interface  UserDAO extends JpaRepository<User, String> {
	@Query("SELECT u FROM User u WHERE u.active = true")
    List<User> findActiveUsers();
	
	@Query("SELECT u.email FROM User u")
    List<String> getAllEmails();
	
	@Query("SELECT u.phone FROM User u")
    List<String> getAllPhones();
}
