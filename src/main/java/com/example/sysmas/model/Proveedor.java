package com.example.sysmas.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import lombok.Data;

@Data
@Entity
@Table(name = "proveedores")
public class Proveedor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nombre;
    private String ruc;
    private String direccion;
    private String telefono;
    private String email;
    private String contacto;
    @Column(name = "plazo_entrega_dias")
    private Integer plazoEntregaDias;
    @Column(name = "condiciones_pago")
    private String condicionesPago;
    @Column(name = "usuario_id")
    private Integer usuarioId;
}