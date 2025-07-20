package com.example.sysmas.service;

import com.example.sysmas.model.DetalleCompra;
import com.example.sysmas.repository.DetalleCompraRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DetalleCompraService {

    @Autowired
    private DetalleCompraRepository detalleCompraRepository;

    public List<DetalleCompra> findAll() {
        return detalleCompraRepository.findAll();
    }

    public Optional<DetalleCompra> findById(Long id) {
        return detalleCompraRepository.findById(id);
    }

    public DetalleCompra save(DetalleCompra detalleCompra) {
        return detalleCompraRepository.save(detalleCompra);
    }

    public void deleteById(Long id) {
        detalleCompraRepository.deleteById(id);
    }
}