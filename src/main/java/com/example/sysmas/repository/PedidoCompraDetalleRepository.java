package com.example.sysmas.repository;

import com.example.sysmas.model.PedidoCompraDetalle;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PedidoCompraDetalleRepository extends JpaRepository<PedidoCompraDetalle, Long> {
}