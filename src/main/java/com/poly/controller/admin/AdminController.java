package com.poly.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.ProductDAO;
import com.poly.entity.Product;

@Controller
public class AdminController {

	@Autowired
	ProductDAO dao;
	
	@GetMapping("/admin/index")
	public String admin(Model model) {
		List<Product> list = dao.findAll();
		String link = "manage/product";
		model.addAttribute("list", list);
		model.addAttribute("url", link);
		return "admin/index";
	}
	
	@GetMapping("/admin/manage/product")
	public String sanpham(Model model) {
		String link = "quanly/sanpham";
		model.addAttribute("url", link);
		return "admin/index";
	}
	
	@GetMapping("/admin/quanly/nguoidung")
	public String nguoidung(Model model) {
		String link = "quanly/nguoidung";
		model.addAttribute("url", link);
		return "admin/index";
	}
	
	@GetMapping("/admin/quanly/giohang")
	public String giohang(Model model) {
		String link = "quanly/giohang";
		model.addAttribute("url", link);
		return "admin/index";
	}
}
