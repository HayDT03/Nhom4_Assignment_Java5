package com.poly.controller.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CartDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Cart;
import com.poly.entity.Product;
import com.poly.service.SessionService;


@Controller
public class DetailController {
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	CartDAO cdao;
	
	@Autowired
	SessionService session;
	
	@Autowired
	UserDAO udao;
	
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam(value = "pid", required = false) String pid) {
		if (pid == null) {
            return "redirect:/";
        }else {
			
			Optional<Product> product = pdao.findById(pid);
			if(product.isPresent()) {
				model.addAttribute("product", product.get());
				List<Product> listP = pdao.findRandomRelateProducts();
				model.addAttribute("listP", listP);
			}else {
				return "redirect:/";
			}
			
		}
		model.addAttribute("mainView", "detail.jsp");
		return "user/layout";
	}
	
	@PostMapping("/detail/add-to-cart/{id}")
	public String add(@PathVariable("id") String productID, @RequestParam("quantity") Integer quantity) {
		String username = session.getAttribute("username");
		List<Cart> listc = cdao.findByUserId(username);
		Boolean checkProduct = false;
		for (Cart cart : listc) {
			System.out.println("Product in old cart: "+cart.getProduct().getId());
			System.out.println("Product in add new: "+productID);
			System.out.println("============================");
			if(cart.getProduct().getId().equals(productID)) {
				
				checkProduct = true;
				cart.setQuantityPurchased(cart.getQuantityPurchased() + quantity);
				cdao.saveAndFlush(cart);
				break;
			}
		}
		Cart entity = new Cart();
		if (!checkProduct) {	
			entity.setProduct(pdao.getById(productID));
			entity.setUser(udao.getById(username));
			entity.setQuantityPurchased(quantity);
			cdao.saveAndFlush(entity);
		}
		
		return "redirect:/cart";
	}
	@GetMapping("/detail/like/{id}")
	public String like(@PathVariable("id") String productID) {
		Product entity = pdao.findById(productID).get();
		if(entity != null) {
			entity.setLike(entity.getLike() + 1);
			pdao.saveAndFlush(entity);
		}
		
		return "redirect:/detail?pid="+productID;
	}
}
