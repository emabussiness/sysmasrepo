package com.example.sysmas.controller;

import com.example.sysmas.model.Compra;
import com.example.sysmas.model.DetalleCompra;
import com.example.sysmas.model.Producto;
import com.example.sysmas.model.Proveedor;
import com.example.sysmas.service.CompraService;
import com.example.sysmas.service.OrdenCompraService;
import com.example.sysmas.service.ProductoService;
import com.example.sysmas.service.ProveedorService;
import com.example.sysmas.service.TipoDocumentoService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/compras")
public class CompraController {

    @Autowired
    private CompraService compraService;

    @Autowired
    private ProveedorService proveedorService;

    @Autowired
    private ProductoService productoService;

    @Autowired
    private OrdenCompraService ordenCompraService;

    @Autowired
    private TipoDocumentoService tipoDocumentoService;

    @GetMapping
    public String listCompras(Model model) {
        model.addAttribute("compras", compraService.findAll());
        return "compras/list";
    }

    @GetMapping("/new")
    public String showAddForm(Model model) {
        Compra compra = new Compra();
        compra.setFechaCompra(LocalDate.now());
        compra.setDetallesCompra(new ArrayList<>());
        model.addAttribute("compra", compra);
        model.addAttribute("proveedores", proveedorService.findAll());
        model.addAttribute("productos", productoService.findAll());
        model.addAttribute("ordenesCompra", ordenCompraService.findAll());
        model.addAttribute("tiposDocumento", tipoDocumentoService.findAll());
        return "compras/form";
    }

    @PostMapping("/save")
    public String saveCompra(@Valid @ModelAttribute("compra") Compra compra, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("proveedores", proveedorService.findAll());
            model.addAttribute("productos", productoService.findAll());
            model.addAttribute("ordenesCompra", ordenCompraService.findAll());
            model.addAttribute("tiposDocumento", tipoDocumentoService.findAll());
            return "compras/form";
        }

        BigDecimal total = BigDecimal.ZERO;
        for (DetalleCompra detalle : compra.getDetallesCompra()) {
            // Ensure product is loaded if only ID is present
            if (detalle.getProducto() != null && detalle.getProducto().getId() != null) {
                Optional<Producto> productoOptional = productoService.findById(detalle.getProducto().getId());
                if (productoOptional.isPresent()) {
                    Producto producto = productoOptional.get();
                    detalle.setProducto(producto);
                    detalle.setPrecioUnitario(producto.getPrecioReferencia());
                    BigDecimal subtotal = detalle.getCantidad().multiply(detalle.getPrecioUnitario());
                    detalle.setSubtotal(subtotal);
                    total = total.add(subtotal);
                } else {
                    // Handle case where product is not found (e.g., add a validation error)
                    result.rejectValue("detallesCompra", "error.compra", "Producto no encontrado para el detalle.");
                    model.addAttribute("proveedores", proveedorService.findAll());
                    model.addAttribute("productos", productoService.findAll());
                    model.addAttribute("ordenesCompra", ordenCompraService.findAll());
                    model.addAttribute("tiposDocumento", tipoDocumentoService.findAll());
                    return "compras/form";
                }
            }
        }
        compra.setTotal(total.doubleValue()); // Convert BigDecimal total to Double for Compra entity
        compraService.save(compra);
        return "redirect:/compras";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        compraService.findById(id).ifPresent(compra -> {
            model.addAttribute("compra", compra);
            model.addAttribute("proveedores", proveedorService.findAll());
            model.addAttribute("productos", productoService.findAll());
            model.addAttribute("ordenesCompra", ordenCompraService.findAll());
            model.addAttribute("tiposDocumento", tipoDocumentoService.findAll());
        });
        return "compras/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteCompra(@PathVariable Long id) {
        compraService.deleteById(id);
        return "redirect:/compras";
    }

    @PostMapping("/add-detalle")
    public String addDetalle(@ModelAttribute("compra") Compra compra, Model model) {
        if (compra.getDetallesCompra() == null) {
            compra.setDetallesCompra(new ArrayList<>());
        }
        compra.getDetallesCompra().add(new DetalleCompra());
        model.addAttribute("proveedores", proveedorService.findAll());
        model.addAttribute("productos", productoService.findAll());
        model.addAttribute("ordenesCompra", ordenCompraService.findAll());
        model.addAttribute("tiposDocumento", tipoDocumentoService.findAll());
        return "compras/form";
    }
}