package com.poly.controller.user;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CartDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Product;
import com.poly.service.SessionService;

@Controller
public class MainController {
	@Autowired
	SessionService session;
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	CartDAO cdao;
	
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("mainView", "home.jsp");
		model.addAttribute("listProduct", pdao.findRandomProducts());
		String userID = session.getAttribute("username");
		if(userID == null) {
			session.setAttribute("cart", 0);
		}else {
			session.setAttribute("cart", cdao.countProductsByUserId(userID));
		}
		
		
		return "user/layout";
	}
	
	@GetMapping("/about")
	public String about(Model model) {
		model.addAttribute("mainView", "about.jsp");
		return "user/layout";
	}
	
	
	
	
	@GetMapping("/contact")
	public String contact(Model model) {
		model.addAttribute("mainView", "contact.jsp");
		return "user/layout";
	}
	
	
	
}
