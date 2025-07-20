package com.example.sysmas.controller;

import com.example.sysmas.model.TipoDocumento;
import com.example.sysmas.service.TipoDocumentoService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/tiposdocumento")
public class TipoDocumentoController {

    @Autowired
    private TipoDocumentoService tipoDocumentoService;

    @GetMapping
    public String listTiposDocumento(Model model) {
        List<TipoDocumento> tiposDocumento = tipoDocumentoService.findAll();
        model.addAttribute("tiposDocumento", tiposDocumento);
        return "tiposdocumento/list";
    }

    @GetMapping("/new")
    public String showTipoDocumentoForm(Model model) {
        model.addAttribute("tipoDocumento", new TipoDocumento());
        return "tiposdocumento/form";
    }

    @PostMapping
    public String saveTipoDocumento(@Valid @ModelAttribute("tipoDocumento") TipoDocumento tipoDocumento, BindingResult result) {
        if (result.hasErrors()) {
            return "tiposdocumento/form";
        }
        tipoDocumentoService.save(tipoDocumento);
        return "redirect:/tiposdocumento";
    }

    @GetMapping("/edit/{id}")
    public String showEditTipoDocumentoForm(@PathVariable Long id, Model model) {
        TipoDocumento tipoDocumento = tipoDocumentoService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid tipo documento Id:" + id));
        model.addAttribute("tipoDocumento", tipoDocumento);
        return "tiposdocumento/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteTipoDocumento(@PathVariable Long id) {
        tipoDocumentoService.deleteById(id);
        return "redirect:/tiposdocumento";
    }
}