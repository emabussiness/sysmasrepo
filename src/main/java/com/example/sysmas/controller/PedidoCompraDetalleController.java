package com.example.sysmas.controller;

import com.example.sysmas.model.PedidoCompraDetalle;
import com.example.sysmas.service.PedidoCompraDetalleService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/pedidoscompradetalle")
public class PedidoCompraDetalleController {

    @Autowired
    private PedidoCompraDetalleService pedidoCompraDetalleService;

    @GetMapping
    public String listPedidosCompraDetalle(Model model) {
        List<PedidoCompraDetalle> pedidosCompraDetalle = pedidoCompraDetalleService.findAll();
        model.addAttribute("pedidosCompraDetalle", pedidosCompraDetalle);
        return "pedidoscompradetalle/list";
    }

    @GetMapping("/new")
    public String showPedidoCompraDetalleForm(Model model) {
        model.addAttribute("pedidoCompraDetalle", new PedidoCompraDetalle());
        return "pedidoscompradetalle/form";
    }

    @PostMapping
    public String savePedidoCompraDetalle(@Valid @ModelAttribute("pedidoCompraDetalle") PedidoCompraDetalle pedidoCompraDetalle, BindingResult result) {
        if (result.hasErrors()) {
            return "pedidoscompradetalle/form";
        }
        pedidoCompraDetalleService.save(pedidoCompraDetalle);
        return "redirect:/pedidoscompradetalle";
    }

    @GetMapping("/edit/{id}")
    public String showEditPedidoCompraDetalleForm(@PathVariable Long id, Model model) {
        PedidoCompraDetalle pedidoCompraDetalle = pedidoCompraDetalleService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid pedido compra detalle Id:" + id));
        model.addAttribute("pedidoCompraDetalle", pedidoCompraDetalle);
        return "pedidoscompradetalle/form";
    }

    @GetMapping("/delete/{id}")
    public String deletePedidoCompraDetalle(@PathVariable Long id) {
        pedidoCompraDetalleService.deleteById(id);
        return "redirect:/pedidoscompradetalle";
    }
}