package com.example.sysmas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {
    
    @GetMapping("/login")
    public String showLoginForm() {
        return "auth/login";
    }
    
    @GetMapping("/dashboard")
    public String showDashboard() {
        return "dashboard/index";
    }
}