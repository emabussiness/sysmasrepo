package com.example.sysmas.controller;

import com.example.sysmas.model.OrdenCompra;
import com.example.sysmas.service.OrdenCompraService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/ordenescompra")
public class OrdenCompraController {

    @Autowired
    private OrdenCompraService ordenCompraService;

    @GetMapping
    public String listOrdenesCompra(Model model) {
        List<OrdenCompra> ordenesCompra = ordenCompraService.findAll();
        model.addAttribute("ordenesCompra", ordenesCompra);
        return "ordenescompra/list";
    }

    @GetMapping("/new")
    public String showOrdenCompraForm(Model model) {
        model.addAttribute("ordenCompra", new OrdenCompra());
        return "ordenescompra/form";
    }

    @PostMapping
    public String saveOrdenCompra(@Valid @ModelAttribute("ordenCompra") OrdenCompra ordenCompra, BindingResult result) {
        if (result.hasErrors()) {
            return "ordenescompra/form";
        }
        ordenCompraService.save(ordenCompra);
        return "redirect:/ordenescompra";
    }

    @GetMapping("/edit/{id}")
    public String showEditOrdenCompraForm(@PathVariable Long id, Model model) {
        OrdenCompra ordenCompra = ordenCompraService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid orden compra Id:" + id));
        model.addAttribute("ordenCompra", ordenCompra);
        return "ordenescompra/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteOrdenCompra(@PathVariable Long id) {
        ordenCompraService.deleteById(id);
        return "redirect:/ordenescompra";
    }
}