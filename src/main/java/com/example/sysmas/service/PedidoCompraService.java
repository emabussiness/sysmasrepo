package com.example.sysmas.service;

import com.example.sysmas.model.PedidoCompra;
import com.example.sysmas.repository.PedidoCompraRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PedidoCompraService {

    @Autowired
    private PedidoCompraRepository pedidoCompraRepository;

    public List<PedidoCompra> findAll() {
        return pedidoCompraRepository.findAll();
    }

    public Optional<PedidoCompra> findById(Long id) {
        return pedidoCompraRepository.findById(id);
    }

    public PedidoCompra save(PedidoCompra pedidoCompra) {
        return pedidoCompraRepository.save(pedidoCompra);
    }

    public void deleteById(Long id) {
        pedidoCompraRepository.deleteById(id);
    }
}