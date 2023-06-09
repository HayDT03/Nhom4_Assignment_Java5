package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.User;

public interface  UserDAO extends JpaRepository<User, String> {

}
