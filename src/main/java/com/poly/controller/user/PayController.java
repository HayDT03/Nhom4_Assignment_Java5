package com.poly.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PayController {
	@GetMapping("/pay")
	public String pay(Model model) {
		model.addAttribute("mainView", "pay.jsp");
		return "user/layout";
	}
}
