package com.example.sysmas.controller;

import com.example.sysmas.model.Producto;
import com.example.sysmas.service.ProductoService;
import com.example.sysmas.service.CategoriaService;
import com.example.sysmas.service.UnidadMedidaService;
import com.example.sysmas.service.TipoIVAService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/productos")
public class ProductoController {

    @Autowired
    private ProductoService productoService;
    @Autowired
    private CategoriaService categoriaService;
    @Autowired
    private UnidadMedidaService unidadMedidaService;
    @Autowired
    private TipoIVAService tipoIVAService;

    @GetMapping
    public String listProductos(Model model) {
        model.addAttribute("productos", productoService.findAll());
        return "productos/list";
    }

    @GetMapping("/new")
    public String showAddForm(Model model) {
        model.addAttribute("producto", new Producto());
        model.addAttribute("categorias", categoriaService.findAll());
        model.addAttribute("unidadesMedida", unidadMedidaService.findAll());
        model.addAttribute("tiposIVA", tipoIVAService.findAll());
        return "productos/form";
    }

    @PostMapping("/save")
    public String saveProducto(@ModelAttribute("producto") Producto producto) {
        productoService.save(producto);
        return "redirect:/productos";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        productoService.findById(id).ifPresent(producto -> model.addAttribute("producto", producto));
        model.addAttribute("categorias", categoriaService.findAll());
        model.addAttribute("unidadesMedida", unidadMedidaService.findAll());
        model.addAttribute("tiposIVA", tipoIVAService.findAll());
        return "productos/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteProducto(@PathVariable Long id) {
        productoService.deleteById(id);
        return "redirect:/productos";
    }
}