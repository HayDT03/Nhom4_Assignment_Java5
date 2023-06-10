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

import com.poly.dao.ProductDAO;
import com.poly.entity.Product;
import com.poly.service.SessionService;

@Controller
public class MainController {
	@Autowired
	SessionService session;
	@Autowired
	ProductDAO pdao;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("mainView", "home.jsp");
		model.addAttribute("listProduct", pdao.findRandomProducts());
		return "user/layout";
	}
	
	@GetMapping("/about")
	public String about(Model model) {
		model.addAttribute("mainView", "about.jsp");
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
	
	@GetMapping("/favorite")
	public String favourite(Model model) {
		model.addAttribute("mainView", "favorite.jsp");
		return "user/layout";
	}
	
	@GetMapping("/allproduct")
	public String allproduct(Model model, @RequestParam("keyword") Optional<String> name, @RequestParam("p") Optional<String> p) {
		String findName;
		if(session.getAttribute("keyword")== null) {
			findName = name.orElse("");
		} else {
			findName = name.orElse(session.getAttribute("keyword"));
		}
		session.setAttribute("keyword", findName);
		Pageable pageable = PageRequest.of(Integer.valueOf(0), 8);
		Page<Product> page = pdao.findByNamePage("%"+findName+"%",pageable);
		model.addAttribute("page", page);

		model.addAttribute("mainView", "all_product.jsp");
		return "user/layout";
	}
	
	@GetMapping("/detail")
	public String detail(Model model) {
		model.addAttribute("mainView", "detail.jsp");
		return "user/layout";
	}
	
	@PostMapping("/allproduct")
	public String page2(Model m, @RequestParam("keyword") Optional<String> name, @RequestParam("p") Optional<String> p) {
		String findName;
		if(session.getAttribute("keyword")== null) {
			findName = name.orElse("");
		} else {
			findName = name.orElse(session.getAttribute("keyword"));
		}
		session.setAttribute("keyword", findName);
		Pageable pageable = PageRequest.of(Integer.valueOf(0), 8);
		Page<Product> page = pdao.findByNamePage("%"+findName+"%",pageable);
		m.addAttribute("page", page);
		return "redirect:/allproduct";
	}
}
