package com.poly.comtroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("mainView", "home.jsp");
		return "user/layout";
	}
	
	@GetMapping("/about")
	public String about(Model model) {
		model.addAttribute("mainView", "about.jsp");
		return "user/layout";
	}
	
	@GetMapping("/cart")
	public String cart(Model model) {
		model.addAttribute("mainView", "cart.jsp");
		return "user/layout";
	}
	
	@GetMapping("/pay")
	public String pay(Model model) {
		model.addAttribute("mainView", "pay.jsp");
		return "user/layout";
	}
	
	@GetMapping("/contact")
	public String contact(Model model) {
		model.addAttribute("mainView", "contact.jsp");
		return "user/layout";
	}
	
	@GetMapping("/favourite")
	public String favourite(Model model) {
		model.addAttribute("mainView", "favourite.jsp");
		return "user/layout";
	}
	
	@GetMapping("/all_product")
	public String all_product(Model model) {
		model.addAttribute("mainView", "all_product.jsp");
		return "user/layout";
	}
}
