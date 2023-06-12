package com.poly.controller.admin;

import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.OrderDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Order;
import com.poly.entity.Product;
import com.poly.entity.User;

@Controller
public class AdminController {

	@Autowired
	ServletContext app;

	@Autowired
	ProductDAO pdao;

	@Autowired
	UserDAO udao;

	@GetMapping("/admin")
	public String admin(Model model, @RequestParam("p") Optional<Integer> p) {
		String link = "statistic/indextemp";
		model.addAttribute("tittle", "Trang chủ");
		model.addAttribute("url", link);
		
		
		Sort sort = Sort.by(Direction.DESC, "price");
		if (p.orElse(0) < 0) {
			return "redirect:/admin/manage/bill";
		}
		Pageable pageable = PageRequest.of(p.orElse(0), 5,sort);
		Page<Product> page = pdao.findAll(pageable);
		if (!page.hasContent()) {
			return "redirect:/admin/manage/bill";
		}

		
		model.addAttribute("list", page);
		Product entity = new Product();
		model.addAttribute("product", entity);
		model.addAttribute("url", link);
		
		return "admin/index";
	}

	@GetMapping("/admin/manage/product")
	public String product(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable;
		try {
			pageable = PageRequest.of(p.orElse(0), 5);
		} catch (Exception e) {
			pageable = PageRequest.of(0, 5);
		}
		Page<Product> page = pdao.findAll(pageable);
		model.addAttribute("list", page);
		Product entity = new Product();
		String link = "manage/product";
		model.addAttribute("tittle", "Trang quản lý sản phẩm");
		model.addAttribute("product", entity);
		model.addAttribute("url", link);
		return "admin/index";
	}

	@GetMapping("/admin/manage/user")
	public String user(Model model) {
		List<User> list = udao.findAll();
		User entity = new User();
		String link = "manage/user";
		model.addAttribute("tittle", "Trang quản lý người dùng");
		model.addAttribute("list", list);
		model.addAttribute("user", entity);
		model.addAttribute("url", link);
		return "admin/index";
	}

	
}
