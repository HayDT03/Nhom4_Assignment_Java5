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
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
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
	public String admin(Model model) {
		String link = "statistic/indextemp";
		model.addAttribute("tittle", "Trang chủ");
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
	public String user(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable;
		try {
			pageable = PageRequest.of(p.orElse(0), 5);
		} catch (Exception e) {
			pageable = PageRequest.of(0, 5);
		}
		Page<User> list = udao.findAll(pageable);
		User entity = new User();
		String link = "manage/user";
		model.addAttribute("tittle", "Trang quản lý người dùng");
		model.addAttribute("list", list);
		model.addAttribute("user", entity);
		model.addAttribute("url", link);
		return "admin/index";
	}

	@Autowired
	OrderDAO odao;

	@GetMapping("/admin/manage/bill")
	public String bill(Model model) {
		
		List<Order> page = odao.findAll();
		model.addAttribute("list", page);
		Order entity = new Order();
		String link = "manage/bill";
		model.addAttribute("tittle", "Trang quản lý hoá đơn");
		model.addAttribute("product", entity);
		model.addAttribute("url", link);
		return "admin/index";
	}
	@Autowired
	OrderDetailDAO odDao;
	
	@GetMapping("/admin/statistic/product")
	public String statisticP(Model model) {
		model.addAttribute("top10", odDao.getTop10SPBanChay(PageRequest.of(0, 10, Sort.by(Direction.DESC, "soLuong"))));
		String link = "statistic/product";
		model.addAttribute("tittle", "Trang thống kê sản phẩm");
		model.addAttribute("url", link);
		return "admin/index";
	}
	
	@GetMapping("/admin/statistic/revenue")
	public String statisticR(Model model) {
		model.addAttribute("doanhThu", odDao.getDoanhThu(PageRequest.of(0, 10)));
		String link = "statistic/revenue";
		model.addAttribute("tittle", "Trang thống kê doanh thu");
		model.addAttribute("url", link);
		return "admin/index";
	}
}
