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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;

@Controller
public class BillController {

	@Autowired
	ServletContext app;

	@Autowired
	OrderDAO dao;

	@Autowired
	OrderDetailDAO odDao;
	
	// index
	@GetMapping("/admin/manage/bill")
	public String index(Model model, @RequestParam("p") Optional<Integer> p) {
		Sort sort = Sort.by(Direction.ASC, "id");
		if (p.orElse(0) < 0) {
			return "redirect:/admin/manage/bill";
		}
		Pageable pageable = PageRequest.of(p.orElse(0), 10, sort);
		Page<Order> page = dao.findAll(pageable);
		if (!page.hasContent()) {
			return "redirect:/admin/manage/bill";
		}
		model.addAttribute("pages", page);
		Order entity = new Order();
		String link = "manage/bill";
		model.addAttribute("tittle", "Trang quản lý hoá đơn");
		model.addAttribute("product", entity);
		model.addAttribute("url", link);
		return "admin/index";
	}

	@GetMapping("/admin/manage/bill/detail")
	public String detail(@RequestParam("id") Optional<String> idOrders, Model model) {
		String link = "manage/cart";
		model.addAttribute("url", link);
		model.addAttribute("tittle", "Trang chi tiết hóa đơn");
		
		if (idOrders.isPresent()) {
			String id = idOrders.get();
			Optional<Order> dOrder = dao.findById(id);
			if (dOrder.isPresent()) {
				Order order = dOrder.get();
				model.addAttribute("bill", order);
			} else
				return "redirect:/admin/manage/bill/detail";
		} else {
			return "redirect:/admin/manage/bill/detail";
		}
		
		return "admin/index";
	}
}
