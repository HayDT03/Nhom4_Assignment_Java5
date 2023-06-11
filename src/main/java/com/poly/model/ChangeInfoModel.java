package com.poly.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.poly.entity.Cart;
import com.poly.entity.Favorite;
import com.poly.entity.Order;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ChangeInfoModel {
	String id;
	String password;
	String fullname;
	String email;
	Boolean gender;
	@Temporal(TemporalType.DATE)
	Date birthday = new Date();
	String phone;
	String address;
	Boolean role;
	Boolean active;
}
