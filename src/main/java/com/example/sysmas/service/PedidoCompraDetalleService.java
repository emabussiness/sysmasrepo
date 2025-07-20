package com.example.sysmas.service;

import com.example.sysmas.model.PedidoCompraDetalle;
import com.example.sysmas.repository.PedidoCompraDetalleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PedidoCompraDetalleService {

    @Autowired
    private PedidoCompraDetalleRepository pedidoCompraDetalleRepository;

    public List<PedidoCompraDetalle> findAll() {
        return pedidoCompraDetalleRepository.findAll();
    }

    public Optional<PedidoCompraDetalle> findById(Long id) {
        return pedidoCompraDetalleRepository.findById(id);
    }

    public PedidoCompraDetalle save(PedidoCompraDetalle pedidoCompraDetalle) {
        return pedidoCompraDetalleRepository.save(pedidoCompraDetalle);
    }

    public void deleteById(Long id) {
        pedidoCompraDetalleRepository.deleteById(id);
    }
}