package com.poly.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.dao.UserDAO;
import com.poly.entity.User;
import com.poly.service.CookieService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

@Controller
public class AccountController {
	
	@Autowired
	CookieService cookieService;
	
	@Autowired
	SessionService sessionService;
	
	@Autowired
	ParamService paramService;
	
	@Autowired
	UserDAO udao;
	
	@GetMapping("/account/login")
	public String login(Model model) {
		String user = cookieService.getValue("username");
		if(user != null) {
			String pass = cookieService.getValue("password");
			model.addAttribute("username", user);
			model.addAttribute("password", pass);
		}
		return "account/login";
	}
	
	@PostMapping("/account/login")
	public String login2(Model model) {
		String username = paramService.getString("username", "");
		String password = paramService.getString("password", "");
		Boolean remember = paramService.getBoolean("remember", false);
		
		List<User> listUser = udao.findAll();
		User user = null;
		for (User userl : listUser) {
			if(userl.getId().equals(username)) {
				user = udao.getById(username);
				break;
			}
		}
		if(!(user == null)) {
			if (password.equals(user.getPassword())) {
				sessionService.setAttribute("username", user.getId());
				sessionService.setAttribute("fullname", user.getFullname());
				if (remember) {
					cookieService.add("username", username, 10);
					cookieService.add("password", password, 10);
				} else {
					cookieService.delete("username");
					cookieService.delete("password");
				}
				return "redirect:/";
			} else {
				sessionService.removeAttribute("username");
				sessionService.removeAttribute("fullname");
				model.addAttribute("message", "Sai mật khẩu!");
			}
		}else {
			model.addAttribute("message", "Không tìm thấy tài khoản!");
		}
		
		
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
	
	@GetMapping("/account/editprofile")
	public String editprofile() {
		return "account/editprofile";
	}
	@GetMapping("/account/logout")
	public String logout() {
		sessionService.removeAttribute("username");
		sessionService.removeAttribute("fullname");
		return "redirect:/account/login";
	}
}
