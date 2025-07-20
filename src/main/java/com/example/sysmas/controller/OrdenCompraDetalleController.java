package com.example.sysmas.controller;

import com.example.sysmas.model.OrdenCompraDetalle;
import com.example.sysmas.service.OrdenCompraDetalleService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/ordenescompradetalle")
public class OrdenCompraDetalleController {

    @Autowired
    private OrdenCompraDetalleService ordenCompraDetalleService;

    @GetMapping
    public String listOrdenesCompraDetalle(Model model) {
        List<OrdenCompraDetalle> ordenesCompraDetalle = ordenCompraDetalleService.findAll();
        model.addAttribute("ordenesCompraDetalle", ordenesCompraDetalle);
        return "ordenescompradetalle/list";
    }

    @GetMapping("/new")
    public String showOrdenCompraDetalleForm(Model model) {
        model.addAttribute("ordenCompraDetalle", new OrdenCompraDetalle());
        return "ordenescompradetalle/form";
    }

    @PostMapping
    public String saveOrdenCompraDetalle(@Valid @ModelAttribute("ordenCompraDetalle") OrdenCompraDetalle ordenCompraDetalle, BindingResult result) {
        if (result.hasErrors()) {
            return "ordenescompradetalle/form";
        }
        ordenCompraDetalleService.save(ordenCompraDetalle);
        return "redirect:/ordenescompradetalle";
    }

    @GetMapping("/edit/{id}")
    public String showEditOrdenCompraDetalleForm(@PathVariable Long id, Model model) {
        OrdenCompraDetalle ordenCompraDetalle = ordenCompraDetalleService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid orden compra detalle Id:" + id));
        model.addAttribute("ordenCompraDetalle", ordenCompraDetalle);
        return "ordenescompradetalle/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteOrdenCompraDetalle(@PathVariable Long id) {
        ordenCompraDetalleService.deleteById(id);
        return "redirect:/ordenescompradetalle";
    }
}