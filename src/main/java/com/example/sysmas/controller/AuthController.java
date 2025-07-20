package com.example.sysmas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {
    
    @GetMapping("/login")
    public String showLoginForm() {
        return "auth/login";
    }
    
    @PostMapping("/login")
    public String processLogin() {
        return "redirect:/dashboard";
    }
    
    @GetMapping("/dashboard")
    public String showDashboard() {
        return "dashboard/index";
    }
}