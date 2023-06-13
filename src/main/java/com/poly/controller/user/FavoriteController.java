package com.poly.controller.user;

import java.util.Date;
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
		Favorite entity = fdao.findById(cartID).get();
		fdao.delete(entity);
		
		return "redirect:/favorite";
	}
	
	@GetMapping("/favorite/add/{pid}")
	public String add(@PathVariable("pid") String pid) {
		
		String userID = session.getAttribute("username");
		if (userID != null) {

			if (fdao.isProductLikedByUser(userID, pid) > 0) {
				Favorite entity = fdao.findByUserAndProduct(udao.findById(userID).get(), pdao.findById(pid).get())
						.get();
				entity.setCreateDate(new Date());
				fdao.saveAndFlush(entity);

			} else {

				Favorite entity = new Favorite();
				entity.setProduct(pdao.findById(pid).get());
				entity.setUser(udao.findById(userID).get());
				entity.setCreateDate(new Date());
				fdao.saveAndFlush(entity);

			}
		}
		
		
		return "redirect:/favorite";
	}
}