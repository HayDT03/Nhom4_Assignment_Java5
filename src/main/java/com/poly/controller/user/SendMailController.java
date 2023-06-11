package com.poly.controller.user;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.poly.model.MailModel;

@Controller
public class SendMailController {
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	JavaMailSender sender;
	
	@Autowired
	ServletContext context;
	
	
	public void sendMailWelcome(Model m) {
		MailModel mail = new MailModel();
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
}
