package com.poly.controller.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CartDAO;
import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.service.SessionService;

@Controller
public class ProductUserController {
	
	@Autowired
	SessionService session;
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	CategoryDAO cdao;
	
	@GetMapping("/product")
	public String product(Model model, @RequestParam("keyword") Optional<String> name, @RequestParam("p") Optional<Integer> p) {
		String findName;
		if(session.getAttribute("keyword") == null) {
			findName = name.orElse("");
		} else {
			findName = name.orElse(session.getAttribute("keyword"));
		}
		if(p.isPresent()) {
			if (p.get() < 0) {
				p = Optional.of(0);
			}else {
				p = Optional.of(p.get() - 1);
			}
			
		}
		
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		Page<Product> page = pdao.findByNamePage("%"+findName+"%",pageable);
		if(page.isEmpty()) {
			model.addAttribute("message", "Không tìm thấy sách với từ khóa: "+findName);
		}
		model.addAttribute("listCat", cdao.findAll());
		model.addAttribute("page", page);
		System.out.println(page.getTotalPages());
		List<Integer> pageL = new ArrayList<>();
		
		for(int i = 0; i < page.getTotalPages(); i++) {
			pageL.add(i);
			System.out.println(i);
		}
		model.addAttribute("listP", pageL);

		model.addAttribute("mainView", "product.jsp");
		return "user/layout";
	}
	
	@PostMapping("/product")
	public String product2(Model m, @RequestParam("keyword") Optional<String> name, @RequestParam("p") Optional<Integer> p) {
		String findName;
		if(session.getAttribute("keyword") == null) {
			findName = name.orElse("");
		} else {
			findName = name.orElse(session.getAttribute("keyword"));
		}
		if(p.isPresent()) {
			p = Optional.of(p.get() - 1);
		}
		session.setAttribute("keyword", findName);
		Pageable pageable = PageRequest.of(Integer.valueOf(0), 8);
		Page<Product> page = pdao.findByNamePage("%"+findName+"%",pageable);
		m.addAttribute("page", page);
		return "redirect:/product";
	}
	@GetMapping("/product/{id}")
	public String category(Model model, @PathVariable
			("id") String categoryID, @RequestParam("p") Optional<Integer> p) {
		Category category = cdao.getById(categoryID);
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		Page<Product> page = pdao.findByCategory(category,pageable);
		model.addAttribute("page", page);
		model.addAttribute("listCat", cdao.findAll());
		model.addAttribute("mainView", "product.jsp");		
		return "user/layout";
	}
}
