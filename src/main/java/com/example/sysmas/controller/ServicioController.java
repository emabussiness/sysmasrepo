package com.example.sysmas.controller;

import com.example.sysmas.model.Servicio;
import com.example.sysmas.model.DetalleServicio;
import com.example.sysmas.model.Cliente;
import com.example.sysmas.service.ServicioService;
import com.example.sysmas.service.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/servicios")
public class ServicioController {

    @Autowired
    private ServicioService servicioService;

    @Autowired
    private ClienteService clienteService;

    @GetMapping
    public String listServicios(Model model) {
        model.addAttribute("servicios", servicioService.findAll());
        return "servicios/list";
    }

    @GetMapping("/new")
    public String showAddForm(Model model) {
        Servicio servicio = new Servicio();
        servicio.setFechaRecepcion(LocalDate.now());
        servicio.setDetallesServicio(new ArrayList<>());
        model.addAttribute("servicio", servicio);
        model.addAttribute("clientes", clienteService.findAll());
        return "servicios/form";
    }

    @PostMapping("/save")
    public String saveServicio(@ModelAttribute("servicio") Servicio servicio) {
        servicio.getDetallesServicio().forEach(detalle -> detalle.setServicio(servicio));
        servicioService.save(servicio);
        return "redirect:/servicios";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        servicioService.findById(id).ifPresent(servicio -> {
            model.addAttribute("servicio", servicio);
            model.addAttribute("clientes", clienteService.findAll());
        });
        return "servicios/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteServicio(@PathVariable Long id) {
        servicioService.deleteById(id);
        return "redirect:/servicios";
    }

    @PostMapping("/add-detalle")
    public String addDetalle(@ModelAttribute("servicio") Servicio servicio, Model model) {
        if (servicio.getDetallesServicio() == null) {
            servicio.setDetallesServicio(new ArrayList<>());
        }
        servicio.getDetallesServicio().add(new DetalleServicio());
        model.addAttribute("clientes", clienteService.findAll());
        return "servicios/form";
    }
}