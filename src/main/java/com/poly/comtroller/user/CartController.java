package com.poly.comtroller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CartDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Cart;
import com.poly.entity.Product;
import com.poly.service.SessionService;


@Controller
public class CartController {
	
	@Autowired
	CartDAO cdao;
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	SessionService session;
	
	@GetMapping("/cart")
	public String cart(Model model) {
		String username = session.getAttribute("username");
		List<Cart> listcart = cdao.findByUserId(username);
		
		if (listcart.isEmpty()) {
			model.addAttribute("message", "Chưa có sản phẩm nào trong giỏ hàng");
		}
		model.addAttribute("mainView", "cart.jsp");
		model.addAttribute("listCart", listcart);
		
		return "user/layout";
	}
	
	@GetMapping("/cart/add/{id}")
	public String add(@PathVariable("id") String productID) {
		String username = session.getAttribute("username");
		List<Cart> listc = cdao.findByUserId(username);
		Boolean checkProduct = false;
		for (Cart cart : listc) {
			System.out.println("Product in old cart: "+cart.getProduct().getId());
			System.out.println("Product in add new: "+productID);
			System.out.println("============================");
			if(cart.getProduct().getId().equals(productID)) {
				
				checkProduct = true;
				cart.setQuantityPurchased(cart.getQuantityPurchased() + 1);
				cdao.saveAndFlush(cart);
				break;
			}
		}
		Cart entity = new Cart();
		if (!checkProduct) {	
			entity.setProduct(pdao.getById(productID));
			entity.setUser(udao.getById(username));
			entity.setQuantityPurchased(1);
			cdao.save(entity);
		}
		
		return "redirect:/cart";
	}
	
	@GetMapping("/cart/increase/{id}")
	public String increase(@PathVariable("id") Long cartID) {
		Cart entity = cdao.getById(cartID);
		entity.setQuantityPurchased(entity.getQuantityPurchased() + 1);
		cdao.saveAndFlush(entity);
		
		return "redirect:/cart";
	}
	
	@GetMapping("/cart/reduced/{id}")
	public String reduced(@PathVariable("id") Long cartID) {
		Cart entity = cdao.getById(cartID);
		entity.setQuantityPurchased(entity.getQuantityPurchased() - 1);
		cdao.saveAndFlush(entity);
		
		return "redirect:/cart";
	}
	
	@GetMapping("/cart/setquantity/{id}")
	public String quantity(@PathVariable("id") Long cartID, @RequestParam("quantity") Integer quantity) {
		Cart entity = cdao.getById(cartID);
		if(quantity > 0) {
			entity.setQuantityPurchased(quantity);
			cdao.saveAndFlush(entity);
		}else {
			cdao.delete(entity);
		}
		return "redirect:/cart";
	}
	@GetMapping("/cart/delete/{id}")
	public String delete(@PathVariable("id") Long cartID) {
		Cart entity = cdao.getById(cartID);
		cdao.delete(entity);
		
		return "redirect:/cart";
	}
	
}
