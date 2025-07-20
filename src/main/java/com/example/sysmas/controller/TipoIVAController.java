package com.example.sysmas.controller;

import com.example.sysmas.model.TipoIVA;
import com.example.sysmas.service.TipoIVAService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/tiposiva")
public class TipoIVAController {

    @Autowired
    private TipoIVAService tipoIVAService;

    @GetMapping
    public String listTiposIVA(Model model) {
        model.addAttribute("tiposIVA", tipoIVAService.findAll());
        return "tiposiva/list";
    }

    @GetMapping("/new")
    public String newTipoIVAForm(Model model) {
        model.addAttribute("tipoIVA", new TipoIVA());
        return "tiposiva/form";
    }

    @PostMapping
    public String saveTipoIVA(@ModelAttribute TipoIVA tipoIVA) {
        tipoIVAService.save(tipoIVA);
        return "redirect:/tiposiva";
    }

    @GetMapping("/edit/{id}")
    public String editTipoIVAForm(@PathVariable Long id, Model model) {
        tipoIVAService.findById(id).ifPresent(tipoIVA -> model.addAttribute("tipoIVA", tipoIVA));
        return "tiposiva/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteTipoIVA(@PathVariable Long id) {
        tipoIVAService.deleteById(id);
        return "redirect:/tiposiva";
    }
}