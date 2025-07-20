package com.example.sysmas.controller;

import com.example.sysmas.model.PedidoCompra;
import com.example.sysmas.service.PedidoCompraService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/pedidoscompra")
public class PedidoCompraController {

    @Autowired
    private PedidoCompraService pedidoCompraService;

    @GetMapping
    public String listPedidosCompra(Model model) {
        List<PedidoCompra> pedidosCompra = pedidoCompraService.findAll();
        model.addAttribute("pedidosCompra", pedidosCompra);
        return "pedidoscompra/list";
    }

    @GetMapping("/new")
    public String showPedidoCompraForm(Model model) {
        model.addAttribute("pedidoCompra", new PedidoCompra());
        return "pedidoscompra/form";
    }

    @PostMapping
    public String savePedidoCompra(@Valid @ModelAttribute("pedidoCompra") PedidoCompra pedidoCompra, BindingResult result) {
        if (result.hasErrors()) {
            return "pedidoscompra/form";
        }
        pedidoCompraService.save(pedidoCompra);
        return "redirect:/pedidoscompra";
    }

    @GetMapping("/edit/{id}")
    public String showEditPedidoCompraForm(@PathVariable Long id, Model model) {
        PedidoCompra pedidoCompra = pedidoCompraService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid pedido compra Id:" + id));
        model.addAttribute("pedidoCompra", pedidoCompra);
        return "pedidoscompra/form";
    }

    @GetMapping("/delete/{id}")
    public String deletePedidoCompra(@PathVariable Long id) {
        pedidoCompraService.deleteById(id);
        return "redirect:/pedidoscompra";
    }
}