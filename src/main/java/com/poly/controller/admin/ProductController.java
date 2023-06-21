package com.poly.controller.admin;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CartDAO;
import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.service.SessionService;

@Controller
public class ProductController {

	@Autowired
	ServletContext app;

	@Autowired
	ProductDAO dao;

	@Autowired
	SessionService session;
	
	@Autowired
	CategoryDAO cdao;
	
	// create
	@GetMapping("/admin/manage/product/save")
	public String create(Model model, @ModelAttribute("product") Product entity,
			@RequestParam("p") Optional<Integer> p) {
		Pageable pageable;
		try {
			pageable = PageRequest.of(p.orElse(0), 5);
		} catch (Exception e) {
			pageable = PageRequest.of(0, 5);
		}
		Page<Product> list = dao.findAll(pageable);
		entity.setLike(0);
		Category cate = cdao.findById("3").get();
		entity.setCategory(cate);
		dao.saveAndFlush(entity);
		String link = "manage/product";
		model.addAttribute("list", list);
		model.addAttribute("url", link);
		model.addAttribute("tittle", "Trang quản lý sản phẩm");
		return "admin/index";
	}

	// get form
	@SuppressWarnings("deprecation")
	@GetMapping("/admin/manage/product/getform/{id}")
	public String getForm(Model model, @ModelAttribute("product") Product entity, @PathVariable("id") String id,
			@RequestParam("p") Optional<Integer> p) {
		Pageable pageable;
		try {
			pageable = PageRequest.of(p.orElse(0), 5);
		} catch (Exception e) {
			pageable = PageRequest.of(0, 5);
		}
		entity = dao.getOne(id);
		model.addAttribute("product", entity);
		Page<Product> list = dao.findAll(pageable);
		String link = "manage/product";
		model.addAttribute("list", list);
		model.addAttribute("tittle", "Trang quản lý sản phẩm");
		model.addAttribute("url", link);
		return "admin/index";
	}

	// edit
	@GetMapping("/admin/manage/product/edit/{id}")
	public String edit(Model model, @ModelAttribute("product") Product entity) {
		dao.saveAndFlush(entity);
		return "redirect:/admin/manage/product";
	}

	// remove
	@SuppressWarnings("deprecation")
	@GetMapping("/admin/manage/product/remove/{id}")
	public String removeProduct(Model model, @ModelAttribute("product") Product entity, @PathVariable("id") String id) {
		entity = dao.getOne(id);
		entity.setQuantity(0);
		dao.saveAndFlush(entity);
		model.addAttribute("message", "Xoá thành công");
		return "redirect:/admin/manage/product";
	}

	// reset
	@GetMapping("/admin/manage/product/reset")
	public String resetProduct() {
		return "redirect:/admin/manage/product";
	}
	
	@RequestMapping("/admin/manage/product/search")
	public String seachProduct(Model model, @RequestParam("keyword") Optional<String> name, @RequestParam("p") Optional<Integer> p,
			@ModelAttribute("product") Product entity) {
		String findName;
		if(session.getAttribute("keyword") == null) {
			findName = name.orElse("");
		}else {
			findName = name.orElse(session.getAttribute("keyword"));
		}
		session.setAttribute("keyword", findName);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = dao.findProductByNamePage("%" + findName + "%", pageable);
		model.addAttribute("list",page);
		String link = "manage/product";
		model.addAttribute("tittle", "Trang quản lý sản phẩm");
		model.addAttribute("url", link);
		return "admin/index";
	}

	@GetMapping("/admin/manage/product/sort={field}")
	public String product(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable;
		try {
			pageable = PageRequest.of(p.orElse(0), 5);
		} catch (Exception e) {
			pageable = PageRequest.of(0, 5);
		}
		Page<Product> page = dao.findAll(pageable);
		model.addAttribute("list", page);
		Product entity = new Product();
		String link = "manage/product";
		model.addAttribute("tittle", "Trang quản lý sản phẩm");
		model.addAttribute("product", entity);
		model.addAttribute("url", link);
		return "admin/index";
	}
}
