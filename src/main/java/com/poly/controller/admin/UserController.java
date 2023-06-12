package com.poly.controller.admin;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.UserDAO;
import com.poly.entity.User;
import com.poly.service.SessionService;

@Controller
public class UserController {

	@Autowired
	UserDAO dao;
	
	@Autowired
	SessionService session;
	// get form
		@SuppressWarnings("deprecation")
		@GetMapping("/admin/manage/user/getform/{id}")
		public String getForm(Model model, @ModelAttribute("user") User entity, @PathVariable("id") String id,
				@RequestParam("p") Optional<Integer> p) {
			Pageable pageable;
			try {
				pageable = PageRequest.of(p.orElse(0), 5);
			} catch (Exception e) {
				pageable = PageRequest.of(0, 5);
			}
			entity = dao.getOne(id);
			model.addAttribute("user", entity);
			Page<User> list = dao.findAll(pageable);
			String link = "manage/user";
			model.addAttribute("list", list);
			model.addAttribute("url", link);
			return "admin/index";
		}
		
		// remove
		@SuppressWarnings("deprecation")
		@GetMapping("/admin/manage/user/remove/{id}")
		public String removeUser(Model model, @ModelAttribute("user") User entity, @PathVariable("id") String id) {
			entity = dao.getOne(id);
			entity.setActive(false);
			dao.saveAndFlush(entity);
			return "redirect:/admin/manage/user";
		}
		
		// reset
		@PostMapping("/admin/manage/user/reset")
		public String resetProduct() {
			return "redirect:/admin/manage/user";
		}
		
		@PostMapping("/admin/manage/user/edit/{id}")
		public String edit(Model model, @ModelAttribute("user") User entity) {
			dao.saveAndFlush(entity);
			return "redirect:/admin/manage/user";
		}
		
		@RequestMapping("/admin/manage/user/search")
		public String seachProduct(Model model, @RequestParam("keyword") Optional<String> name, @RequestParam("p") Optional<Integer> p,
				@ModelAttribute("user") User entity) {
			String findName;
			if(session.getAttribute("keyword") == null) {
				findName = name.orElse("");
			}else {
				findName = name.orElse(session.getAttribute("keyword"));
			}
			session.setAttribute("keyword", findName);
			Pageable pageable = PageRequest.of(p.orElse(0), 5);
			Page<User> list = dao.findUserByNamePage("%" + findName + "%", pageable);
			model.addAttribute("list", list);
			String link = "manage/user";
			model.addAttribute("tittle", "Trang quản lý người dùng");
			model.addAttribute("url", link);
			return "admin/index";
		}
}
