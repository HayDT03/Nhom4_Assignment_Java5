package com.poly.controller.admin;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.poly.dao.ProductDAO;
import com.poly.entity.Product;

public class ProductController {

	@Autowired
	ServletContext app;
	
	@Autowired
	ProductDAO dao;
	//create
		@GetMapping("/admin/manage/product/save")
		public String create(Model model, @ModelAttribute("product") Product entity) {
			dao.saveAndFlush(entity);
			String link = "manage/product";
			model.addAttribute("url", link);
			return "admin/index";
		}
		//get form
		@SuppressWarnings("deprecation")
		@GetMapping("/admin/manage/product/getform/{id}")
		public String getForm(Model model, @ModelAttribute("product") Product entity, @PathVariable("id") String id) {
			entity = dao.getOne(id);
			model.addAttribute("product", entity);
			List<Product> list = dao.findAll();
			String link = "manage/product";
			model.addAttribute("list", list);
			model.addAttribute("url", link);
			return "admin/index";
		}
		//edit
		@GetMapping("/admin/manage/product/edit/{id}")
		public String edit(Model model, @ModelAttribute("product") Product entity) {
			dao.saveAndFlush(entity);
			return "redirect:/admin/manage/product";
		}
		//remove
		@SuppressWarnings("deprecation")
		@GetMapping("/admin/manage/product/remove/{id}")
		public String removeProduct(Model model, @ModelAttribute("product") Product entity, @PathVariable("id") String id) {
			entity = dao.getOne(id);
			entity.setQuantity(0);
			dao.saveAndFlush(entity);
			model.addAttribute("message","Xoá thành công");
			return "redirect:/admin/manage/product";
		}
}
