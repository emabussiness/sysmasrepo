package com.example.sysmas.controller;

import com.example.sysmas.model.UnidadMedida;
import com.example.sysmas.service.UnidadMedidaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/unidadesmedida")
public class UnidadMedidaController {

    @Autowired
    private UnidadMedidaService unidadMedidaService;

    @GetMapping
    public String listUnidadesMedida(Model model) {
        model.addAttribute("unidadesMedida", unidadMedidaService.findAll());
        return "unidadesmedida/list";
    }

    @GetMapping("/new")
    public String newUnidadMedidaForm(Model model) {
        model.addAttribute("unidadMedida", new UnidadMedida());
        return "unidadesmedida/form";
    }

    @PostMapping
    public String saveUnidadMedida(@ModelAttribute UnidadMedida unidadMedida) {
        unidadMedidaService.save(unidadMedida);
        return "redirect:/unidadesmedida";
    }

    @GetMapping("/edit/{id}")
    public String editUnidadMedidaForm(@PathVariable Long id, Model model) {
        unidadMedidaService.findById(id).ifPresent(unidadMedida -> model.addAttribute("unidadMedida", unidadMedida));
        return "unidadesmedida/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteUnidadMedida(@PathVariable Long id) {
        unidadMedidaService.deleteById(id);
        return "redirect:/unidadesmedida";
    }
}