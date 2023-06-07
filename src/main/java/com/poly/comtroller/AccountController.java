package com.poly.comtroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountController {
	@GetMapping("/account/login")
	public String login() {
		return "account/login";
	}
	
	@GetMapping("/account/register")
	public String register() {
		return "account/register";
	}
	
	@GetMapping("/account/forgot")
	public String forgot() {
		return "account/forgot";
	}
}
