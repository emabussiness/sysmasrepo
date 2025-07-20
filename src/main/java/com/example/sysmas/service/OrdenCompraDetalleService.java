package com.example.sysmas.service;

import com.example.sysmas.model.OrdenCompraDetalle;
import com.example.sysmas.repository.OrdenCompraDetalleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrdenCompraDetalleService {

    @Autowired
    private OrdenCompraDetalleRepository ordenCompraDetalleRepository;

    public List<OrdenCompraDetalle> findAll() {
        return ordenCompraDetalleRepository.findAll();
    }

    public Optional<OrdenCompraDetalle> findById(Long id) {
        return ordenCompraDetalleRepository.findById(id);
    }

    public OrdenCompraDetalle save(OrdenCompraDetalle ordenCompraDetalle) {
        return ordenCompraDetalleRepository.save(ordenCompraDetalle);
    }

    public void deleteById(Long id) {
        ordenCompraDetalleRepository.deleteById(id);
    }
}