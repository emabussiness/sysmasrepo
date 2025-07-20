package com.example.sysmas.controller;

import com.example.sysmas.model.Proveedor;
import com.example.sysmas.service.ProveedorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/proveedores")
public class ProveedorController {

    @Autowired
    private ProveedorService proveedorService;

    @GetMapping
    public String listProveedores(Model model) {
        model.addAttribute("proveedores", proveedorService.findAll());
        return "proveedores/list";
    }

    @GetMapping("/new")
    public String showAddForm(Model model) {
        model.addAttribute("proveedor", new Proveedor());
        return "proveedores/form";
    }

    @PostMapping("/save")
    public String saveProveedor(@ModelAttribute("proveedor") Proveedor proveedor) {
        proveedorService.save(proveedor);
        return "redirect:/proveedores";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        proveedorService.findById(id).ifPresent(proveedor -> model.addAttribute("proveedor", proveedor));
        return "proveedores/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteProveedor(@PathVariable Long id) {
        proveedorService.deleteById(id);
        return "redirect:/proveedores";
    }
}