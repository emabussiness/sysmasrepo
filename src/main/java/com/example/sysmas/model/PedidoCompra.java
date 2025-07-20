package com.example.sysmas.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "pedidos_compra")
public class PedidoCompra {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "proveedor_id")
    @NotNull(message = "El proveedor no puede ser nulo")
    private Proveedor proveedor;

    @NotNull(message = "La fecha de pedido no puede ser nula")
    private LocalDate fechaPedido;

    @NotNull(message = "El estado no puede ser nulo")
    @Size(max = 50, message = "El estado no puede exceder los 50 caracteres")
    private String estado;

    private String observaciones;

    @Column(name = "usuario_id")
    private Integer usuarioId;

    @OneToMany(mappedBy = "pedido", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<PedidoCompraDetalle> detallesPedidoCompra;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Proveedor getProveedor() {
        return proveedor;
    }

    public void setProveedor(Proveedor proveedor) {
        this.proveedor = proveedor;
    }

    public LocalDate getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(LocalDate fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Integer getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(Integer usuarioId) {
        this.usuarioId = usuarioId;
    }

    public List<PedidoCompraDetalle> getDetallesPedidoCompra() {
        return detallesPedidoCompra;
    }

    public void setDetallesPedidoCompra(List<PedidoCompraDetalle> detallesPedidoCompra) {
        this.detallesPedidoCompra = detallesPedidoCompra;
    }
}