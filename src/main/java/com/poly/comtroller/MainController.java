package com.poly.comtroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("message", "Chào mừng bạn đến với website");
		return "user/favourite";
	}
}
