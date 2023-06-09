package com.poly.controller.admin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.UserDAO;
import com.poly.entity.User;

@Controller
public class UserController {

	@Autowired
	UserDAO dao;
	
	// get form
		@SuppressWarnings("deprecation")
		@GetMapping("/admin/manage/user/getform/{id}")
		public String getForm(Model model, @ModelAttribute("user") User entity, @PathVariable("id") String id,
				@RequestParam("p") Optional<Integer> p) {
//			Pageable pageable;
//			try {
//				pageable = PageRequest.of(p.orElse(0), 5);
//			} catch (Exception e) {
//				pageable = PageRequest.of(0, 5);
//			}
			entity = dao.getOne(id);
			model.addAttribute("user", entity);
//			Page<user> list = dao.findAll(pageable);
			List<User> list = dao.findAll();
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
}
