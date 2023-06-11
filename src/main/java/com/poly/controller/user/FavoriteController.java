package com.poly.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.poly.dao.FavoriteDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Favorite;
import com.poly.service.SessionService;

@Controller
public class FavoriteController {
	@Autowired
	FavoriteDAO fdao;
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	SessionService session;
	
	@GetMapping("/favorite")
	public String favourite(Model model) {
		String username = session.getAttribute("username");
		List<Favorite> listfavourite = fdao.findByUserId(username);
		if (listfavourite.isEmpty()) {
			model.addAttribute("message", "Chưa có sản phẩm yêu thích nào");
		}
		
		model.addAttribute("listFavourite", listfavourite);
		model.addAttribute("mainView", "favorite.jsp");
		return "user/layout";
	}
	
	@GetMapping("/favorite/delete/{id}")
	public String delete(@PathVariable("id") Long cartID) {
		Favorite entity = fdao.getById(cartID);
		fdao.delete(entity);
		
		return "redirect:/favorite";
	}
}