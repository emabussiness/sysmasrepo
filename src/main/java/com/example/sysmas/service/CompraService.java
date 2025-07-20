package com.example.sysmas.service;

import com.example.sysmas.model.Compra;
import com.example.sysmas.model.DetalleCompra;
import com.example.sysmas.model.Producto;
import com.example.sysmas.repository.CompraRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class CompraService {

    @Autowired
    private CompraRepository compraRepository;

    @Autowired
    private DetalleCompraService detalleCompraService;

    @Autowired
    private ProductoService productoService;

    public List<Compra> findAll() {
        return compraRepository.findAll();
    }

    public Optional<Compra> findById(Long id) {
        return compraRepository.findById(id);
    }

    @Transactional
    public Compra save(Compra compra) {
        // Guardar la compra primero para obtener un ID si es nueva
        Compra savedCompra = compraRepository.save(compra);

        // Procesar los detalles de la compra
        if (compra.getDetallesCompra() != null) {
            for (DetalleCompra detalle : compra.getDetallesCompra()) {
                detalle.setCompra(savedCompra);
                // Calcular subtotal
                BigDecimal subtotal = detalle.getCantidad().multiply(detalle.getPrecioUnitario());
                detalle.setSubtotal(subtotal);
                detalleCompraService.save(detalle);


            }
        }
        return savedCompra;
    }

    public void deleteById(Long id) {
        compraRepository.deleteById(id);
    }
}