package com.poly.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.UserDAO;
import com.poly.entity.User;
import com.poly.model.ChangeInfoModel;
import com.poly.model.MailModel;
import com.poly.service.CookieService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;
import com.poly.validator.ChangeInfoValidator;
import com.poly.validator.UserValidator;

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
	
	@Autowired
	UserValidator userValidator;
	
	@Autowired
	ChangeInfoValidator changeInfoValidator;
	
	@Autowired
	JavaMailSender sender;
	
	@Autowired
	ServletContext context;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		Object target = binder.getTarget();
		if (target == null) {
			return;
		}
		if(target.getClass() == User.class) {
			binder.setValidator(userValidator);
		}
		if(target.getClass() == ChangeInfoModel.class) {
			binder.setValidator(changeInfoValidator);
		}
	}
	
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
		
		List<User> listUser = udao.findActiveUsers();
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
				sessionService.setAttribute("user", user);
				if (remember) {
					cookieService.add("username", username, 10);
					cookieService.add("password", password, 10);
				} else {
					cookieService.delete("username");
					cookieService.delete("password");
				}
				String url = (String) sessionService.getAttribute("UrlSecure");
				if(url != null) {
					sessionService.removeAttribute("UrlSecure");
					sessionService.removeAttribute("message");
					sessionService.removeAttribute("login");
					System.out.println("redirect:/"+url);
					return "redirect:"+url;
				}else {
					return "redirect:/";
				}
			} else {
				sessionService.removeAttribute("username");
				sessionService.removeAttribute("user");
				sessionService.removeAttribute("fullname");
				model.addAttribute("message", "Sai mật khẩu!");
			}
		}else {
			model.addAttribute("message", "Không tìm thấy tài khoản!");
		}
		
		
		return "account/login";
	}
	
	@GetMapping("/account/register")
	public String register(Model model) {
		model.addAttribute("user", new User());
		return "account/register";
	}
	
	@PostMapping("/account/register")
	public String register2(@ModelAttribute("user")@Validated User user, BindingResult result, Model model) {
		if(!result.hasErrors()) {
			Boolean checkP = false;
			List<String> listP = udao.getAllPhones();
			
			
			Boolean checkE = false;
			List<String> listE = udao.getAllEmails();
			for (String email : listE) {
				if (email.equals(user.getEmail())) {
					checkE = true;
					model.addAttribute("message", "Đăng ký thất bại! Email đã tồn tại");
					break;
				}
			}
			
			for (String phone : listP) {
				if (phone.equals(user.getPhone())) {
					checkP = true;
					model.addAttribute("message", "Đăng ký thất bại! Số điện thoại đã tồn tại");
					break;
				}
			}
			Optional<User> oldUser = udao.findById(user.getId());
			if (!oldUser.isEmpty()) {
				model.addAttribute("message", "Đăng ký thất bại! Tên đăng nhập tồn tại");
			}else if (!checkE && !checkP) {
				user.setActive(true);
				user.setRole(false);
				udao.save(user);
				this.sendMailWelcome(user.getEmail());
				model.addAttribute("message", "Đăng ký thành công!");
			}
			
			
		}
		
		return "account/register";
	}
	
	@GetMapping("/account/forgot")
	public String forgot() {
		sessionService.removeAttribute("email");
		cookieService.delete("OTP");
		sessionService.removeAttribute("Change");
		return "account/forgot";
	}
	
	@PostMapping("/account/forgot")
	public String forgot2(RedirectAttributes redirectAttributes, Model model, @RequestParam("email") String email, @RequestParam("username") String username ) {
		User user = null;
		if(udao.findById(username).isPresent()) {
			user = udao.findById(username).get();
		}
		 
		if(user != null) {
			if(user.getEmail().equalsIgnoreCase(email)) {
				sessionService.setAttribute("email", user.getEmail());
				String OTP = generateOTP(6);
				System.out.println("OTP: "+OTP);
				cookieService.addOTP("OTP", OTP, 1);
				sessionService.setAttribute("username", username);
				sendMailOTP(user.getEmail(), OTP);
				return "redirect:/account/confirm";
			}else {
				model.addAttribute("message", "Email không hợp lệ");
			}
		}else {
			model.addAttribute("message", "Không tìm thấy tài khoản "+username);
		}
		
		return "account/forgot";
	}
	
	@GetMapping("/account/confirm")
	public String confirm(Model model) {
		String email = sessionService.getAttribute("email");
		
        model.addAttribute("email", maskEmail(email));
		return "account/confirm";
	}
	
	@PostMapping("/account/confirm")
	public String confirm2(Model model, @RequestParam("otp") String otpUser) {
		String OTP = cookieService.getValue("OTP");
        if(OTP != null) {
        	if(OTP.equals(otpUser)) {
        		cookieService.delete("OTP");
        		sessionService.setAttribute("Change", true);
        		return "redirect:/account/change";
        	}else {
				model.addAttribute("message", "OTP không hợp lệ");
				String email = (String) sessionService.getAttribute("email");
				model.addAttribute("email", maskEmail(email));
			}
        }else {
        	model.addAttribute("messageOTP", "OTP hết hạn");
		}
        
		return "account/confirm";
	}
	
	@GetMapping("/account/change")
	public String change() {
		return "account/change";
	}
	
	@PostMapping("/account/change")
	public String change2(Model model, @RequestParam("password") String password, @RequestParam("passwordConfirm") String passwordConfirm) {
		System.out.println("pl: "+password.length());
		if(password.length() >= 6) {
			if (password.equals(passwordConfirm)) {
				String username = sessionService.getAttribute("username");
				if (username != null) {
					User user = udao.findById(username).get();
					user.setPassword(password);
					udao.saveAndFlush(user);
					sessionService.removeAttribute("Change");
					model.addAttribute("messageSuccess", "Đổi mật khẩu thành công, bạn sẽ được chuyển hướng về trang đăng nhập.");
				} else {
					return "redirect:/account/forgot";
				}
			} else {
				model.addAttribute("message", "Mật khẩu xác nhận chưa chính xác");
			}
		}else {
			model.addAttribute("message", "Mật khẩu ít nhất 6 kí tự");
		}
		
		
		
		
		return "account/change";
	}
	
	@GetMapping("/account/editprofile")
	public String editprofile(Model model) {
		User userEdit = (User) sessionService.getAttribute("user");
		model.addAttribute("user", userEdit);
		return "account/editprofile";
	}
	
	@PostMapping("/account/editprofile")
	public String editprofile2(@ModelAttribute("user")@Validated ChangeInfoModel userChange, BindingResult result, Model model) {
		if (!result.hasErrors()) {
			
			System.out.println("Validated form");
			
			User currentUser = (User) sessionService.getAttribute("user");
			List<User> listU = udao.findAll();
			
			Boolean checkP = false;
			List<String> listP = listU.stream()
	                .filter(user -> !user.getId().equals(currentUser.getId()))
	                .map(User::getPhone)
	                .collect(Collectors.toList());
			
			
			Boolean checkE = false;
			List<String> listE = listU.stream()
	                .filter(user -> !user.getId().equals(currentUser.getId()))
	                .map(User::getEmail)
	                .collect(Collectors.toList());
			
			
			for (String email : listE) {
				if (email.equals(userChange.getEmail())) {
					checkE = true;
					model.addAttribute("message", "Cập nhật thất bại! Email đã tồn tại");
					break;
				}
			}
			
			for (String phone : listP) {
				if (phone.equals(userChange.getPhone())) {
					checkP = true;
					model.addAttribute("message", "Cập thất bại! Số điện thoại đã tồn tại");
					break;
				}
			}
			
			if(!checkE && !checkP) {
				User user = udao.getById(currentUser.getId());
				if (user != null) {
					user.setId(currentUser.getId());
					user.setFullname(userChange.getFullname());
					user.setEmail(userChange.getEmail());
					user.setBirthday(userChange.getBirthday());
					user.setPhone(userChange.getPhone());
					user.setAddress(userChange.getAddress());
					user.setGender(userChange.getGender());
					user.setPassword(currentUser.getPassword());
					user.setRole(currentUser.getRole());
					user.setActive(currentUser.getActive());
					udao.save(user);
					model.addAttribute("message", "Cập nhật thành công!");
				} else {
					model.addAttribute("message", "Cập nhật thất bại! Đã xảy ra lỗi!");
				}
			}

		} else {
			System.out.println("Not validated form");
		}
		return "account/editprofile";
	}
	
	@GetMapping("/account/logout")
	public String logout() {
		sessionService.removeAttribute("username");
		sessionService.removeAttribute("fullname");
		sessionService.removeAttribute("user");
		sessionService.removeAttribute("UrlSecure");
		sessionService.removeAttribute("message");
		sessionService.removeAttribute("login");
		return "redirect:/account/login";
	}
	
	@ModelAttribute("gender")
	public Map<Boolean, String> gender(){
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, "Nam");
		map.put(false, "Nữ");
		return map;
	}
	
	public void sendMailWelcome(String emailUser) {
		MailModel mail = new MailModel();
		mail.setTo(emailUser);
		mail.setSubject("Thư chào mừng");
		mail.setBody("<h1>Chúc mừng!</h1>\r\n"
				+ "    <p>Xin chào,</p>\r\n"
				+ "    <p>Cảm ơn bạn đã đăng ký thành công tài khoản trên website của chúng tôi. Bây giờ bạn có thể truy cập và sử dụng các tính năng của chúng tôi.</p>\r\n"
				+ "    <p>Hãy khám phá và tận hưởng trải nghiệm tuyệt vời trên website của chúng tôi!</p>\r\n"
				+ "    <p>Trân trọng,</p>\r\n"
				+ "    <p>Đội ngũ quản trị website</p>");
		MimeMessage message = sender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(mail.getFrom());
			helper.setTo(mail.getTo());
			helper.setSubject(mail.getSubject());
			helper.setText(mail.getBody(), true);
			helper.setReplyTo(mail.getFrom());
			for (String email : mail.getCc()) {
				helper.addCc(email);
			}
			
			for (String email : mail.getBcc()) {
				helper.addBcc(email);
			}

		} catch (MessagingException | IllegalStateException ex) {
			ex.printStackTrace();
			System.out.println("message: Gửi mail thất bại");
		}
		sender.send(message);
		System.out.println("message: Gửi mail thành công");
	}
	
	public void sendMailOTP(String emailUser, String OTP) {
		MailModel mail = new MailModel();
		mail.setTo(emailUser);
		mail.setSubject("Mã xác nhận");
		mail.setBody("<!DOCTYPE html>\r\n"
				+ "<html lang=\"en\">\r\n"
				+ "<head>\r\n"
				+ "    <meta charset=\"UTF-8\">\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
				+ "    <title>OTP</title>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "    <h1>Mã OTP của bạn</h1>\r\n"
				+ "    <p>Xin chào,</p>\r\n"
				+ "    <p>Dưới đây là mã OTP của bạn:</p>\r\n"
				+ "    <h3 style=\" color: cyan; width: fit-content;\"  >"+OTP+"</h3>\r\n"
				+ "    <p>Vui lòng sử dụng mã này để xác nhận đổi mật khẩu. <span style=\"color: red;\">Lưu ý mã có thời hạn trong 60 giây, không chia sẽ mã cho bất kì ai!</span></p>\r\n"
				+ "    <p>Trân trọng,</p>\r\n"
				+ "    <p>Đội ngũ hỗ trợ</p>\r\n"
				+ "</body>\r\n"
				+ "</html>");
		MimeMessage message = sender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(mail.getFrom());
			helper.setTo(mail.getTo());
			helper.setSubject(mail.getSubject());
			helper.setText(mail.getBody(), true);
			helper.setReplyTo(mail.getFrom());
			for (String email : mail.getCc()) {
				helper.addCc(email);
			}
			
			for (String email : mail.getBcc()) {
				helper.addBcc(email);
			}

		} catch (MessagingException | IllegalStateException ex) {
			ex.printStackTrace();
			System.out.println("message: Gửi mail thất bại");
		}
		sender.send(message);
		System.out.println("message: Gửi mail thành công");
	}
	
	public static String maskEmail(String email) {
        StringBuilder maskedEmailBuilder = new StringBuilder(email);
        int atIndex = email.indexOf("@");
        
        if (atIndex >= 3) {
            for (int i = 3; i < atIndex; i++) {
                maskedEmailBuilder.setCharAt(i, '*');
            }
        }
        
        return maskedEmailBuilder.toString();
    }
	
	public static String generateOTP(int length) {
        Random random = new Random();
        StringBuilder otpBuilder = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int digit = random.nextInt(10); // Tạo số ngẫu nhiên từ 0 đến 9
            otpBuilder.append(digit); // Thêm số vào chuỗi OTP
        }
        System.out.println(otpBuilder.toString());
        return otpBuilder.toString();
    }
}
