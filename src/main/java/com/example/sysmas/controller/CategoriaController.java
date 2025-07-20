package com.example.sysmas.controller;

import com.example.sysmas.model.Categoria;
import com.example.sysmas.service.CategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/categorias")
public class CategoriaController {

    @Autowired
    private CategoriaService categoriaService;

    @GetMapping
    public String listCategorias(Model model) {
        model.addAttribute("categorias", categoriaService.findAll());
        return "categorias/list";
    }

    @GetMapping("/new")
    public String newCategoriaForm(Model model) {
        model.addAttribute("categoria", new Categoria());
        return "categorias/form";
    }

    @PostMapping
    public String saveCategoria(@ModelAttribute Categoria categoria) {
        categoriaService.save(categoria);
        return "redirect:/categorias";
    }

    @GetMapping("/edit/{id}")
    public String editCategoriaForm(@PathVariable Long id, Model model) {
        categoriaService.findById(id).ifPresent(categoria -> model.addAttribute("categoria", categoria));
        return "categorias/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteCategoria(@PathVariable Long id) {
        categoriaService.deleteById(id);
        return "redirect:/categorias";
    }
}