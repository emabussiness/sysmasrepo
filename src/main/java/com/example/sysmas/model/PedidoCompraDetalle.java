package com.example.sysmas.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;

@Entity
@Table(name = "pedidos_compra_detalles")
public class PedidoCompraDetalle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "pedido_id")
    @NotNull(message = "El pedido de compra no puede ser nulo")
    private PedidoCompra pedido;

    @ManyToOne
    @JoinColumn(name = "producto_id")
    @NotNull(message = "El producto no puede ser nulo")
    private Producto producto;

    @NotNull(message = "La cantidad no puede ser nula")
    private BigDecimal cantidad;

    @NotNull(message = "El precio estimado no puede ser nulo")
    private BigDecimal precioEstimado;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public PedidoCompra getPedido() {
        return pedido;
    }

    public void setPedido(PedidoCompra pedido) {
        this.pedido = pedido;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public BigDecimal getCantidad() {
        return cantidad;
    }

    public void setCantidad(BigDecimal cantidad) {
        this.cantidad = cantidad;
    }

    public BigDecimal getPrecioEstimado() {
        return precioEstimado;
    }

    public void setPrecioEstimado(BigDecimal precioEstimado) {
        this.precioEstimado = precioEstimado;
    }
}