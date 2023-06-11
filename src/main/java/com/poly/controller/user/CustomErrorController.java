package com.poly.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class CustomErrorController implements ErrorController {

    @RequestMapping
    public String handleError(HttpServletRequest request) {
        // Xử lý và trả về trang lỗi tùy chỉnh
        return "page-not-found";
    }

    public String getErrorPath() {
        return "/error";
    }
}








