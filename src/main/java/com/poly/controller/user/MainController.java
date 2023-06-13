package com.poly.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.dao.CartDAO;
import com.poly.dao.ProductDAO;
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
		String username = session.getAttribute("username");
		if(username != null ) {
			session.setAttribute("cart", cdao.countProductsByUserId(username));
		}else {
			session.setAttribute("cart", 0);
		}
		model.addAttribute("mainView", "home.jsp");
		model.addAttribute("listProduct", pdao.findRandomProducts());
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
