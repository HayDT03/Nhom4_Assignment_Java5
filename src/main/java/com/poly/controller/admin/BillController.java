package com.poly.controller.admin;

import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.entity.Order;
import com.poly.entity.Product;

@Controller
public class BillController {

	@Autowired
	ServletContext app;

	@Autowired
	OrderDAO dao;
	@Autowired
	OrderDetailDAO odDao;

	// edit
	@GetMapping("/admin/manage/bill/edit/{id}")
	public String edit(Model model, @ModelAttribute("bill") Order entity) {
		dao.saveAndFlush(entity);
		return "redirect:/admin/manage/bill";
	}

	// delete
	@SuppressWarnings("deprecation")
	@GetMapping("/admin/manage/bill/remove/{id}")
	public String removeProduct(Model model, @ModelAttribute("bill") Order entity, @PathVariable("id") Integer id) {
		entity = dao.getOne(id);
		dao.deleteById(id);
		model.addAttribute("message", "Xoá thành công");
		return "redirect:/admin/manage/bill";
	}

	// reset
	@GetMapping("/admin/manage/bill/reset")
	public String resetProduct() {
		return "redirect:/admin/manage/bill";
	}
	
	// set form
		@SuppressWarnings("deprecation")
		@GetMapping("/admin/manage/bill/{id}")
		public String getForm(Model model, @ModelAttribute("bill") Order entity, @PathVariable("id") Integer id,
				@RequestParam("p") Optional<Integer> p) {
			entity = dao.getOne(id);
			model.addAttribute("bill", entity);
			List<Order> list=dao.findAll();
			String link = "manage/bill";
			model.addAttribute("list", list);
			model.addAttribute("url", link);
			return "admin/index";
		}
}
