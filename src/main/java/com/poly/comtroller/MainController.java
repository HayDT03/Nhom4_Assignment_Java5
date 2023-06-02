package com.poly.comtroller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MainController {
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("message", "Chào mừng bạn đến với website");
		return "index";
	}
}
