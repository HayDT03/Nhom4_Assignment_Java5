package com.poly.controller.user;

import java.util.Date;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.CartDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.entity.Cart;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.User;
import com.poly.service.SessionService;

@Controller
@EnableAsync
public class PayController {
	
	@Autowired
	CartDAO cdao;
	
	@Autowired
	OrderDAO odao;
	
	@Autowired
	OrderDetailDAO ddao;
	
	
	@Autowired
	SessionService session;
	
	@GetMapping("/pay")
	public String pay(Model model, RedirectAttributes attributes) {
		this.createOrderID();
		this.createOrderDetailID();
		User user = session.getAttribute("user");
		
		List<Cart> listC = cdao.findByUserId(user.getId());
		if(listC.size() > 0) {
			model.addAttribute("listC", listC);
			model.addAttribute("user", user);
			
		}else {
			attributes.addFlashAttribute("message", "Vui lòng chọn hàng hóa để thanh toán");
			return "redirect:/cart";
		}
		model.addAttribute("mainView", "pay.jsp");
		return "user/layout";
	}
	
	@PostMapping("/pay")
	public String pay2(Model model, RedirectAttributes attributes) {
		
		User user = session.getAttribute("user");
		
		List<Cart> listC = cdao.findByUserId(user.getId());
		if(listC.size() > 0) {
			model.addAttribute("listC", listC);
			model.addAttribute("user", user);
			Order entity = new Order();
			entity.setId(this.createOrderID());
			entity.setUser(user);
			entity.setTotal(getTotalCart());
			entity.setDate(new Date());
			entity.setStatus(0);
			odao.saveAndFlush(entity);
			
			for (Cart cart : listC) {
				OrderDetail odetail = new OrderDetail();
				odetail.setOrder(entity);
				odetail.setId(this.createOrderDetailID());
				odetail.setProduct(cart.getProduct());
				odetail.setQuantityPurchased(cart.getQuantityPurchased());
				ddao.saveAndFlush(odetail);
				cdao.delete(cart);
			}
			session.setAttribute("cart", 0);
			
		}else {
			attributes.addFlashAttribute("message", "Vui lòng chọn hàng hóa để thanh toán");
			return "redirect:/cart";
		}
		
		try {
			
			delayAndRedirect();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("message", "Thanh toán thành công");
		return "user/success";
	}
	
	public String createOrderID () {
		List<Order> listO = odao.findAll();
		String orderID = listO.get(listO.size() - 1).getId();
		int numberOrder = Integer.parseInt(orderID.substring(orderID.length() - 3)) + 1;
		System.out.println("PayController.createOrderID() "+"DH" +String.format("%03d", numberOrder));
		return "DH" +String.format("%03d", numberOrder);
	}
	
	public String createOrderDetailID () {
		List<OrderDetail> listO = ddao.findAll();
		String orderDetailID = listO.get(listO.size() - 1).getId();
		int numberOrder = Integer.parseInt(orderDetailID.substring(orderDetailID.length() - 3)) + 1;
		System.out.println("PayController.createOrderDetailID() "+"HD" +String.format("%03d", numberOrder));
		return "HD" +String.format("%03d", numberOrder);
	}
	public Double getTotalCart() {
		Double total = 0.0;
		User user = session.getAttribute("user");
		List<Cart> listC = cdao.findByUserId(user.getId());
		for (Cart cart : listC) {
			total = cart.getProduct().getPrice() * cart.getQuantityPurchased();
		}
		return total;
	}
	
	@Async
    public CompletableFuture<String> delayAndRedirect() throws InterruptedException {
        TimeUnit.SECONDS.sleep(5); // Đợi 5 giây
        return CompletableFuture.completedFuture("redirect:/"); // Chuyển hướng về "/"
    }
}
